package org.project.service;

import java.util.List;
import org.project.domain.ContentsVO;


public interface ContentsService {

	public List<ContentsVO> getMusicalContents();
	
	public ContentsVO getMusical(Long m_num);

	public List<ContentsVO> getConcertContents();
	
	public List<ContentsVO> getFestivalContents();
	
	//캘린더 모달창에 띄울 내용 넣는 구간
	public List<ContentsVO> getToday_contents();
//	public List<ContentsVO> getToday_c_contents();
//	public List<ContentsVO> getToday_f_contents();
}
