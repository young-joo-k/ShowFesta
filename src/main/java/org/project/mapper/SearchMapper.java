package org.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.project.domain.SearchVO;

public interface SearchMapper {

	//@Select("select * from tbl_notice where b_num > 0")
	public List<SearchVO> getList();
	
	public void insert(SearchVO notice);
	
	public void insertSelectKey(SearchVO notice);
	
	public SearchVO read(Long b_num);
	
	public int delete(Long b_num);
	
	public int update(SearchVO notice);
}
