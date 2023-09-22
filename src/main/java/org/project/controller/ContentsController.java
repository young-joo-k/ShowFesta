package org.project.controller;

import org.project.domain.ContentsVO;
import org.project.service.ContentsService;
import org.project.service.InfoImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor
public class ContentsController {

	@Autowired
	private ContentsService contentsservice;
	
	@Autowired
	private InfoImgService infoimgservice;
	
	@GetMapping("/contentsPlus")
	public void contentsPlus() {
		log.info("plus Get");

	}

	
	@PostMapping("/contentsPlus")
	public String contentsPlus(ContentsVO contentsvo, @RequestParam("type") String type) {
	    try {
	        if ("musical".equals(type)) {
	            contentsservice.musicalContentsPlus(contentsvo);
	        } else if ("concert".equals(type)) {
	            contentsservice.concertContentsPlus(contentsvo);
	        } else {
	            // 유효하지 않은 type 값이 아닌 경우에 대한 처리
	            throw new IllegalArgumentException("유효하지 않은 type 값입니다: " + type);
	        }
	        return "redirect:/page/adminPage";
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

}
