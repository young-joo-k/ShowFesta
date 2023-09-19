package org.project.mapper;

import java.util.List;
import java.util.Map;

import org.project.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO getUserInfo(String id);
	
	public void insert(MemberVO member);
	
	public String selectLogin(String id);

	public int IsIdValid(String id);

	public int IsEmailValid(String email);

	public String findId(Map<String, Object> paramMap);

	public String findPw(Map<String, Object> paramMap);

	public void updateUserInfo(MemberVO member);

	public List<MemberVO> getAllUser();

	public int deleteUser(String userId);

	


}
