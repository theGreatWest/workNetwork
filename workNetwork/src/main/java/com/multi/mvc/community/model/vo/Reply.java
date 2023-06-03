package com.multi.mvc.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	private String name;
	private String content;
	private String create_date;
	private String member_no;
}
