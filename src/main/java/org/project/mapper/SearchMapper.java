package org.project.mapper;

import java.util.List;

import javax.naming.directory.SearchResult;

import org.project.domain.SearchVO;

public interface SearchMapper {
    List<SearchVO> searchMusicals(String keyword);
    List<SearchVO> searchConcerts(String keyword);
    List<SearchVO> searchFestivals(String keyword);
    List<SearchVO> searchActors(String keyword);
}