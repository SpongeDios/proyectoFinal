package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.services.RegionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class RegionController {
    private final RegionService regionService;

    public RegionController(RegionService regionService){
        this.regionService = regionService;
    }
    @GetMapping("/regiones/{idRegion}/search/")
    public String regionesSearch(
            @RequestParam("search")String regions, Model model){
        List<Region> Regiones = regionService.regionList(regions);
        model.addAttribute("regions", regions);
        return"regiones.jsp";
    }



}
