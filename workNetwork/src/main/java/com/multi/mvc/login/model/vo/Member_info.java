package com.multi.mvc.login.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member_info {

    private int member_no;
    private String gender;
    private int age;
    private String company_name;
    private String department;

    private String job;

    private String position;
    private String work_type;

}
