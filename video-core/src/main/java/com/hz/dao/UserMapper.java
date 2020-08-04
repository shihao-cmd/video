package com.hz.dao;

import com.hz.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    User selectUserByEmailAndPassword(User user);

    void insertUser(User user) throws Exception;
}