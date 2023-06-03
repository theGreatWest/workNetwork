package com.multi.mvc.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityList {
	private String department;
	private String title;
	private String content;
	private String name;
	private String create_date;
	private String views;
	private String board_no;
	private int count;
}
