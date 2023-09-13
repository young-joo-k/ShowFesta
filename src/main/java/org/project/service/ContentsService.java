package org.project.service;

import java.util.List;
import org.project.domain.ContentsVO;


public interface ContentsService {
	
	public List<String> getMusicalContents();
	
	public ContentsVO getMusical(Long m_num);
}
