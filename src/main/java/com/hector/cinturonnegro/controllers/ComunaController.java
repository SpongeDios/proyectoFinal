package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.services.ComunaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ComunaController {
    private final ComunaService comunaService;

    public ComunaController(ComunaService comunaService){
        this.comunaService = comunaService;
    }

    @GetMapping("/metropolitana")
    public String indexMetropolitana(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Metropolitana");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/arica")
    public String indexAP(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Arica y Parinacota");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/tarapaca")
    public String indexTarapaca(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Tarapaca");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/antofagasta")
    public String indexAntofagasta(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Antofagasta");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/atacama")
    public String indexAtacama(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Atacama");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/coquimbo")
    public String indexCoquimbo(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Coquimbo");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/valparaiso")
    public String indexValparaiso(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Valparaiso");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/ohiggins")
    public String indexOhiggins(Model model) {
        List<Comuna> comunas = comunaService.comunaList("O'Higgins");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/maule")
    public String indexMaule(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Maule");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/nuble")
    public String indexNuble(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Ñuble");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/biobio")
    public String indexBiobio(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Biobio");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/araucania")
    public String indexAraucania(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Araucania");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/rios")
    public String indexRios(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Rios");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/lagos")
    public String indexLagos(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Lagos");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/aysen")
    public String indexAysen(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Aysen");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

    @GetMapping("/magallanes")
    public String indexMagallanes(Model model) {
        List<Comuna> comunas = comunaService.comunaList("Magallanes");
        model.addAttribute("comunas",comunas);
        return "/home.jsp";
    }

}
