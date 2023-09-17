package org.project.service;

import java.util.List;

import org.project.domain.LikeVO;
import org.project.mapper.LikeMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LikeServiceImpl implements LikeService{
	
	private LikeMapper likemapper;
	@Override
	public void LikeInsert(LikeVO likevo) {
		likemapper.insert(likevo);		
	}
	@Override
	public void LikeDelete(LikeVO likevo) {
		likemapper.delete(likevo);		
	}
	@Override
	public List<LikeVO> getLike(String id) {
		return likemapper.getLike(id);
	}

}
