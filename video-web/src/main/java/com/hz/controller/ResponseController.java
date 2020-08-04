package com.hz.controller;

import com.hz.bean.User;
import com.hz.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class ResponseController {
    @Resource
    private UserService userService;

    @RequestMapping("user/loginUser")
    public String commitLogin(User user, HttpSession session) {
        System.out.println(user);
        try {
            User user1 = userService.selectUserByEmailAndPassword(user);
            if (user1 != null) {
                session.setAttribute("userAccount",user1.getEmail());
                return "success";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "failed";
    }

    @RequestMapping("user/insertUser")
    public String insertUser(User user,HttpSession session) {
        System.out.println(user);
        try {
            userService.insertUser(user);
            session.setAttribute("userAccount",user.getEmail());
            return "success";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "failed";
    }

}
