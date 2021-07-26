package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Message;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.MessageService;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class MessageController {
    private final MessageService messageService;
    private final UserService userService;
    private final PublicationService publicationService;

    public MessageController(MessageService messageService, UserService userService, PublicationService publicationService) {
        this.messageService = messageService;
        this.userService = userService;
        this.publicationService = publicationService;
    }


    @PostMapping("/publicaciones/{idPublicacion}")
    public String messages(@Valid @ModelAttribute("message")Message message,
                           BindingResult result,
                           @PathVariable("idPublicacion")Long idPublicacion,
                           HttpSession session){
        Publication publication = publicationService.findById(idPublicacion);
        Long userId = (Long) session.getAttribute("userid");
        User user = userService.findById(userId);
        if (result.hasErrors()){
            return "publicacionPorId.jsp";
        }else {
            messageService.create(message);
            message.setUser(user);
            message.setPublication(publication);
            messageService.create(message);
            return "redirect:/publicaciones/"+idPublicacion;
        }
    }

    //////////////////////////////////////////////////////////////////
    ///////////////////////Respuesta//////////////////////////////////
    //////////////////////////////////////////////////////////////////

    @GetMapping("/publicaciones/{idPublicacion}/{idMessage}")
    public String responder(@ModelAttribute("respuesta")Message respuesta,
                            @PathVariable("idMessage")Long idMessage,
                            Model model){
        Message message = messageService.findById(idMessage);
        model.addAttribute("message", message);
        return "respuesta.jsp";
    }

    @PostMapping("/publicaciones/{idPublicacion}/{idMessage}/responder")
    public String responderConsulta(@Valid @ModelAttribute("respuesta")Message respuesta,
                            BindingResult result,
                            @PathVariable("idPublicacion")Long idPublicacion,
                            @PathVariable("idMessage")Long idMessage,
                            HttpSession session){
        Publication publication = publicationService.findById(idPublicacion);
        Long userId = (Long) session.getAttribute("userid");
        User user = userService.findById(userId);
        Message message = messageService.findById(idMessage);
        if (result.hasErrors()){
            return "publicacionPorId.jsp";
        }else
            if (user.getId() != publication.getUser().getId()){
                return "redirect:/publicaciones/"+publication.getId()+"/"+message.getId();
            }else {
                messageService.create(respuesta);
                respuesta.setUser(user);
                message.setRespuesta(respuesta);
                respuesta.setPublication(publication);
                messageService.update(message);
                messageService.create(respuesta);
                return "redirect:/publicaciones/"+publication.getId();
            }
    }
}
