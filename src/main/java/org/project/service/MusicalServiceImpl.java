package org.project.service;

import org.project.domain.MusicalVO;
import org.project.mapper.MusicalMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class MusicalServiceImpl implements MusicalService{
	private MusicalMapper mapper;
	
	@Override
	public MusicalVO get(Long m_num) {
		log.info("get---"+m_num);
		return mapper.read(m_num);
	}

}
