package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.services.ComunaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {
    private final ComunaService comunaService;

    public IndexController(ComunaService comunaService) {
        this.comunaService = comunaService;
    }

    @GetMapping("/index")
    public String index() {
        return "index.jsp";
    }

}
