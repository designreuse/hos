package com.it.controller;


import com.it.util.SmallUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
    Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * 获取用户登录界面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * 提交用户登录信息
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String username, String password,
                        RedirectAttributes redirectAttributes,
                        HttpServletRequest request) {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout();
        }

        try {
            UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
            subject.login(usernamePasswordToken);
            String ip = SmallUtils.getRemoteIp(request);
            logger.debug("ip is {}", ip);
            // todo 登陆日志
            // userService.insertLoginLog(ip);
            return "redirect:/home";
        } catch (LockedAccountException exception) {
            redirectAttributes.addFlashAttribute("message", "该账户已经被冻结");
            redirectAttributes.addFlashAttribute("style", "alert-danger");
            return "redirect:/login";
        } catch (AuthenticationException exception) {
            redirectAttributes.addFlashAttribute("message", "账号或密码错误");
            redirectAttributes.addFlashAttribute("style", "alert-danger");
            return "redirect:/login";
        }
    }

    /**
     * 登录成功跳转到主界面
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homePage() {
        return "home";
    }

    /**
    * 成功退出后跳转登陆界面
    */

    @RequestMapping(value = "/signout",method = RequestMethod.GET)
    public String  signOut(RedirectAttributes redirectAttributes){
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("message", "已经安全退出");
        redirectAttributes.addFlashAttribute("style", "alert-success");
        return "redirect:/login";
    }

}
