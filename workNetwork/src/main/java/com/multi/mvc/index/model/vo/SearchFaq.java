package com.multi.mvc.index.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchFaq {
	private int num;
	private String main;
	private String middle;
	private String question;
	private String answer;
}
