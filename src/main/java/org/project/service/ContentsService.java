package org.project.service;

import java.util.List;
import org.project.domain.ContentsVO;


public interface ContentsService {

	public List<ContentsVO> getMusicalContents();
	
	public ContentsVO getMusical(Long m_num);

	public List<ContentsVO> getConcertContents();
	
	public List<ContentsVO> getFestivalContents();


//	public ContentsVO getConcert(Long m_num);
	
	//캘린더 모달창에 띄울 부분
	public List<ContentsVO> getToday_m_contents();
	public List<ContentsVO> getToday_c_contents();
	public List<ContentsVO> getToday_f_contents();

	public ContentsVO getConcert(Long m_num);
}
