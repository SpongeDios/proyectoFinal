package com.hector.cinturonnegro.controllers;


import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.services.ComunaService;
import com.hector.cinturonnegro.services.RegionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ComunaController {
    private final ComunaService comunaService;
    private final RegionService regionService;

    public ComunaController(ComunaService comunaService, RegionService regionService) {
        this.comunaService = comunaService;
        this.regionService = regionService;
    }

//    @GetMapping("/")
//    public String comunas(
//            @RequestParam("nombre")String nombre, Model model){
//        Region regions = regionService.findByNameRegion(nombre);
//        List<Comuna> comunas = comunaService.encontrarComunasPorRegion(regions.getId());
//        model.addAttribute("comunas", comunas);
//        return "home.jsp";
//    }

}
