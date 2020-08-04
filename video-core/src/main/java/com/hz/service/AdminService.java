package com.hz.service;

import com.hz.bean.Admin;

public interface AdminService {

    Admin selectAdminAutoLogin(Admin admin) throws Exception;
}
