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
    public List<SearchVO> musicalsearch(String keyword) {
        List<SearchVO> musicalSearchResults = new ArrayList<>();
        musicalSearchResults.addAll(searchMapper.searchMusicals(keyword));
        return musicalSearchResults;
    }
    @Override
    public List<SearchVO> concertsearch(String keyword) {
    	List<SearchVO> concertSearchResults = new ArrayList<>();
    	concertSearchResults.addAll(searchMapper.searchConcerts(keyword));
    	return concertSearchResults;
    }
    @Override
    public List<SearchVO> festivalsearch(String keyword) {
    	List<SearchVO> festivalSearchResults = new ArrayList<>();
    	festivalSearchResults.addAll(searchMapper.searchFestivals(keyword));
    	return festivalSearchResults;
    }
    @Override
    public List<SearchVO> actorsearch(String keyword) {
    	List<SearchVO> actorSearchResults = new ArrayList<>();
    	actorSearchResults.addAll(searchMapper.searchActors(keyword));
    	return actorSearchResults;
    }
    
}