package com.multi.mvc.my_page.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.*;

import com.fasterxml.jackson.databind.JsonNode;
import com.multi.mvc.index.model.vo.Month;
import com.multi.mvc.index.model.vo.Week;
import com.multi.mvc.index.model.vo.Year;
import com.multi.mvc.my_page.model.service.MypageService;
import com.multi.mvc.my_page.model.vo.WorkHour;
import com.multi.mvc.signup.model.service.SignupService;
import com.multi.mvc.signup.model.vo.Member_info;
import com.multi.mvc.signup.model.vo.SignupMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.multi.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MypageController {
	// 마이페이지 : 초기화면

	@Autowired
	private MypageService service;

	@GetMapping("/workNetwork/my_page")
	public String myPage(Model model, HttpSession session) {

		Integer member_no = (Integer) session.getAttribute("member_no");

		List<SignupMember> members = service.selectMember(member_no);
		List<Member_info> member_infos = service.selectMember_info(member_no);
		List<WorkHour> work_time = service.selectWorkTime(member_no);

		SignupMember member = members.get(0);
		Member_info member_info = member_infos.get(0);


		System.out.println("member: " + member);
		System.out.println("member_info: " + member_info);
		System.out.println("work_time: " + work_time);

		model.addAttribute("member",member);
		model.addAttribute("member_info",member_info);


		List<Week> week = service.week(member_no);
		double[] workHourWeek = new double[7];
		double weekTotalHour=0.0;
		double weekTotalOverHour=0.0;
		int resultOver;

		int cnt=0;
		int i=0;

		for(i=0;i<week.size();i++) {
			double tmp = week.get(i).getUseDate();
			weekTotalHour+=tmp;
			if(tmp>8.0) {weekTotalOverHour+=(tmp-8.0);}

			if(week.get(i).getWeek().equals("월")) {
				workHourWeek[0]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("화")) {
				workHourWeek[1]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("수")) {
				workHourWeek[2]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("목")) {
				workHourWeek[3]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("금")) {
				workHourWeek[4]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("토")) {
				workHourWeek[5]=Math.round(tmp * 100.0) / 100.0;
			}else if(week.get(i).getWeek().equals("일")) {
				workHourWeek[6]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		if(weekTotalHour>52) {resultOver=1;}
		else {resultOver=0;}

		model.addAttribute("week", Arrays.toString(workHourWeek));
		model.addAttribute("resultOver",resultOver);
		model.addAttribute("weekTotalHour", Math.round(weekTotalHour/ 7.0 * 100.0) / 100.0);
		model.addAttribute("weekTotalOverHour", Math.round(weekTotalOverHour * 100.0) / 100.0);

// 마이페이지 : 월간
		List<Month> month = service.month(member_no);
		double[] workHourMonth = new double[12];
		double monthTotalHour=0.0;
		double monthTotalOverHour=0.0;

		for(i=0;i<month.size();i++) {
			double tmp = month.get(i).getUseDate();
			monthTotalHour+=tmp;
			if(tmp>8.0) {monthTotalOverHour+=(tmp-8.0);}

			if(month.get(i).getMonth().equals("1")) {
				workHourMonth[0]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("2")) {
				workHourMonth[1]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("3")) {
				workHourMonth[2]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("4")) {
				workHourMonth[3]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("5")) {
				workHourMonth[4]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("6")) {
				workHourMonth[5]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("7")) {
				workHourMonth[6]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("8")) {
				workHourMonth[7]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("9")) {
				workHourMonth[8]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("10")) {
				workHourMonth[9]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("11")) {
				workHourMonth[10]=Math.round(tmp * 100.0) / 100.0;
			}else if(month.get(i).getMonth().equals("12")) {
				workHourMonth[11]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		model.addAttribute("month",Arrays.toString(workHourMonth));
		model.addAttribute("monthTotalHour", Math.round(monthTotalHour / 12.0 * 100.0) / 100.0);
		model.addAttribute("monthTotalOverHour", Math.round(monthTotalOverHour * 100.0) / 100.0);

// 마이페이지 : 연간
		List<Year> year = service.year(member_no);
		double[] workHourYear = new double[7];
		double yearTotalHour=0.0;
		double yearTotalOverHour=0.0;

		for(i=0;i<year.size();i++) {
			double tmp = year.get(i).getUseDate();
			yearTotalHour+=tmp;
			if(tmp>8.0) {yearTotalOverHour+=(tmp-8.0);}

			if(year.get(i).getYear().equals("2017")) {
				workHourYear[0]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2018")) {
				workHourYear[1]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2019")) {
				workHourYear[2]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2020")) {
				workHourYear[3]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2021")) {
				workHourYear[4]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2022")) {
				workHourYear[5]=Math.round(tmp * 100.0) / 100.0;
			}else if(year.get(i).getYear().equals("2023")) {
				workHourYear[6]=Math.round(tmp * 100.0) / 100.0;
			}
		}
		model.addAttribute("year",Arrays.toString(workHourYear));
		model.addAttribute("yearTotalHour", Math.round(yearTotalHour / 7.0 * 100.0) / 100.0);
		model.addAttribute("yearTotalOverHour", Math.round(yearTotalOverHour * 100.0) / 100.0);

		return "workNetwork/my_page";
	}

	@RequestMapping("/workNetwork/my_page/timecheck")
	public String timeCheck(@RequestBody JsonNode requestData, Model model, HttpSession session){


		Integer member_no = (Integer) session.getAttribute("member_no");

		String time = requestData.get("lastTime").asText();

		// Get today's date
		LocalDate today = LocalDate.now();

		// Format the date as desired (e.g., "yyyy.MM.dd", "yyyy년 MM월 dd일", etc.)
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 (E)");
		String formattedDate = today.format(formatter);

		// Extract the year, month, date, and day of the week in Korean
		String year = Integer.toString(today.getYear());
		String month = Integer.toString(today.getMonthValue());
		String date = Integer.toString(today.getDayOfMonth());
		String dayOfWeek = today.getDayOfWeek().getDisplayName(TextStyle.FULL, new Locale("ko"));
		String abbreviatedDayOfWeek = dayOfWeek.replace("요일", "");

// Parse the time string
		String[] timeParts = time.split(":");
		int hours = Integer.parseInt(timeParts[0]);
		int minutes = Integer.parseInt(timeParts[1]);
// Calculate the total number of minutes
		int totalMinutes = hours * 60 + minutes;
// Calculate the decimal representation
		double decimalTime = totalMinutes / 60.0;

		String decimalTimeToString = Double.toString(decimalTime);

		System.out.println(decimalTime); // Output: 0.05

		System.out.println(year + " " + month + " " + date + " " + abbreviatedDayOfWeek);

		System.out.println(decimalTimeToString);



		service.timeload(member_no,year,month,date,abbreviatedDayOfWeek,decimalTimeToString);


		return "workNetwork/my_page";

	}



}