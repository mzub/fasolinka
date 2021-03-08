package xyz.mzub.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/")
public class MainController {

    @GetMapping
    public String getMainPage(Model model, Principal principal) {
        model.addAttribute("loginedUser", principal.getName());
        return "dashboard";
    }
}
