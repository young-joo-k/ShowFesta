package org.project.mapper;

import java.util.List;

import org.project.domain.ContentsVO;

public interface ContentsMapper {
	
	public List<ContentsVO> getMusicalContents();
	
	public ContentsVO MusicalRead(Long m_num);
}
