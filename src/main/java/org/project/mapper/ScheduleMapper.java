package org.project.mapper;

import org.project.domain.ScheduleVO;

public interface ScheduleMapper {

	public ScheduleVO getCategory(String genre);
	
	public int getMusical();
	
	public int getConcerts();
	
	public int getFestival();
	
	public String genre();

	public int getMusicalCnt(String date);

	public int getConcertsCnt(String date);

	public int getFestivalCnt(String date);
	
}
