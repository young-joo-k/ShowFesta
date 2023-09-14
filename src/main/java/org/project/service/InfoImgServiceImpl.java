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
	public List<DImgVO> InfoMImgList(Long m_num) {
		
		return imgmapper.getInfoMImgList(m_num);
	}
	@Override
	public List<DImgVO> InfoCImgList(Long m_num) {
		// TODO Auto-generated method stub
		return imgmapper.getInfoCImgList(m_num);
	}

}
