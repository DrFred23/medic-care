package com.nci.mediccare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * IndexController
 *
 * @Author: Alfred
 * @CreateTime: 2023-10-15
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/doctor/login")
    public String doctorLogin(){
        return "page/doctor-login";
    }
    @GetMapping("/doctor/register")
    public String doctorRegister(){
        return "page/doctor-register";
    }

    @GetMapping("/patient/login")
    public String patientLogin(){
        return "page/patient-login";
    }

    @GetMapping("/patient/register")
    public String patientRegister(){
        return "page/patient-register";
    }
}
