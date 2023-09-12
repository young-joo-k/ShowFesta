package org.project.service;

import org.project.domain.ContentsVO;
import org.project.mapper.ContentsMapper;
import org.project.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ContentsServiceImpl implements ContentsService {
	
	private ContentsMapper contentsmapper;

	@Override
	public ContentsVO getContentTitle(String title) {
		log.info(title);
		return contentsmapper.getContentTitle(title);
	}
	
	
}
