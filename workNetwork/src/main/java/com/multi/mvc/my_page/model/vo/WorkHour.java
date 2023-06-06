package com.multi.mvc.my_page.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkHour {
    private int member_no;
    private String year;
    private String month;
    private String date;
    private String day_of_week;
    private String work_time;

}
