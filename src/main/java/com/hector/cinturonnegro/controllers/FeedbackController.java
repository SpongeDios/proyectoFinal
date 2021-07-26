package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Feedback;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.User;
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
public class FeedbackController {
    private final FeedbackService feedbackService;
    private final UserService userService;
    private final PublicationService publicationService;

    public FeedbackController(FeedbackService feedbackService, UserService userService, PublicationService publicationService) {
        this.feedbackService = feedbackService;
        this.userService = userService;
        this.publicationService = publicationService;
    }

    @GetMapping("/publicaciones/{idPublicacion}/feedback")
    public String feedback(@ModelAttribute("feedback")Feedback feedback,
                            @PathVariable("idPublicacion")Long idPublicacion,
                           HttpSession session,
                           Model model){
        Publication publication = publicationService.findById(idPublicacion);
        if (session.getAttribute("userid") == null){
            return "redirect:/";
        }else {
            model.addAttribute("publication", publication);
            return "publicacionPorId.jsp.jsp";
        }

    }


    @PostMapping("/publicaciones/{idPublicacion}/feedback")
    public String feedbackCreate(@Valid @ModelAttribute("feedback")Feedback feedback,
                           BindingResult result,
                           @PathVariable("idPublicacion")Long idPublicacion,
                           HttpSession session,
                           @RequestParam("file") MultipartFile file){
        Publication publication = publicationService.findById(idPublicacion);
        Long userId = (Long) session.getAttribute("userid");
        User user = userService.findById(userId);
        if (result.hasErrors()){
            return "publicacionPorId.jsp";
        }else{
            feedbackService.create(feedback);
            feedback.setUser(user);
            feedback.setPublication(publication);
            String name = file.getOriginalFilename();
            if (!file.isEmpty() && file.getSize() < 1048576) {
                File directorio = new File("src/main/resources/static/archivos/" + publication.getUser().getId() + "/" + publication.getId() + "/feedbacks");
                if(!directorio.exists()){
                    directorio.mkdirs();
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath()+"/"+name)));
                    stream.write(bytes);
                    feedback.setPhoto_feedback("/archivos/" + publication.getUser().getId() + "/" + publication.getId() + "/feedbacks/" + name);
                    stream.close();
                    System.out.println("You successfully uploaded " + name + "!");
                } catch (Exception e) {
                    System.out.println("You failed to upload " + name + " => " + e.getMessage());
                }
            } else {
                System.out.println("You failed to upload " + name + " because the file was empty.");
            }

            feedbackService.create(feedback);
            return "redirect:/publicaciones/"+publication.getId();
        }

    }
}
