package org.project.service;

import java.util.List;

import org.project.domain.DImgVO;
import org.project.mapper.InfoImgMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class InfoImgServiceImpl implements InfoImgService{

	private InfoImgMapper imgmapper;
	@Override
	public List<DImgVO> InfoImgList(Long m_num) {
		
		return imgmapper.getInfoImgList(m_num);
	}

}
