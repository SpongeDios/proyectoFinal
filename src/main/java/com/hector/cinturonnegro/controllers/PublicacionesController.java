package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class PublicacionesController {
    private final UserService userService;
    private final PublicationService publicationService;

    public PublicacionesController(UserService userService, PublicationService publicationService) {
        this.userService = userService;
        this.publicationService = publicationService;
    }


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
            Model model
    ){
        if(result.hasErrors()){
            return "addpublicacion.jsp";
        } else{
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            model.addAttribute("user", user);
            publication.setUser(user);
            publicationService.create(publication);
            return "redirect:/publicaciones";
        }
    }


}
