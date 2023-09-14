package org.project.service;

import java.util.List;
import org.project.domain.ContentsVO;


public interface ContentsService {

	public List<ContentsVO> getMusicalContents();
	
	public ContentsVO getMusical(Long m_num);

	public List<ContentsVO> getConcertContents();
	
	public List<ContentsVO> getFestivalContents();


//	public ContentsVO getConcert(Long m_num);
	
	//캘占쏙옙占쏙옙 占쏙옙占시�占쏙옙 占쏙옙占� 占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙
	public List<ContentsVO> getToday_contents();
//	public List<ContentsVO> getToday_c_contents();
//	public List<ContentsVO> getToday_f_contents();

	public ContentsVO getConcert(Long m_num);
}
