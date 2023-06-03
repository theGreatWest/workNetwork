package com.multi.mvc.login.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class LoginMember {
    private int member_no;
    private String id;
    private String password;
    private String name;
    private String email;
    private String phone_number;
    private String address;
    private String status;
}