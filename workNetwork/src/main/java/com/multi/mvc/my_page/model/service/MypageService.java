package com.multi.mvc.my_page.model.service;


import com.multi.mvc.index.model.vo.Month;
import com.multi.mvc.index.model.vo.Week;
import com.multi.mvc.index.model.vo.Year;
import com.multi.mvc.my_page.model.mapper.MypageMapper;
import com.multi.mvc.my_page.model.vo.WorkHour;
import com.multi.mvc.signup.model.vo.Member_info;
import com.multi.mvc.signup.model.vo.SignupMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MypageService {

    @Autowired
    private MypageMapper mapper;

    public List<SignupMember> selectMember(Integer member_no){return mapper.selectMember(member_no);}
    public List<Member_info> selectMember_info(Integer member_no){return mapper.selectMember_info(member_no);}
    public List<WorkHour> selectWorkTime(Integer member_no){return mapper.selectWorkTime(member_no);}

    public List<Week> week(Integer member_no){
        return mapper.week(member_no);
    }

    public List<Month> month(Integer member_no){
        return mapper.month(member_no);
    }

    public List<Year> year(Integer member_no){
        return mapper.year(member_no);
    }

    public void timeload(Integer member_no, String year, String month, String date, String day_of_week, String time) {

        mapper.timeload(member_no,year,month,date,day_of_week,time);
    }
}
