package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.services.ComunaService;
import com.hector.cinturonnegro.services.RegionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class RegionController {
    private final RegionService regionService;
    private final ComunaService comunaService;

    public RegionController(RegionService regionService, ComunaService comunaService){
        this.regionService = regionService;
        this.comunaService = comunaService;
    }

}
