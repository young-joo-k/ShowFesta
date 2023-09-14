package org.project.service;

import java.util.List;

import org.project.domain.PlayVO;


public interface PlayService {

	public List<PlayVO> getActorList(Long m_num);
}
