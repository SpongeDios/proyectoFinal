package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.services.ComunaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class IndexController {
    private final ComunaService comunaService;

    public IndexController(ComunaService comunaService) {
        this.comunaService = comunaService;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Metropolitana");
        model.addAttribute("comunas", comunas);
        return "/home.jsp";
    }

}
