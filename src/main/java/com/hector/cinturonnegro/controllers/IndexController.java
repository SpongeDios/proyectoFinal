package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.ComunaService;
import com.hector.cinturonnegro.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {
    private final ComunaService comunaService;
    private final UserService userService;

    public IndexController(ComunaService comunaService, UserService userService) {
        this.comunaService = comunaService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        if (session.getAttribute("userid") == null){
            List<Comuna> comunas = comunaService.comunaList("Metropolitana");
            model.addAttribute("comunas", comunas);
            return "/home.jsp";
        }else {
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            List<Comuna> comunas = comunaService.comunaList("Metropolitana");
            model.addAttribute("comunas", comunas);
            model.addAttribute("user", user);
            return "/home.jsp";
        }
    }


}
