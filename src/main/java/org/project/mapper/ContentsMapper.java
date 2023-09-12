package org.project.mapper;

import org.project.domain.ContentsVO;

public interface ContentsMapper {
	public ContentsVO getContentTitle(String title);
	
	public String selectMusical(String title);
	
	//데이터베이스에 각각 다 따로 들어가있으니까 따로따로 써줘야하는지 궁금
}
