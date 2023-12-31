package org.project.mapper;

import java.util.List;

import org.project.domain.ContentsVO;
import org.project.domain.FestaVO;
import org.project.domain.PriceVO;

public interface ContentsMapper {
	
	public List<ContentsVO> getMusicalContents();
	
	public List<ContentsVO> getConcertContents();
	
	public List<FestaVO> getFestaContents();

	public ContentsVO MusicalRead(Long m_num);

	public List<ContentsVO> getFestivalContents();
	
	public ContentsVO ConcertRead(Long m_num);

	public ContentsVO FestivalRead(Long m_num);

	public List<PriceVO> getPrice(String m_title);

	public List<ContentsVO> getAllMusical(String date);

	public List<ContentsVO> getAllConcert(String date);

	public List<FestaVO> getAllFestival(String date);

	public List<ContentsVO> getMusicalContentsByDate(String startDate, String endDate);

	public List<ContentsVO> getConcertContentsByDate(String startDate, String endDate);

	public List<ContentsVO> getFestivalContentSearchDate(String startDate, String endDate);

	public List<FestaVO> getFestaContentsByDate(String startDate, String endDate);

	public List<FestaVO> searchFestaContents();

	public void musicalContentsPlus(ContentsVO contentsvo);

	public void concertContentsPlus(ContentsVO contentsvo);

	public void contentsDelete(int m_num);

	public void concertDelete(int m_num);
}
