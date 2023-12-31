package org.project.service;

import java.util.List;

import org.project.domain.ContentsVO;
import org.project.domain.FestaVO;
import org.project.domain.PriceVO;
import org.project.mapper.ContentsMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ContentsServiceImpl implements ContentsService {

	private ContentsMapper contentsmapper;

	@Override
	public List<ContentsVO> getMusicalContents() {
		log.info("getMusicalContents");
//        List<ContentsVO> musicalContents = new List<>();

		return contentsmapper.getMusicalContents();
	}

	@Override
	public ContentsVO getMusical(Long m_num) {
		log.info("get---" + m_num);

		return contentsmapper.MusicalRead(m_num);
	}

	@Override
	public List<ContentsVO> getConcertContents() {

		return contentsmapper.getConcertContents();
	}

	@Override
	public ContentsVO getConcert(Long m_num) {
		// TODO Auto-generated method stub
		return contentsmapper.ConcertRead(m_num);
	}

	@Override
	public ContentsVO getFestival(Long m_num) {
		// TODO Auto-generated method stub
		return contentsmapper.FestivalRead(m_num);
	}

	@Override
	public List<PriceVO> getPrice(String m_title) {
		// TODO Auto-generated method stub
		return contentsmapper.getPrice(m_title);
	}

	@Override
	public List<ContentsVO> getAllMusical(String date) {
		// TODO Auto-generated method stub
		return contentsmapper.getAllMusical(date);
	}

	@Override
	public List<ContentsVO> getAllConcert(String date) {
		// TODO Auto-generated method stub
		return contentsmapper.getAllConcert(date);
	}

	@Override
	public List<FestaVO> getAllFestival(String date) {
		// TODO Auto-generated method stub
		return contentsmapper.getAllFestival(date);
	}

	@Override
	public List<ContentsVO> getMusicalContentsByDate(String startDate, String endDate) {
		try {
			// startDate와 endDate를 사용하여 동적 쿼리 생성 및 실행
			List<ContentsVO> searchResult = contentsmapper.getMusicalContentsByDate(startDate, endDate);

			return searchResult;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<FestaVO> getFestaContents() {
		return contentsmapper.getFestaContents();
	}

	@Override
	public List<ContentsVO> getConcertContentsByDate(String startDate, String endDate) {
		try {
			// startDate와 endDate를 사용하여 동적 쿼리 생성 및 실행
			List<ContentsVO> searchResult = contentsmapper.getConcertContentsByDate(startDate, endDate);

			return searchResult;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<FestaVO> getFestaContentSearchDate(String startDate, String endDate) {
		try {
			// startDate와 endDate를 사용하여 동적 쿼리 생성 및 실행
			List<FestaVO> searchResult = contentsmapper.getFestaContentsByDate(startDate, endDate);

			return searchResult;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void musicalContentsPlus(ContentsVO contentsvo) {
		contentsmapper.musicalContentsPlus(contentsvo);
	}

	@Override
	public void concertContentsPlus(ContentsVO contentsvo) {
		contentsmapper.concertContentsPlus(contentsvo);
	}

	@Override
	public void deleteContentsByM_num(int m_num) {
		contentsmapper.contentsDelete(m_num);
	}

	@Override
	public void deleteConcertContentsByM_num(int m_num) {

		contentsmapper.concertDelete(m_num);
	};

}
