package com.it.controller;


import com.it.dto.JSONResult;
import com.it.pojo.User;
import com.it.service.DepartmentService;
import com.it.service.DiseaseService;
import com.it.service.InsuranceService;
import com.it.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class ManageController {
    Logger logger = LoggerFactory.getLogger(ManageController.class);

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
    public String getDepartmentInf(Model model){
        model.addAttribute("departments",departmentService.findAllDepts());
        return "manage/deptlist";
    }

    /**
     * 病症设置
     */
    @RequestMapping(value = "/disease",method = RequestMethod.GET)
    public String getDiseaseInf(Model model){
        model.addAttribute("diseases",diseaseService.findAllDisease());
        return "manage/diseaselist";
    }

    /**
     * 医保类型设置
     */
    @RequestMapping(value = "/insure",method = RequestMethod.GET)
    public String getInsuranceInf(Model model){

        model.addAttribute("insurances",insuranceService.findAllInsurance());
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
        return "manage/userlist";
    }

    /**
     * ajax 获取部门列表
     */
    @RequestMapping(value = "/user/deptinf",method = RequestMethod.GET)
    @ResponseBody
    public JSONResult getDepartInf(){
        return new JSONResult(departmentService.findAllDepts());
    }

    /**
     * ajax post 提交添加用户
     */
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    @ResponseBody
    public String addNewUser(User user){
        userService.addNewUser(user);
        return "success";
    }
    /**
     * 判断用户username 是否存在
     */
    @RequestMapping(value = "/user/identify",method = RequestMethod.GET)
    @ResponseBody
    public String identifyNameExist(String username){
        User user = userService.findUserByUsername(username);
        return user == null ? "true":"false";
    }

    /**
     * 获取用户数据
     */
    @RequestMapping(value = "/user/userinf/{id:\\d+}",method = RequestMethod.GET)
    @ResponseBody
    public JSONResult getUserInf(@PathVariable Integer id){
        User user =userService.findUserById(id);
        return new JSONResult(user);
    }
    /**
     * 提交修改数据
     */
    @RequestMapping(value = "/user/modify",method = RequestMethod.POST)
    @ResponseBody
    public String updateUserInfo(User user){
        userService.updateUserInfor(user);
        return "success";
    }



}
