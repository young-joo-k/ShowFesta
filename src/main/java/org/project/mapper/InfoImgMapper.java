package org.project.mapper;

import java.util.List;

import org.project.domain.DImgVO;

public interface InfoImgMapper {
	public List<DImgVO> getInfoMImgList(Long m_num);

	public List<DImgVO> getInfoCImgList(Long m_num);
}
