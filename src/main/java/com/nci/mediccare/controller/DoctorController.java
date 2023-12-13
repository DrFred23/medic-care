package com.nci.mediccare.controller;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.manager.RegisterManager;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Resource
    private RegisterManager registerManager;

    @GetMapping("/login")
    public String doctorLogin() {
        return "page/doctor-login";
    }

    @GetMapping("/register")
    public String doctorRegister() {
        return "page/doctor-register";
    }

    @PostMapping("/process")
    public String registerProcess(@ModelAttribute User user, Model model) {
        user.setType(User.USER_TYPE_DOCTOR);
        user = registerManager.register(user);

        return "redirect:/cases?id=" + user.getId();
    }
}
