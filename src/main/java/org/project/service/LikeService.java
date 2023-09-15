package org.project.service;

import java.util.List;

import org.project.domain.LikeVO;

public interface LikeService {
	public void LikeInsert(LikeVO likevo);
	public void LikeDelete(LikeVO likevo);
	public List<LikeVO> getLike(String id);
}
