package org.project.service;

import java.sql.Timestamp;
import java.util.List;

import org.project.domain.SmsVO;
import org.project.mapper.SmsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SmsServiceImpl implements SmsService {

    @Autowired
    private SmsMapper smsMapper; // MyBatis Mapper �������̽��� ����

	@Override
	public List<SmsVO> getSendList() {
		
		return smsMapper.getSendList();
	}

	@Override
	public Timestamp checkSend(String title, String id) {
		System.out.println(title);
		System.out.println(id);
		return smsMapper.checkSend(title,id);
		
	}


    
}