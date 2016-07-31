package com.it.controller;

import com.it.dto.JSONResult;
import com.it.pojo.User;
import com.it.service.UserService;
import com.it.util.SmallUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user")
public class UserController {
    Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    /**
     * 修改密码,获取界面
     */
    @RequestMapping(value = "/password",method = RequestMethod.GET)
    public String updatePassword(){
        return "user/password";
    }

    /**
     * 修改密码,提交数据
     */
    @RequestMapping(value = "/password",
            method = RequestMethod.POST,
            produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public String updatePassword(String password){
        userService.updatePwd(password);
        // todo ajax 提交，返回信息
        return SmallUtils.transtoISO("修改成功");
    }

    /**
     * 远程验证密码的正确性
     */
    @RequestMapping(value = "/identify",method = RequestMethod.GET)
    @ResponseBody
    public String identifyPwd(String password){
        User user = userService.findUserByNameAndPwd(password);
        return user == null ? "false":"true";
    }








}
