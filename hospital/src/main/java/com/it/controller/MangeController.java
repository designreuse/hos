package com.it.controller;


import com.it.pojo.Department;
import com.it.pojo.User;
import com.it.service.DepartmentService;
import com.it.service.DiseaseService;
import com.it.service.InsuranceService;
import com.it.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class MangeController {
    Logger logger = LoggerFactory.getLogger(MangeController.class);

    @Inject
    private DepartmentService departmentService;
    @Inject
    private UserService userService;
    @Inject
    private InsuranceService insuranceService;
    @Inject
    private DiseaseService diseaseService;

    /**
     * 科室设置
     */
    @RequestMapping(value = "/dept",method = RequestMethod.GET)
    public String getDepartmentInf(){
        return "manage/deptlist";
    }

    /**
     * 病症设置
     */
    @RequestMapping(value = "/disease",method = RequestMethod.GET)
    public String getDiseaseInf(){
        return "manage/diseaselist";
    }

    /**
     * 医保类型设置
     */
    @RequestMapping(value = "/insure",method = RequestMethod.GET)
    public String getInsuranceInf(){
        return "manage/insurancelist";
    }

    /**
     * 患者状态设置
     */
    @RequestMapping(value = "/station",method = RequestMethod.GET)
    public String getStationInf(){
        // todo 如何写
        return "manage/insurancelist";
    }
    /**
     * 账号设置
     */
    @RequestMapping(value = "/user",method = RequestMethod.GET)
    public String getUserInf(Model model){
        List<User> users = userService.getAllUser();
        if(users == null){
            return "system/403";
        }
        model.addAttribute("users",users);
        List<Department> depts = departmentService.findAllDepts();
        model.addAttribute("depts",depts);
        return "manage/userlist";
    }




}
