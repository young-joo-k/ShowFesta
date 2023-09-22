package org.project.service;

import java.util.List;

import org.project.domain.ContentsVO;
import org.project.domain.FestaVO;
import org.project.domain.PriceVO;


public interface ContentsService {
	
	public List<ContentsVO> getMusicalContents();
	
	public List<ContentsVO> getConcertContents();

	public List<FestaVO> getFestaContents();

	public ContentsVO getMusical(Long m_num);

	public ContentsVO getConcert(Long m_num);

	public ContentsVO getFestival(Long m_num);

	public List<PriceVO> getPrice(String m_title);

	public List<ContentsVO> getAllMusical(String result);

	public List<ContentsVO> getAllConcert(String result);

	public List<FestaVO> getAllFestival(String result);

	public List<ContentsVO> getMusicalContentsByDate(String startDate, String endDate);

	public List<ContentsVO> getConcertContentsByDate(String startDate, String endDate);

	public List<FestaVO> getFestaContentSearchDate(String startDate, String endDate);

	public void musicalContentsPlus(ContentsVO contentsvo);

	public void concertContentsPlus(ContentsVO contentsvo);


}
