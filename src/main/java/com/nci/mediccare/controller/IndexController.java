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

    @GetMapping("/hello")
    public String hello(){
        return "index";
    }
}
