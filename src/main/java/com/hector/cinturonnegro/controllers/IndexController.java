package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.*;
import com.hector.cinturonnegro.services.*;
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
    private final CategoryService categoryService;

    public IndexController(ComunaService comunaService, UserService userService, RegionService regionService, PublicationService publicationService, CategoryService categoryService) {
        this.comunaService = comunaService;
        this.userService = userService;
        this.regionService = regionService;
        this.publicationService = publicationService;
        this.categoryService = categoryService;
    }

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        if (session.getAttribute("userid") == null){
            List<Region> regiones = regionService.allData();
            List<Category> categorias = categoryService.allData();
            model.addAttribute("categorias", categorias);
            model.addAttribute("regiones", regiones);

            HashMap<Long, HashMap<String, Object>> regioneshash = new HashMap<>();
            for (Region region: regiones) {

                HashMap<Long, String> comunashash = new HashMap<>();
                for (Comuna comuna : region.getComunas()) {
                    comunashash.put(comuna.getId(), comuna.getNameComuna());
                }
                regioneshash.put(region.getId(), new HashMap<>());
                regioneshash.get(region.getId()).put("nombre", region.getNameRegion());
                regioneshash.get(region.getId()).put("comunas", comunashash);
            }
            JSONObject regionesObject = new JSONObject(regioneshash);
            model.addAttribute("regionesObject", regionesObject);
            return "/home.jsp";
        }else {
            Long userId = (Long) session.getAttribute("userid");
            User user = userService.findById(userId);
            List<Region> regiones = regionService.allData();
            List<Category> categorias = categoryService.allData();
            model.addAttribute("categorias", categorias);
            model.addAttribute("regiones", regiones);
            model.addAttribute("user", user);
            return "/home.jsp";
        }
    }

    @GetMapping("/buscador/{region}")
    public String buscadorPorRegion(
            @PathVariable("region") String region,
            Model model
    ){
        List<Publication> publicacionPorRegion = publicationService.ouroHenrry(region);
        model.addAttribute("publicacionPorRegion", publicacionPorRegion);
        Region r = regionService.findByNameRegion(region);
        List<Comuna> comunas = comunaService.findByRegion(r);
        model.addAttribute("comunasRegion", comunas);
        return "buscador.jsp";
    }
    @GetMapping("/buscador/{region}/{comuna}")
    public String buscador(
            @PathVariable(value = "region", required = false) String region,
            @PathVariable(value = "comuna", required = false) String comuna,
            HttpSession session,
            Model model
    ){
        List<Publication> publicacionPorComuna = publicationService.publicacionesPorComuna(comuna);
        Region r = regionService.findByNameRegion(region);
        List<Comuna> comunas = comunaService.encontrarComunasPorRegion(r.getId());
        model.addAttribute("comunasRegion", comunas);
        model.addAttribute("publicacionPorComuna", publicacionPorComuna);
        return "buscadorComuna.jsp";
    }

    @GetMapping("buscador/categoria/{idCategoria}")
    public String buscadorCategoria(
            @PathVariable("idCategoria") Long idCategoria,
            Model model
    ){
        Category category = categoryService.findById(idCategoria);
        List<Publication> publicacionesPorCategoria = publicationService.publicacionesPorCategoria(category);
        model.addAttribute("publicacionesPorCategoria", publicacionesPorCategoria);
        return "buscadorPorCategoria.jsp";
    }




}
