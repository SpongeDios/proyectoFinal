package com.hector.cinturonnegro.controllers;


import com.hector.cinturonnegro.services.ComunaService;
import org.springframework.stereotype.Controller;


@Controller
public class ComunaController {
    private final ComunaService comunaService;

    public ComunaController(ComunaService comunaService){
        this.comunaService = comunaService;
    }

}
