package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    private final UserService userService;

    //admin == userRol => 3

    public AdminController(UserService userService) {
        this.userService = userService;
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
            List<User> allUser = userService.allData();
            model.addAttribute("allUser", allUser);
            return "admin.jsp";
        }
    }

}
