package com.multi.mvc.index.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchNews {
	private String title;
	private String date;
	private String url;
	private String img;
}
