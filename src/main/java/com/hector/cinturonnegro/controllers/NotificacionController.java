package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Notificacion;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.NotificacionService;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
public class NotificacionController {
    private final UserService userService;
    private final PublicationService publicationService;
    private final NotificacionService notificacionService;

    public NotificacionController(UserService userService, PublicationService publicationService, NotificacionService notificacionService) {
        this.userService = userService;
        this.publicationService = publicationService;
        this.notificacionService = notificacionService;
    }

    @GetMapping("/perfil/notificaciones")
    public String allNotificaciones(Model model, HttpSession session){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUser = (Long) session.getAttribute("userid");
        User user = userService.findById(idUser);
        model.addAttribute("notificaciones", user.getNotificacions());
        return "notificaciones.jsp";
    }



    @GetMapping("/notificacion/{idPublicacion}/{idUserLogueado}")
    public String pushNotification(
            @PathVariable("idPublicacion") Long idPublicacion,
            @PathVariable("idUserLogueado") Long idUserLogueado,
            HttpSession session
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Publication publication = publicationService.findById(idPublicacion);
        User user = userService.findById(idUserLogueado);
        Notificacion notificacion = new Notificacion();
        notificacion.setContenido("El usuario "+ user.getFirstName() + "ha escrito algo en tu publicacion "+ publication.getTitle());
        notificacion.setUser(user);
        notificacionService.update(notificacion);
        return "redirect:/publicaciones/"+idPublicacion;
    }

}
