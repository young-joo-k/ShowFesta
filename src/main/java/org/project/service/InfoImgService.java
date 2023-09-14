package org.project.service;

import java.util.List;

import org.project.domain.DImgVO;

public interface InfoImgService {
	public List<DImgVO> InfoMImgList(Long m_num);
	public List<DImgVO> InfoCImgList(Long m_num);
}
