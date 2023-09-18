package org.project.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.project.domain.MemberVO;
import org.project.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper membermapper;

	@Override
	public void register(MemberVO member) {
		log.info(member);
		membermapper.insert(member);
	}
	
	@Override
	public String login(String id, String pw) {
		MemberVO membervo = membermapper.getUserInfo(id);
		//만약에 유저 정보가 있다면
		if (membervo != null) {
			//유저 타입도 같고 패스워드도 맞으면 
			if (membervo.getPw().equals(pw)) {
				//성공
				return membervo.getId();
			}
			else if (!(membervo.getPw().equals(pw))) {
				return "패스워드가 다릅니다.";
			}

		}
		return "없는 아이디 입니다.";
	}


	@Override
	public boolean registerIdCheck(String id) {
		boolean result = false;
		
		if(membermapper.IsIdValid(id)==0) result = true;
		
		return result;
	}
	
	@Override
	public boolean registerEmailCheck(String email) {
		boolean result = false;
		
		if(membermapper.IsEmailValid(email)==0) result = true;
		
		return result;
	}
	

	@Override
	public MemberVO getUserInfo(String id) {
		return membermapper.getUserInfo(id);
	}
	
	@Override
	public String findId(String name, String email, String phone) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("name", name);
	    paramMap.put("email", email);
	    paramMap.put("phone", phone);
	    // MemberMapper瑜� �궗�슜�븯�뿬 �븘�씠�뵒瑜� �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 議고쉶
	    String foundId = membermapper.findId(paramMap);
	    
	    // �븘�씠�뵒瑜� 李얠� 紐삵븳 寃쎌슦 null�쓣 諛섑솚
	    return foundId;
	}
	@Override
	public String findPw(String id, String name, String email, String phone) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("id", id);
	    paramMap.put("name", name);
	    paramMap.put("email", email);
	    paramMap.put("phone", phone);
	    // MemberMapper瑜� �궗�슜�븯�뿬 �븘�씠�뵒瑜� �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 議고쉶
	    String foundPw = membermapper.findPw(paramMap);
	    
	    // �븘�씠�뵒瑜� 李얠� 紐삵븳 寃쎌슦 null�쓣 諛섑솚
	    return foundPw;
	}

	@Override
	public void updateUserInfo(MemberVO member) {
	    membermapper.updateUserInfo(member);
	}

	@Override
	public List<MemberVO> getAllUser() {
		
		return membermapper.getAllUser();
	}






}
