package com.hz.service.impl;

import com.hz.bean.User;
import com.hz.dao.UserMapper;
import com.hz.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User selectUserByEmailAndPassword(User user) throws Exception {
        return userMapper.selectUserByEmailAndPassword(user);
    }

    @Override
    public void insertUser(User user) throws Exception {
        userMapper.insertUser(user);
    }
}
