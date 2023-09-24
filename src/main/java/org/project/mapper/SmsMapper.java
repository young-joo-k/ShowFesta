package org.project.mapper;

import java.sql.Timestamp;
import java.util.List;

import org.project.domain.SmsVO;

public interface SmsMapper {

	List<SmsVO> getSendList();

	Timestamp checkSend(String title, String id);
}
