package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Message;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.MessageService;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
}
