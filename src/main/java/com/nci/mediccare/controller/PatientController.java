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
@RequestMapping("/patient")
public class PatientController {

    @Resource
    private RegisterManager registerManager;

    @GetMapping("/login")
    public String patientLogin(){
        return "page/patient-login";
    }

    @GetMapping("/register")
    public String patientRegister(){
        return "page/patient-register";
    }

    @PostMapping("/process")
    public String registerProcess(@ModelAttribute User user, Model model) {
        user.setType(User.USER_TYPE_PATIENT);
        user = registerManager.register(user);

        return "redirect:/cases?id=" + user.getId();
    }
}
