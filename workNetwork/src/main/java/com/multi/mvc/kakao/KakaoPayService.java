package com.multi.mvc.kakao;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayService {
	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	public String kakaoPayReady(Map<String, String> param) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b202835e7d7d779621f00dfae9d79819");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		
		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "test12");
		params.add("item_name", param.get("item_name"));
		params.add("quantity", param.get("quantity"));
		params.add("total_amount", param.get("total_amount"));
		params.add("tax_free_amount", "500");
		params.add("approval_url", "http://localhost/mvc/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost/mvc/kakaoPayCancel");
		params.add("fail_url", "http://localhost/mvc/kakaoPaySuccessFail");
		params.add("msg", "결제가 완료되었습니다.");


		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		System.out.println(body);
		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			log.info("" + kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		return "/";
	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, Map<String, String> param) {
		log.info("KakaoPayInfoVO............................................");
		log.info("-----------------------------");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b202835e7d7d779621f00dfae9d79819");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "test12");
		params.add("pg_token", pg_token);
		params.add("total_amount", param.get("total_amount"));

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			log.info("" + kakaoPayApprovalVO);

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
}
