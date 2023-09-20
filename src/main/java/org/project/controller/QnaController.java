package org.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.project.domain.Criteria;
import org.project.domain.LikeVO;
import org.project.domain.MemberVO;
import org.project.domain.QnaVO;
import org.project.domain.PageDTO;
import org.project.service.MemberService;
import org.project.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
public class QnaController {
	
	@Autowired
	private QnaService service;
	@Autowired
	private MemberService memberservice;

	@GetMapping("/qna_register")
	public String qnaRegister(Model model, HttpSession session ) {
		log.info("register Get!");
		String id = (String) session.getAttribute("id");
		log.info(id);
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			
			//즐겨찾기테이블에 즐겨찾기한 항목의 모든 정보를 가져와
			QnaVO qna = new QnaVO();
	        qna.setId(id); // 사용자 ID를 QnaVO 객체에 설정

	        model.addAttribute("qna", qna);
		} else{

	       return "join/login";
		}

		return "/page/qna_register";
		
		
	}
	
	@PostMapping("/qna_register")
	public String register(QnaVO qna, RedirectAttributes rttr) {
		log.info("register: " + qna);
		service.register(qna);
		rttr.addFlashAttribute("result", qna.getB_num());
		return "redirect:/page/qna_list";
	}
	
	@GetMapping("/qna_list")
	public void list(Criteria cri, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			}
		cri.setId(id);
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.qnaTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/qna_get")
	public void get(@RequestParam("b_num") Long b_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("qna_get");
		model.addAttribute("qna", service.get(b_num));
	}
}
