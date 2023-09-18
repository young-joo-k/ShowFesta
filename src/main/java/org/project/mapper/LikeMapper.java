package org.project.mapper;

import java.util.List;

import org.project.domain.LikeVO;

public interface LikeMapper {
	public void insert(LikeVO likevo);
	public void delete(LikeVO likevo);
	public List<LikeVO> getLike(String id);
	public void Actorinsert(LikeVO likevo);
	public void Actordelete(LikeVO likevo);
}
