package org.project.service;

import java.sql.Timestamp;
import java.util.List;

import org.project.domain.SmsVO;


public interface SmsService {

	public List<SmsVO> getSendList();

	public Timestamp checkSend(String title,String id);


}
