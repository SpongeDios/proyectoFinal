package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.*;
import com.hector.cinturonnegro.services.*;
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
import java.util.List;

@Controller
public class PublicacionesController {
    private final UserService userService;
    private final PublicationService publicationService;
    private final CategoryService categoryService;
    private final FeedbackService feedbackService;
    private final MessageService messageService;

    public PublicacionesController(UserService userService, PublicationService publicationService, CategoryService categoryService, FeedbackService feedbackService, MessageService messageService) {
        this.userService = userService;
        this.publicationService = publicationService;
        this.categoryService = categoryService;
        this.feedbackService = feedbackService;
        this.messageService = messageService;
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
            Model model,
            @ModelAttribute("message")Message message,
            @ModelAttribute("feedback")Feedback feedback
            ){
        Long userId = (Long) session.getAttribute("userid");
        User user = userService.findById(userId);
        Publication publication = publicationService.findById(idPublicacion);
        List<Message> messageList = publication.getMessages();
        List<Feedback> feedbacks = publication.getFeedback();
        User creatorP = publication.getUser();
        List<Publication> publicationList = creatorP.getPublications();
        int suma = 0;
        int promedio = 0;
        int contador = 0;
        for (Publication p: publicationList) {
            List<Feedback> feedbackList = p.getFeedback();
            for (Feedback f: feedbackList) {
                int ratingF = f.getRating();
                suma += ratingF;
            }
            contador += p.getFeedback().size();
        }
        if (suma == 0){
            contador = 1;
        }
        promedio = suma / contador;
        model.addAttribute("ratingF", promedio);
        model.addAttribute("user", user);
        model.addAttribute("feedbacks", feedbacks);
        model.addAttribute("messageList", messageList);
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
            List<Category> categories = categoryService.allData();
            model.addAttribute("categories", categories);
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
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            int carpetaPubl = publicationService.allData().size() + 1;
            String name = file.getOriginalFilename();
            if (!file.isEmpty() && file.getSize() < 1048576) {
                File directorio = new File("src/main/resources/static/archivos/" + user.getId() + "/" + carpetaPubl);//Reemplazar 1 por user.getId()
                if(!directorio.exists()){
                    directorio.mkdirs();
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath()+"/"+name)));
                    stream.write(bytes);
                    publication.setPhoto_publication("/archivos/" + user.getId() + "/" + carpetaPubl + "/" + name);
                    stream.close();
                    System.out.println("You successfully uploaded " + name + "!");
                } catch (Exception e) {
                    System.out.println("You failed to upload " + name + " => " + e.getMessage());
                }
            } else {
                System.out.println("You failed to upload " + name + " because the file was empty.");
            }
            publication.setUser(user);
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
            for(Message message: publication.getMessages()){
                messageService.delete(message.getId());
            }
            publicationService.delete(idPublicaciones);
            return "redirect:/publicaciones";
        }
    }










}
