package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Category;
import com.hector.cinturonnegro.models.Feedback;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.CategoryService;
import com.hector.cinturonnegro.services.FeedbackService;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
public class PublicacionesController {
    private final UserService userService;
    private final PublicationService publicationService;
    private final CategoryService categoryService;
    private final FeedbackService feedbackService;

    public PublicacionesController(UserService userService, PublicationService publicationService, CategoryService categoryService, FeedbackService feedbackService) {
        this.userService = userService;
        this.publicationService = publicationService;
        this.categoryService = categoryService;
        this.feedbackService = feedbackService;
    }

    ////tipo 1 -> Prestar servicios
    ////tipo 2 -> Buscar servicios

    @GetMapping("/publicaciones")
    public String allPublicaciones(Model model, HttpSession session){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }else{
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            model.addAttribute("user", user);
            return "allPublicaciones.jsp";
        }
    }

    /////////////////////////////////////////////////////////
    /////////////////publicaciones por id////////////////////
    /////////////////////////////////////////////////////////

    @GetMapping("/publicaciones/{idPublicacion}")
    public String publicacionPorId(
            @PathVariable("idPublicacion") Long idPublicacion,
            HttpSession session,
            Model model
    ){
        Publication publication = publicationService.findById(idPublicacion);
        model.addAttribute("publication", publication);
        return "publicacionPorId.jsp";
    }


    /////////////////////////////////////////////////////////
    ///////////////////Crear publicacion/////////////////////
    /////////////////////////////////////////////////////////

    @GetMapping("/publicaciones/add")
    public String publicaciones(
            @ModelAttribute("publication") Publication publication,
            HttpSession session,
            Model model
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        } else{
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            model.addAttribute("user", user);
            return "addpublicacion.jsp";
        }
    }

    @PostMapping("/publicaciones/add")
    public String addPublicacion(
            @Valid @ModelAttribute("publication") Publication publication,
            BindingResult result,
            HttpSession session,
            Model model,
            @RequestParam("file") MultipartFile file
    ){
        if(result.hasErrors()){
            return "addpublicacion.jsp";
        } else{
            Category category = new Category();
            category.setName("ceramica");
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            publication.setCategory(category);
            String name = file.getOriginalFilename();
            if (!file.isEmpty()) {
                File directorio = new File("archivos/" + user.getId());//Reemplazar 1 por user.getId()
                if(!directorio.exists()){
                    directorio.mkdirs();
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath()+"/"+name)));
                    stream.write(bytes);
                    stream.close();
                    System.out.println("You successfully uploaded " + name + "!");
                } catch (Exception e) {
                    System.out.println("You failed to upload " + name + " => " + e.getMessage());
                }
            } else {
                System.out.println("You failed to upload " + name + " because the file was empty.");
            }
            model.addAttribute("user", user);
            publication.setUser(user);
            categoryService.create(category);
            publicationService.create(publication);
            return "redirect:/publicaciones";
        }
    }

    ///////////////////////////////////////////////////////////
    ///////////////////////Editar//////////////////////////////
    ///////////////////////////////////////////////////////////

    @GetMapping("/publicaciones/{idPublicacion}/edit")
    public String formPublicacion(
            @PathVariable("idPublicacion") Long idPublicacion,
            HttpSession session,
            Model model,
            @ModelAttribute("publication") Publication publication
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        Publication p = publicationService.findById(idPublicacion);
        if(user.getPublications().contains(p) == false){
            return "redirect:/";
        }else{
            model.addAttribute("p", p);
            return "editarPublicacion.jsp";
        }
    }

    @PutMapping("/publicaciones/{idPublicacion}/edit")
    public String editPublicacion(
            @PathVariable("idPublicacion") Long idPublicacion,
            @Valid @ModelAttribute("publication") Publication publication,
            BindingResult result,
            Model model
    ){
        if(result.hasErrors()){
            return "editarPublicacion.jsp";
        }else{
            Publication p = publicationService.findById(idPublicacion);
            model.addAttribute("p", p);
            p.setTitle(publication.getTitle());
            p.setDescription(publication.getDescription());
            p.setPrice(publication.getPrice());
            p.setType_publication(publication.getType_publication());
            p.setCategory(publication.getCategory());
            publicationService.update(p);
            return "redirect:/publicaciones/"+idPublicacion;
        }
    }

    //////////////////////////////////////////////////////////
    ///////////////////Borrar publicacion/////////////////////
    //////////////////////////////////////////////////////////

    @GetMapping("/publicaciones/{idPublicaciones}/delete")
    public String deletePublicacion(@PathVariable("idPublicaciones") Long idPublicaciones, HttpSession session){
        if(session.getAttribute("userid") == null){
            return "redirect:/login";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        Publication publication = publicationService.findById(idPublicaciones);
        if(user.getPublications().contains(publication) == false){
            return "redirect:/";
        }else{
            for (Feedback feedback: publication.getFeedback()) {
                feedbackService.delete(feedback.getId());
            }
            publicationService.delete(idPublicaciones);
            return "redirect:/publicaciones";
        }
    }










}
