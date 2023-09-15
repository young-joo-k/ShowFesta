package org.project.service;

import java.util.List;
import org.project.domain.SearchVO;

public interface SearchService {
    List<SearchVO> search(String keyword); // 검색 메서드 정의

    // 다른 메서드는 제거합니다.
}