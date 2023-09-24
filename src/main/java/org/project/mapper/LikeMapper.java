package org.project.mapper;

import java.util.List;

import org.project.domain.LikeVO;
import org.project.domain.UploadVO;

public interface LikeMapper {
	public void insert(LikeVO likevo);
	public void delete(LikeVO likevo);
	public List<LikeVO> getLike(String id);
	public void Actorinsert(LikeVO likevo);
	public void Actordelete(LikeVO likevo);
	public void updateReserve(UploadVO uploadvo);
	public String getReserveId(LikeVO likevo);
}
