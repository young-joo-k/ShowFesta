package org.project.mapper;

import java.util.List;

import org.project.domain.ContentsVO;
import org.project.domain.PriceVO;

public interface ContentsMapper {
	
	public List<ContentsVO> getConcertContents();

	public List<ContentsVO> getMusicalContents();
	
	public ContentsVO MusicalRead(Long m_num);

	public List<ContentsVO> getFestivalContents();

	public List<ContentsVO> getToday_m_contents();

	public List<ContentsVO> getToday_c_contents();

	public List<ContentsVO> getToday_f_contents();
	
	public ContentsVO ConcertRead(Long m_num);

	public ContentsVO FestivalRead(Long m_num);

	public List<PriceVO> getPrice(String m_title);

	public List<ContentsVO> getAllMusical(String date);

	public List<ContentsVO> getAllConcert(String date);

	public List<ContentsVO> getAllFestival(String date);
}
