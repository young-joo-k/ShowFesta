package org.project.service;

import java.util.ArrayList;

import org.project.domain.ContentsVO;
import org.project.mapper.ContentsMapper;
import org.project.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ContentsServiceImpl implements ContentsService {
	
	
	private ContentsMapper contentsmapper;

	public ArrayList<String> getMusicalContents() {
        // 여기서 실제로 데이터베이스에서 뮤지컬 콘텐츠를 가져오고 ArrayList<String> 형태로 반환
        
		//test
        ArrayList<String> musicalContents = new ArrayList<>();
//        musicalContents.add("뮤지컬 1");
//        musicalContents.add("뮤지컬 2");
        // 데이터베이스에서 가져온 실제 데이터를 여기에 추가하세요.

        return musicalContents;
    }
	
}
