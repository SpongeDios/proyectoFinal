package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.ComunaService;
import com.hector.cinturonnegro.services.PublicationService;
import com.hector.cinturonnegro.services.RegionService;
import com.hector.cinturonnegro.services.UserService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class IndexController {
    private final ComunaService comunaService;
    private final UserService userService;
    private final RegionService regionService;
    private final PublicationService publicationService;

    public IndexController(ComunaService comunaService, UserService userService, RegionService regionService, PublicationService publicationService) {
        this.comunaService = comunaService;
        this.userService = userService;
        this.regionService = regionService;
        this.publicationService = publicationService;
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
            List<Region> regiones = regionService.allData();
            JSONObject regionesObject = new JSONObject();
            System.out.println(regionesObject);
            for (Region region: regiones) {
                JSONObject comunasJson = new JSONObject();
                regionesObject.append(region.getNameRegion(), comunasJson);
                for (Comuna comuna: region.getComunas()) {
                    comunasJson.append("comunas", comuna.getNameComuna());
                }
            }
            System.out.println(regionesObject);
            model.addAttribute("regiones", regionesObject);
            model.addAttribute("user", user);
            return "/home.jsp";
        }
    }

    @GetMapping("/{region}")
    public String buscadorPorRegion(
            @PathVariable("region") String region,
            Model model
    ){
        List<Publication> publicacionPorRegion = publicationService.ouroHenrry(region);
        model.addAttribute("publicacionPorRegion", publicacionPorRegion);
        return "buscador.jsp";
    }



    @GetMapping("/{region}/{comuna}")
    public String buscador(
            @PathVariable(value = "region", required = false) String region,
            @PathVariable(value = "comuna", required = false) String comuna,
            HttpSession session,
            Model model
    ){
        List<Publication> publicacionPorComuna = publicationService.publicacionesPorComuna(comuna);
        model.addAttribute("publicacionPorComuna", publicacionPorComuna);
        return "buscador.jsp";
    }
}
