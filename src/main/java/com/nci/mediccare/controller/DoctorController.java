package com.nci.mediccare.controller;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.manager.UserManager;
import com.nci.mediccare.pojo.UserPojo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.nci.mediccare.domain.User.USER_TYPE_DOCTOR;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Resource
    private UserManager userManager;

    @GetMapping("/login")
    public String doctorLogin() {
        return "page/doctor-login";
    }

    @PostMapping("/loginProcess")
    public String loginProcess(@ModelAttribute UserPojo userPojo, Model model) {
        userPojo.setType(USER_TYPE_DOCTOR);
        User user = userManager.loginProcess(userPojo);

        if (user != null) {
            return "redirect:/cases?id=" + user.getId();
        }

        model.addAttribute("errorMessage", "Incorrect username or password");
        return "page/doctor-login";
    }

    @GetMapping("/register")
    public String doctorRegister() {
        return "page/doctor-register";
    }

    @PostMapping("/registerProcess")
    public String registerProcess(@ModelAttribute User user, Model model) {
        UserPojo userPojo = new UserPojo();
        userPojo.setUsername(user.getUsername());
        userPojo.setType(USER_TYPE_DOCTOR);
        User oldUser = userManager.selectByNameAndType(userPojo);

        if (oldUser != null) {
            model.addAttribute("errorMessage", "Account already exists");
            return "page/doctor-register";
        }

        user.setType(USER_TYPE_DOCTOR);
        user = userManager.register(user);

        return "redirect:/cases?id=" + user.getId();
    }
}
