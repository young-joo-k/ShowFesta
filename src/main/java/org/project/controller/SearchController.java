package org.project.controller;

import java.util.List;

import org.project.domain.SearchVO;
import org.project.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@Service
@RequestMapping("/page/*")
public class SearchController {

    @Autowired
    private SearchService searchService; // SearchService를 주입하세요.

    @GetMapping("/search")
    public String search(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
        if (keyword != null && !keyword.isEmpty()) {
            List<SearchVO> searchResults = searchService.search(keyword);
            model.addAttribute("searchResults", searchResults);
        }
        return "search"; // 검색 결과를 보여줄 뷰 이름 (search.jsp 또는 다른 이름)
    }
}