package com.hz.service.impl;

import com.hz.bean.Admin;
import com.hz.dao.AdminMapper;
import com.hz.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin selectAdminAutoLogin(Admin admin) throws Exception {
        return adminMapper.selectAdminByUserNameAndPassword(admin);
    }
}
