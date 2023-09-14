package org.project.service;

import java.util.List;

import org.project.domain.PlayVO;
import org.project.mapper.PlayMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PlayServiceImpl implements PlayService{

	private PlayMapper playmapper;
	@Override
	public List<PlayVO> getActorList(Long m_num) {
		log.info("list service");
		return playmapper.getPlayList(m_num);
	}

}
