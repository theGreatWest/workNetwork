package com.multi.mvc.my_page.model.mapper;

import com.multi.mvc.index.model.vo.Month;
import com.multi.mvc.index.model.vo.Week;
import com.multi.mvc.index.model.vo.Year;
import com.multi.mvc.my_page.model.vo.WorkHour;
import com.multi.mvc.signup.model.vo.Member_info;
import com.multi.mvc.signup.model.vo.SignupMember;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface MypageMapper {
    List<SignupMember> selectMember(@Param("member_no") Integer member_no);

    List<Member_info> selectMember_info(@Param("member_no") Integer member_no);

    List<WorkHour> selectWorkTime(@Param("member_no") Integer member_no);

    List<Week> week(@Param("member_no") Integer member_no);
    List<Month> month(@Param("member_no") Integer member_no);
    List<Year> year(@Param("member_no") Integer member_no);

    void timeload(@Param("member_no") Integer member_no,@Param("year")String year, @Param("month")String month, @Param("date")String date, @Param("day_of_week")String day_of_week, @Param("work_time")String time);
}
