package org.project.service;

import java.util.List;
import org.project.domain.SearchVO;

public interface SearchService {
    List<SearchVO> musicalsearch(String keyword); // �˻� �޼��� ����
    List<SearchVO> concertsearch(String keyword); // �˻� �޼��� ����
    List<SearchVO> festivalsearch(String keyword); // �˻� �޼��� ����
    List<SearchVO> actorsearch(String keyword); // �˻� �޼��� ����

    // �ٸ� �޼���� �����մϴ�.
}