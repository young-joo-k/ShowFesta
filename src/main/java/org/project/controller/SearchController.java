package org.project.controller;

import java.util.List;

import org.project.domain.FestaVO;
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
    private SearchService searchService; // SearchService�� �����ϼ���.

    @GetMapping("/search")
    public String search(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
        if (keyword != null && !keyword.isEmpty()) {
            List<SearchVO> musicalSearchResults = searchService.musicalsearch(keyword);
            List<SearchVO> concertSearchResults = searchService.concertsearch(keyword);
            List<FestaVO> festivalSearchResults = searchService.festivalsearch(keyword);
            List<SearchVO> actorSearchResults = searchService.actorsearch(keyword);
    		int fsList = festivalSearchResults.size();
    		model.addAttribute("length",fsList);
            model.addAttribute("musicalSearchResults", musicalSearchResults);
            model.addAttribute("festivalSearchResults", festivalSearchResults);
            model.addAttribute("actorSearchResults", actorSearchResults);
            model.addAttribute("concertSearchResults", concertSearchResults);
            log.info("Get");
        }
        return "page/search";
    }
    @GetMapping("/searchResult_musical")
    public String searchMusical(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
    	if (keyword != null && !keyword.isEmpty()) {
    		List<SearchVO> musicalSearchResults = searchService.musicalsearch(keyword);
    		model.addAttribute("musicalSearchResults", musicalSearchResults);
    		log.info("Get");
    	}
    	return "page/searchResult_musical"; // �˻� ����� ������ �� �̸� (search.jsp �Ǵ� �ٸ� �̸�)
    }
    @GetMapping("/searchResult_concert")
    public String searchConcert(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
    	if (keyword != null && !keyword.isEmpty()) {
    		List<SearchVO> concertSearchResults = searchService.concertsearch(keyword);
    		model.addAttribute("concertSearchResults", concertSearchResults);
    		log.info("Get");
    	}
    	return "page/searchResult_concert"; // �˻� ����� ������ �� �̸� (search.jsp �Ǵ� �ٸ� �̸�)
    }
    @GetMapping("/searchResult_festival")
    public String searchFestival(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
    	if (keyword != null && !keyword.isEmpty()) {
    		List<FestaVO> festivalSearchResults = searchService.festivalsearch(keyword);
    		model.addAttribute("festivalSearchResults", festivalSearchResults);
    		int fsList = festivalSearchResults.size();
    		model.addAttribute("length",fsList);
    		log.info("Get");
    	}
    	return "page/searchResult_festival"; // �˻� ����� ������ �� �̸� (search.jsp �Ǵ� �ٸ� �̸�)
    }
    @GetMapping("/searchResult_actor")
    public String searchActor(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
    	if (keyword != null && !keyword.isEmpty()) {
    		List<SearchVO> actorSearchResults = searchService.actorsearch(keyword);
    		model.addAttribute("actorSearchResults", actorSearchResults);
    		log.info("Get");
    	}
    	return "page/searchResult_actor"; // �˻� ����� ������ �� �̸� (search.jsp �Ǵ� �ٸ� �̸�)
    }
}
