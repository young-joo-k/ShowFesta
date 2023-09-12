package org.project.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
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
	public void register2(MemberVO member) {
		log.info(member);
		membermapper.insert2(member);
		
	}
	
	@Override
	public String login(String id, String pw) {
		MemberVO membervo = membermapper.getUserInfo(id);
		//留뚯빟�뿉 �쑀�� �젙蹂닿� �엳�떎硫�
		if (membervo != null) {
			//�쑀�� ���엯�룄 媛숆퀬 �뙣�뒪�썙�뱶�룄 留욎쑝硫� 
			if (membervo.getPw().equals(pw)) {
				/*
				 * if (membervo.getValiduser()==0) { return "�듅�씤�씠 �릺吏� �븡�� �궗�슜�옄 �엯�땲�떎."; }
				 */
				//�꽦怨�
				return membervo.getId();
			}
			else if (!(membervo.getPw().equals(pw))) {
				return "�뙣�뒪�썙�뱶媛� �떎由낅땲�떎.";
			}

		}
		return "�뾾�뒗 �븘�씠�뵒 �엯�땲�떎.";
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
	public String findPw(String id, String name, String email, String phone, int checked) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("id", id);
	    paramMap.put("name", name);
	    paramMap.put("email", email);
	    paramMap.put("phone", phone);
	    paramMap.put("checked", checked);
	    // MemberMapper瑜� �궗�슜�븯�뿬 �븘�씠�뵒瑜� �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 議고쉶
	    String foundPw = membermapper.findPw(paramMap);
	    
	    // �븘�씠�뵒瑜� 李얠� 紐삵븳 寃쎌슦 null�쓣 諛섑솚
	    return foundPw;
	}


}
