package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Feedback;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.FeedbackService;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    private final UserService userService;
    private final PublicationService publicationService;
    private final FeedbackService feedbackService;

    //admin == userRol => 3

    public AdminController(UserService userService, PublicationService publicationService, FeedbackService feedbackService) {
        this.userService = userService;
        this.publicationService = publicationService;
        this.feedbackService = feedbackService;
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

}
