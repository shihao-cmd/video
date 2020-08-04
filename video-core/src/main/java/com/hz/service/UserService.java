package com.hz.service;

import com.hz.bean.User;

public interface UserService {
    User selectUserByEmailAndPassword(User user) throws Exception;

    void insertUser(User user) throws Exception;
}
