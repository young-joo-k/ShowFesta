package org.project.service;

import org.project.domain.ScheduleVO;
import org.project.mapper.ScheduleMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
	private ScheduleMapper schedulemapper;

	@Override
	public int selectCnt() {
		
		return schedulemapper.selectCnt();

	}

	@Override
	public ScheduleVO getCategory(String genre) {
		
		return null ;
	}

	@Override
	public String genre() {
		
		return null;
	}
	
	
}
