package com.hz.controller;

import com.hz.bean.Admin;
import com.hz.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    @RequestMapping("login")
    @ResponseBody
    public String login(Admin admin, HttpSession session) {
        System.out.println(admin);
        try {
            Admin admins = adminService.selectAdminAutoLogin(admin);
            System.out.println(admins);
            if (null != admins) {
                session.setAttribute("Admin",admins);
                return "success";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "error";
    }


}
