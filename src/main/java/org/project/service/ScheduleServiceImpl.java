package org.project.service;

import java.util.ArrayList;

import org.project.domain.ScheduleVO;
import org.project.mapper.ScheduleMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
	private ScheduleMapper schedulemapper;

	@Override
	public int getMusical() {
		
		return schedulemapper.getMusical();
	}
	
	@Override
	public int getConcerts() {
		return schedulemapper.getConcerts();
	}
	
//	여기 수정해야함
	@Override
	public int getFestival() {
		return schedulemapper.getFestival();
	}

	@Override
	public ScheduleVO getCategory(String genre) {
		
		return null ;
	}

	@Override
	public String genre() {
		
		return null;
	}

	@Override
	public int getMusicalCnt(String date) {
		// TODO Auto-generated method stub
		return schedulemapper.getMusicalCnt(date);
	}

	@Override
	public int getConcertsCnt(String date) {
		// TODO Auto-generated method stub
		return schedulemapper.getConcertsCnt(date);
	}

	@Override
	public int getFestivalCnt(String date) {
		// TODO Auto-generated method stub
		return schedulemapper.getFestivalCnt(date);
	}



			
}
