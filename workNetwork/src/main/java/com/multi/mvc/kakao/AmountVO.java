package com.multi.mvc.kakao;

import lombok.Data;

@Data
public class AmountVO {
	private int total, tax_free, vat, point, discount;
}
