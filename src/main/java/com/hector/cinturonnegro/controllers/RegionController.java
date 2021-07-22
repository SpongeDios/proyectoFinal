package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.services.RegionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class RegionController {
    private final RegionService regionService;

    public RegionController(RegionService regionService){
        this.regionService = regionService;
    }

    @GetMapping("/metropolitana")
    public String indexMetropolitana(Model model) {
        List<Region> regiones = regionService.regionList("Metropolitana");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/arica")
    public String indexAP(Model model) {
        List<Region> regiones = regionService.regionList("Arica y Parinacota");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/tarapaca")
    public String indexTarapaca(Model model) {
        List<Region> regiones = regionService.regionList("Tarapaca");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/antofagasta")
    public String indexAntofagasta(Model model) {
        List<Region> regiones = regionService.regionList("Antofagasta");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/atacama")
    public String indexAtacama(Model model) {
        List<Region> regiones = regionService.regionList("Atacama");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/coquimbo")
    public String indexCoquimbo(Model model) {
        List<Region> regiones = regionService.regionList("Coquimbo");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/valparaiso")
    public String indexValparaiso(Model model) {
        List<Region> regiones = regionService.regionList("Valparaiso");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/ohiggins")
    public String indexOhiggins(Model model) {
        List<Region> regiones = regionService.regionList("O'Higgins");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/maule")
    public String indexMaule(Model model) {
        List<Region> regiones = regionService.regionList("Maule");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/nuble")
    public String indexNuble(Model model) {
        List<Region> regiones = regionService.regionList("Ñuble");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/biobio")
    public String indexBiobio(Model model) {
        List<Region> regiones = regionService.regionList("Biobio");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/araucania")
    public String indexAraucania(Model model) {
        List<Region> regiones = regionService.regionList("Araucania");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/rios")
    public String indexRios(Model model) {
        List<Region> regiones = regionService.regionList("Rios");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/lagos")
    public String indexLagos(Model model) {
        List<Region> regiones = regionService.regionList("Lagos");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/aysen")
    public String indexAysen(Model model) {
        List<Region> regiones = regionService.regionList("Aysen");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }

    @GetMapping("/magallanes")
    public String indexMagallanes(Model model) {
        List<Region> regiones = regionService.regionList("Magallanes");
        model.addAttribute("regiones",regiones);
        return "/home.jsp";
    }



}
