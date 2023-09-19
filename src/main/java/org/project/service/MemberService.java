package org.project.service;

import java.util.List;

import org.project.domain.MemberVO;

public interface MemberService {
	
	public void register(MemberVO member);
	
	public String login(String id, String pw);
	
	public boolean registerIdCheck(String id);
	
	public MemberVO getUserInfo(String id);

	public String findId(String name, String email, String phone);

	public String findPw(String id, String name, String email, String phone);
	
	public boolean registerEmailCheck(String email);

	public void updateUserInfo(MemberVO member);

	public List<MemberVO> getAllUser();

	public void deleteUserById(String id);

	
	
}
