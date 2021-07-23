package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.*;
import com.hector.cinturonnegro.services.*;
import org.dom4j.rule.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class AdminController {
    private final UserService userService;
    private final PublicationService publicationService;
    private final FeedbackService feedbackService;
    private final ComunaService comunaService;
    private final RegionService regionService;
    private final CategoryService categoryService;

    //admin == userRol => 3


    public AdminController(UserService userService, PublicationService publicationService, FeedbackService feedbackService, ComunaService comunaService, RegionService regionService, CategoryService categoryService) {
        this.userService = userService;
        this.publicationService = publicationService;
        this.feedbackService = feedbackService;
        this.comunaService = comunaService;
        this.regionService = regionService;
        this.categoryService = categoryService;
    }

    @GetMapping("/admin")
    public String admin(HttpSession session, Model model){
        if(session.getAttribute("userid") == null) {
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            return "admin.jsp";
        }
    }

    @GetMapping("/admin/allusers")
    public String adminAllUsers(HttpSession session, Model model){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            List<User> users = userService.allData();
            model.addAttribute("data", users);
            return "adminData.jsp";
        }
    }

    @GetMapping("/admin/allpublications")
    public String adminAllPublications(HttpSession session, Model model){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            List<Publication> publications = publicationService.allData();
            model.addAttribute("data", publications);
            return "adminData.jsp";
        }
    }


    @GetMapping("/admin/{idUsuario}/createAdmin")
    public String addAdmin(
            HttpSession session,
            @PathVariable("idUsuario") Long idUsuario
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            User adminNew = userService.findById(idUsuario);
            adminNew.setRol(3);
            userService.update(adminNew);
            return "redirect:/admin";
        }
    }

    @GetMapping("/admin/{idPublicacion}/borrarpublicacion")
    public String deletePublicacion(
            HttpSession session,
            @PathVariable("idPulicacion") Long idPublicacion
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            Publication publication = publicationService.findById(idPublicacion);
            publication.setCategory(null);
            publication.setUser(null);
            for (Feedback feedback : publication.getFeedback()) {
                feedbackService.delete(feedback.getId());
            }
            publicationService.delete(publication.getId());
            return "redirect:/admin";
        }

    }

    /////////////////////////////////////////////////////////////
    ////////////////////////CREAR COMUNA/////////////////////////
    /////////////////////////////////////////////////////////////

    @GetMapping("/admin/comunas")
    public String allComuna(
            HttpSession session,
            Model model
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        } else{
            List<Comuna> allData = comunaService.allData();
            model.addAttribute("data", allData);
            return "adminData.jsp";
        }
    }

    @GetMapping("/admin/comunas/new")
    public String comunaForm(
            HttpSession session,
            Model model,
            @ModelAttribute("comuna") Comuna comuna
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            List<Region> regiones = regionService.allData();
            model.addAttribute("regiones", regiones);
            return "newComunaAdmin.jsp";
        }
    }

    @PostMapping("/admin/comunas/new")
    public String addComuna(
            @Valid @ModelAttribute("comuna") Comuna comuna,
            BindingResult result,
            Model model
    ){
        if(result.hasErrors()){
            return "newComunaAdmin.jsp";
        }else{
            List<Region> regiones = regionService.allData();
            model.addAttribute("regiones", regiones);
            comunaService.create(comuna);
            return "redirect:/admin/comunas";
        }
    }

    /////////////////////////////////////////////////////////////
    ////////////////////////CREAR REGION/////////////////////////
    /////////////////////////////////////////////////////////////

    @GetMapping("/admin/regiones")
    public String allRegions(
            HttpSession session,
            Model model
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            List<Region> regiones = regionService.allData();
            model.addAttribute("data", regiones);
            return "adminData.jsp";
        }
    }

    @GetMapping("/admin/regiones/new")
    public String formRegion(HttpSession session, Model model, @ModelAttribute("region") Region region){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            return "newRegionAdmin.jsp";
        }
    }

    @PostMapping("/admin/regiones/new")
    public String addRegion(
            @Valid @ModelAttribute("region") Region region,
            BindingResult result
    ){
        if(result.hasErrors()){
            return "newRegionAdmin.jsp";
        }else{
            regionService.create(region);
            return "redirect:/admin/regiones";
        }
    }

    /////////////////////////////////////////////////////////////
    ////////////////////////CREAR CATEGORY///////////////////////
    /////////////////////////////////////////////////////////////

    @GetMapping("/admin/categories")
    public String allCategories(HttpSession session, Model model){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            List<Category> categories = categoryService.allData();
            model.addAttribute("data", categories);
            return "adminData.jsp";
        }
    }

    @GetMapping("/admin/categories/new")
    public String categoryForm(HttpSession session, @ModelAttribute("category") Category category){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        if(user.getRol() != 3){
            return "redirect:/publicaciones";
        }else{
            return "newCategoryAdmin.jsp";
        }
    }

    @PostMapping("/admin/categories/new")
    public String addCategory(
            @Valid @ModelAttribute("category") Category category,
            BindingResult result
    ){
        if(result.hasErrors()){
            return "newCategoryAdmin.jsp";
        }else{
            categoryService.create(category);
            return "redirect:/admin/categories";
        }
    }










}
