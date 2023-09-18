package org.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.project.domain.Criteria;
import org.project.domain.NoticeVO;
import org.project.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeVO notice) {
		log.info("register...." + notice);
		mapper.insertSelectKey(notice);
	}

	@Override
	public NoticeVO get(Long b_num) {
		// TODO Auto-generated method stub
		log.info("asdsa");
		return mapper.read(b_num);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		// TODO Auto-generated method stub
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(Long b_num) {
		// TODO Auto-generated method stub
		return mapper.delete(b_num) == 1;
	}

	/*
	 * @Override public List<NoticeVO> getList() { // TODO Auto-generated method
	 * stub log.info("getList........"); return mapper.getList(); }
	 */
    @Override
    public List<NoticeVO> getList(Criteria cri) {
    	log.info("get List with criteria: " + cri);
    	return mapper.getListWithPaging(cri);
    }
    
    @Override
    public int getTotal(Criteria cri) {
    	
    	log.info("get total count");
    	return mapper.getTotalCount(cri);
    }
}
