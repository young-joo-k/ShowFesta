package org.project.mapper;

import java.util.List;

import org.project.domain.Criteria;
import org.project.domain.QnaVO;

public interface QnaMapper {

	//@Select("select * from tbl_Qna where b_num > 0")
	public List<QnaVO> getList();
	
	public List<QnaVO> getListWithPaging(Criteria cri);
	
	public void insert(QnaVO qna);
	
	public void insertSelectKey(QnaVO qna);
	
	public QnaVO read(Long b_num);
	
	public int delete(Long b_num);
	
	public int getTotalCount(Criteria cri);
}
