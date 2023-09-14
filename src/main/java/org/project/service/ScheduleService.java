package org.project.service;

import java.util.ArrayList;

import org.project.domain.ScheduleVO;

public interface ScheduleService {
	
	public ScheduleVO getCategory(String genre);

	public int getMusical();
	
	public int getConcerts();
	
	public int getFestival();
	
	public String genre();




}
