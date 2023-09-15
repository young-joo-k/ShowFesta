package org.project.service;

import java.util.ArrayList;
import java.util.List;

import org.project.domain.SearchVO;
import org.project.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchMapper searchMapper; // MyBatis Mapper 인터페이스를 주입

    @Override
    public List<SearchVO> search(String keyword) {
        List<SearchVO> results = new ArrayList<>();
        results.addAll(searchMapper.searchMusicals(keyword));
        results.addAll(searchMapper.searchFestivals(keyword));
        results.addAll(searchMapper.searchActors(keyword));
        return results;
    }
    
}