package com.hector.cinturonnegro.controllers;

import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.services.UserService;
import com.hector.cinturonnegro.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserController {
    private final UserValidator userValidator;
    private final UserService userService;

    public UserController(UserValidator userValidator, UserService userService) {
        this.userValidator = userValidator;
        this.userService = userService;
    }

    //ROL = 1 => Prestador de servicios
    //ROL = 2 => Buscador de servicios

    ///////////////////////////////////////////////////////
    ///////////////////////REGISTRATION////////////////////
    ///////////////////////////////////////////////////////

    @GetMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user, HttpSession session){
        if(session.getAttribute("userid") != null){
            return "redirect:/index";
        } else {
            return "registration.jsp";
        }
    }

    @PostMapping("/registration")
    public String registerUser(
            @Valid @ModelAttribute("user") User user,
            BindingResult result,
            HttpSession session
    ){
        userValidator.validate(user, result);
        if(result.hasErrors()){
            return "registration.jsp";
        }
        if(userService.emailExist(user.getEmail())){
            FieldError error = new FieldError("email", "email", "El email "+ user.getEmail() + " ya se encuentra registrado");
            result.addError(error);
            return "registration.jsp";
        } else {
            User u = userService.registerUser(user);
            session.setAttribute("userid", u.getId());
            return "redirect:/index";
        }
    }

    ////////////////////////////////////////////////////
    /////////////////////LOGIN/////////////////////////
    ///////////////////////////////////////////////////

    @GetMapping("/login")
    public String loginForm(HttpSession session){
        if(session.getAttribute("userid") != null){
            return "redirect:/index";
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
     ){
        if(userService.autenticarUsuario(email, password)){
            User user = userService.findUserByEmail(email);
            session.setAttribute("userid", user.getId());
            return "redirect:/index";
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
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}
