package com.multi.mvc.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.mvc.member.model.mapper.MemberMapper;
import com.multi.mvc.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder; //  SHA-256 hash code로 패스워드 일방향 암호 지원 모듈
	// 1234 -> nsikldvnisoldjhv2423jo23 (평문 -> hashCode)
	
	public Member login(String userId, String pw) {
		Member member = mapper.selectMember(userId);
		System.out.println("member : " + member);
		if(member == null) {
			return null;
		}
		
		// passwordEncoder 활용법
		System.out.println(member.getPassword()); // hash로 암호화된 코드가 들어있다.
		System.out.println(pwEncoder.encode(pw)); // encode를 통해 평문에서 hash 코드로 변환
		System.out.println(pwEncoder.matches(pw, member.getPassword())); // 평문 변환하고 비교까지
		
		if(userId.equals("admin")) { // admin 테스트를 위한 코드
			return member;
		}
		
		
		if(member != null && pwEncoder.matches(pw, member.getPassword()) == true) {
			// 성공
			return member;
		}else {
			// 로그인 실패
			return null;
		}
	}
	
	// @Transactional : DB 트랜잭션 관리를 위한 AOP 어노테이션. 만일 오류가 발생하면 롤백. 아니면 커밋
	// (rollbackFor = Exception.class) : 사용하지 않은 경우 트랜잭션 코드가 정상적으로 작동하지 않을수 있다.
	@Transactional(rollbackFor = Exception.class)
	public int save(Member member) {
		int result = 0;
		if(member.getMemberNo() == 0) { // 회원가입
			String encodePW = pwEncoder.encode(member.getPassword());
			member.setPassword(encodePW);
			result = mapper.insertMember(member);
		}else { // 회원 수정
			result = mapper.updateMember(member);
		}
		return result;
	}
	
	public boolean validate(String userId) {
		return this.findById(userId) != null;
	}
	
	public Member findById(String userId) {
		return mapper.selectMember(userId);
	}

	public Member loginKaKao(String kakaoToken) {
		Member member = mapper.selectMemberByKakaoToken(kakaoToken);
		if(member != null ) {
			// 성공일때!
			return member;
		}else {
			// 인증 실패했을때
			return null;
		}
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public int delete(int memberNo) {
		return mapper.deleteMember(memberNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int updatePwd(Member loginMember, String userPW) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberNo", "" + loginMember.getMemberNo());
		map.put("newPwd", pwEncoder.encode(userPW));
		return mapper.updatePwd(map);
	}
	
}
