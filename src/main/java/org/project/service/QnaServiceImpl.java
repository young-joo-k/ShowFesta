package org.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.project.domain.Criteria;
import org.project.domain.QnaVO;
import org.project.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService{
	private QnaMapper mapper;
	
	@Override
	public void register(QnaVO qna) {
		log.info("register...." + qna);
		mapper.insertSelectKey(qna);
	}

	@Override
	public QnaVO get(Long b_num) {
		// TODO Auto-generated method stub
		log.info("qna get");
		return mapper.read(b_num);
	}

	@Override
	public boolean remove(Long b_num) {
		// TODO Auto-generated method stub
		return mapper.delete(b_num) == 1;
	}

    @Override
    public List<QnaVO> getList(Criteria cri) {
    	log.info("get List with criteria: " + cri);
    	return mapper.getListWithPaging(cri);
    }
    

	@Override
	public int qnaTotal(Criteria cri) {
		// TODO Auto-generated method stub
    	log.info("get qna total count");
    	return mapper.qnaTotalCount(cri);
    }
	}


