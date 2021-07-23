package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.services.ComunaService;
import com.hector.cinturonnegro.services.PublicationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IndexController {
    private final ComunaService comunaService;
    private final PublicationService publicationService;

    public IndexController(ComunaService comunaService, PublicationService publicationService) {
        this.comunaService = comunaService;
        this.publicationService = publicationService;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Metropolitana");
        model.addAttribute("comunas", comunas);
        return "/home.jsp";
    }
    @GetMapping("/index")
    public String index() {
        return "index.jsp";
    }

    @GetMapping("/search")
    public String searchArtist(Model model, @RequestParam("busqueda") String title){
        List<Publication> publicacion = publicationService.publicationList(title);
        model.addAttribute("publicacion", publicacion);
        model.addAttribute("busqueda", title);
        return "allPublicaciones.jsp";
    }

}
