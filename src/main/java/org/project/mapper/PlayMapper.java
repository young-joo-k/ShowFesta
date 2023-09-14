package org.project.mapper;

import java.util.List;

import org.project.domain.PlayVO;

public interface PlayMapper {
	public List<PlayVO> getPlayList(Long m_num);
}
