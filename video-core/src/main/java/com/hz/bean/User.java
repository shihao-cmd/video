package com.hz.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;

    private String email;

    private String phonenum;

    private String password;

    private String code;

    private String nickname;

    private String sex;

    private String birthday;

    private String address;

    private String imgurl;

    private String createtime;


}