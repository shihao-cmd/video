package com.hz.dao;

import com.hz.bean.Admin;

public interface AdminMapper {

    Admin selectAdminByUserNameAndPassword(Admin admin) throws Exception;
}