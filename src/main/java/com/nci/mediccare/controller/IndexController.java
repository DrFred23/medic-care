package com.nci.mediccare.controller;

import com.nci.mediccare.domain.CaseInfo;
import com.nci.mediccare.domain.User;
import com.nci.mediccare.manager.CasesManager;
import com.nci.mediccare.manager.UserManager;
import com.nci.mediccare.pojo.CaseInfoPojo;
import com.nci.mediccare.pojo.DoctorCasePojo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

import static com.nci.mediccare.domain.User.USER_TYPE_DOCTOR;

@Controller
public class IndexController {

    @Resource
    private UserManager userManager;

    @Resource
    private CasesManager casesManager;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/cases")
    public String cases(@RequestParam long id, Model model) {
        User user = userManager.selectById(id);
        model.addAttribute("user", user);

        List<CaseInfo> caseInfos;
        if (user.getType() == USER_TYPE_DOCTOR) {
            caseInfos = casesManager.selectAllCases();
            List<User> users = userManager.selectAllPatients();
            model.addAttribute("allUsers", users);
        } else {
            caseInfos = casesManager.selectCasesByPatientId(user.getId());
        }
        model.addAttribute("caseInfos", caseInfos);

        return "page/cases";
    }

    @ResponseBody
    @GetMapping("/search")
    public List<CaseInfo> search(@RequestParam String patientName) {
        return casesManager.selectCasesByPatientName(patientName);
    }

    @PostMapping("/createCase")
    public String createCase(@RequestParam long userId, @ModelAttribute CaseInfoPojo pojo) {
        User patient = userManager.selectById(pojo.getPatientId());
        CaseInfo caseInfo = new CaseInfo();
        caseInfo.setCreateTime(new Date());
        caseInfo.setStatus(pojo.getStatus());
        caseInfo.setDisease(pojo.getDisease());
        caseInfo.setRemarks(pojo.getRemarks());
        caseInfo.setPatientId(pojo.getPatientId());
        caseInfo.setDob(patient.getDob());
        caseInfo.setGender(patient.getGender());
        caseInfo.setPatientName(patient.getUsername());
        casesManager.insert(caseInfo);

        return "redirect:/cases?id=" + userId;
    }

    @PostMapping("/editCase")
    public String editCase(@RequestParam long userId, @RequestParam long caseId, @ModelAttribute CaseInfoPojo pojo) {
        CaseInfo caseInfo = casesManager.selectById(caseId);
        User patient = userManager.selectById(pojo.getPatientId());
        if (caseInfo == null || patient == null) {
            return "redirect:/cases?id=" + userId;
        }

        caseInfo.setUpdateTime(new Date());
        caseInfo.setStatus(pojo.getStatus());
        caseInfo.setDisease(pojo.getDisease());
        caseInfo.setRemarks(pojo.getRemarks());
        caseInfo.setPatientId(pojo.getPatientId());
        caseInfo.setPatientName(patient.getUsername());

        casesManager.update(caseInfo);

        return "redirect:/cases?id=" + userId;
    }

    @PostMapping("/deleteCase")
    public String deleteCase(@RequestBody DoctorCasePojo pojo) {
        casesManager.deleteById(pojo.getCaseId());
        return "redirect:/cases?id=" + pojo.getDoctorId();
    }

}
