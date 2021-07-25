package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.Address;
import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.AddressService;
import com.hector.cinturonnegro.services.ComunaService;
import com.hector.cinturonnegro.services.RegionService;
import com.hector.cinturonnegro.services.UserService;
import com.hector.cinturonnegro.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
public class UserController {
    private final UserValidator userValidator;
    private final UserService userService;
    private final ComunaService comunaService;
    private final RegionService regionService;
    private final AddressService addressService;

    public UserController(UserValidator userValidator, UserService userService, ComunaService comunaService, RegionService regionService, AddressService addressService) {
        this.userValidator = userValidator;
        this.userService = userService;
        this.comunaService = comunaService;
        this.regionService = regionService;
        this.addressService = addressService;
    }

    //ROL = 1 => Prestador de servicios
    //ROL = 2 => Buscador de servicios

    ///////////////////////////////////////////////////////
    ///////////////////////REGISTRATION////////////////////
    ///////////////////////////////////////////////////////

    @GetMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user, HttpSession session, Model model) {
        if (session.getAttribute("userid") != null) {
            return "redirect:/index";
        } else {
            model.addAttribute("regiones", regionService.allData());
            model.addAttribute("comunas", comunaService.allData());
            return "registration.jsp";
        }
    }

    @PostMapping("/registration")
    public String registerUser(
            @Valid @ModelAttribute("user") User user,
            BindingResult result,
            HttpSession session,
            @RequestParam("file") MultipartFile file
    ) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registration.jsp";
        }
        if (userService.emailExist(user.getEmail())) {
            FieldError error = new FieldError("email", "email", "El email " + user.getEmail() + " ya se encuentra registrado");
            result.addError(error);
            return "registration.jsp";
        } else {
            int userPhoto = userService.allData().size() + 1;
            String name = file.getOriginalFilename();
            if (!file.isEmpty() && file.getSize() < 1048576) {
                File directorio = new File("src/main/resources/static/archivos/" + userPhoto + "/perfil");
                if(!directorio.exists()){
                    directorio.mkdirs();
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath()+"/"+name)));
                    stream.write(bytes);
                    user.setPhoto("/archivos/" + userPhoto + "/perfil" + "/" + name);
                    stream.close();
                    System.out.println("You successfully uploaded " + name + "!");
                } catch (Exception e) {
                    System.out.println("You failed to upload " + name + " => " + e.getMessage());
                }
            } else {
                System.out.println("You failed to upload " + name + " because the file was empty.");
            }
            Address address = new Address();
            address.setNameCalle(user.getAddress().getNameCalle());
            address.setComuna(user.getAddress().getComuna());
            addressService.update(address);
            user.setAddress(address);
            User u = userService.registerUser(user);
            session.setAttribute("userid", u.getId());
            return "redirect:/";
        }
    }

    ////////////////////////////////////////////////////
    /////////////////////LOGIN/////////////////////////
    ///////////////////////////////////////////////////

    @GetMapping("/login")
    public String loginForm(HttpSession session) {
        if (session.getAttribute("userid") != null) {
            return "redirect:/";
        } else {
            return "login.jsp";
        }
    }

    @PostMapping("/login")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model,
            HttpSession session
    ) {
        if (userService.autenticarUsuario(email, password)) {
            User user = userService.findUserByEmail(email);
            session.setAttribute("userid", user.getId());
            return "redirect:/";
        } else {
            String error = "Credenciales incorrectas";
            session.setAttribute("error", error);
            return "redirect:/login";
        }
    }

    ////////////////////////////////////////////////////
    //////////////LOGOUT////////////////////////////////
    //////////////////////////////////////////////////

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    /////////////////////////////////////////////////////
    //////////////////////PERFIL////////////////////////
    ////////////////////////////////////////////////////

    @GetMapping("/perfil/{idUser}")
    public String perfilUser(@PathVariable("idUser") Long idUser,Model model, HttpSession session) {
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long userId = (Long) session.getAttribute("userid");
        User user = userService.findById(userId);
        if(user.getId() != idUser){
            return "redirect:/";
        }else{
            model.addAttribute("user", user);
            return "perfilUsuario.jsp";
        }
    }

    ////////////////////EDITAR PERFIL/////////////////////
    @GetMapping("/perfil/{idUser}/editar")
    public String editUserForm(
            @PathVariable("idUser") Long idUser,
            @ModelAttribute("user") User user,
            HttpSession session,
            Model model
    ){
        if(session.getAttribute("userid") == null){
            return "redirect:/";
        }
        Long idUserLog = (Long) session.getAttribute("userid");
        User userLog = userService.findById(idUserLog);
        if(userLog.getId() != idUser){
            return "redirect:/";
        }else{
            model.addAttribute("regiones", regionService.allData());
            model.addAttribute("comunas", comunaService.allData());
            model.addAttribute("user", userLog);
            return "editUser.jsp";
        }
    }

    @PutMapping("/perfil/{idUser}/editar")
    public String updateUser(
            @Valid @ModelAttribute("user") User user,
            BindingResult result,
            @PathVariable("idUser") Long idUser,
            Model model,
            @RequestParam("file") MultipartFile file
    ){
        if(result.hasErrors()){
            return "editUser.jsp";
        }else{
            User userLog = userService.findById(idUser);
            model.addAttribute("user", userLog);
            userLog.setFirstName(user.getFirstName());
            userLog.setLastName(user.getLastName());
            userLog.setRol(user.getRol());
            userLog.setPhone(user.getPhone());
            String name = file.getOriginalFilename();
            if (!file.isEmpty() && file.getSize() < 1048576) {
                File directorio = new File("src/main/resources/static/archivos/" + userLog.getId() + "/perfil");
                if(!directorio.exists()){
                    directorio.mkdirs();
                }
                try {
                    byte[] bytes = file.getBytes();
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(directorio.getAbsolutePath()+"/"+name)));
                    stream.write(bytes);
                    userLog.setPhoto("/archivos/" + userLog.getId() + "/perfil" + "/" + name);
                    stream.close();
                    System.out.println("You successfully uploaded " + name + "!");
                } catch (Exception e) {
                    System.out.println("You failed to upload " + name + " => " + e.getMessage());
                }
            } else {
                System.out.println("You failed to upload " + name + " because the file was empty.");
            }
            userService.update(userLog);
            return "redirect:/perfil/"+idUser;
        }
    }


}