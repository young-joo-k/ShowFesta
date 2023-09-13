package org.project.mapper;

import org.project.domain.ContentsVO;

public interface ContentsMapper {
	
	public ContentsVO getMusicalContents();
	
	public ContentsVO MusicalRead(Long m_num);
}
