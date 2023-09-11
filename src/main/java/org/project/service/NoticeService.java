package org.project.service;

import java.util.List;

import org.project.domain.NoticeVO;

public interface NoticeService {
	public void register(NoticeVO notice);
	
	public NoticeVO get(Long b_num);
	
	public boolean modify(NoticeVO notice);
	
	public boolean remove(Long b_num);
	
	public List<NoticeVO> getList();
}
