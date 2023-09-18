package org.project.service;

import java.util.List;

import org.project.domain.Criteria;
import org.project.domain.QnaVO;

public interface QnaService {
	public void register(QnaVO qna);
	
	public QnaVO get(Long b_num);
	
	
	public boolean remove(Long b_num);
	
	//public List<QnaVO> getList();
	
	public List<QnaVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
