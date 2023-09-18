package org.project.mapper;

import java.util.List;

import org.project.domain.Criteria;
import org.project.domain.NoticeVO;

public interface NoticeMapper {

	//@Select("select * from tbl_notice where b_num > 0")
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	public NoticeVO read(Long b_num);
	
	public int delete(Long b_num);
	
	public int update(NoticeVO notice);
	
	public int getTotalCount(Criteria cri);
}
