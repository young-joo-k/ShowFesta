package org.project.service;

import org.project.domain.ScheduleVO;

public interface ScheduleService {
	
	public ScheduleVO getCategory(String genre);

	public int selectCnt();
	
	public String genre();
}
