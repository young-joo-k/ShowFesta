package org.project.service;

import java.util.List;

import org.project.domain.ContentsVO;
import org.project.mapper.ContentsMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ContentsServiceImpl implements ContentsService {
	
	
	private ContentsMapper contentsmapper;
	@Override
	public List<ContentsVO> getMusicalContents() {
        log.info("getMusicalContents");
//        List<ContentsVO> musicalContents = new List<>();
        
        
        return contentsmapper.getMusicalContents();

    }

	@Override
	public ContentsVO getMusical(Long m_num) {
		log.info("get---"+m_num);
		
		return contentsmapper.MusicalRead(m_num);
	}
	
	
}
