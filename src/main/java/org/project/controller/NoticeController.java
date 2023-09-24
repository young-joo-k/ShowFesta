package org.project.controller;

import javax.servlet.http.HttpSession;

import org.project.domain.Criteria;
import org.project.domain.MemberVO;
import org.project.domain.NoticeVO;
import org.project.domain.PageDTO;
import org.project.service.MemberService;
import org.project.service.NoticeService;
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
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MemberService memberservice;

	@PostMapping("/notice_register")
	public String register(NoticeVO notice, RedirectAttributes rttr, HttpSession session, Model model) {
		// 아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
		}
		log.info("register: " + notice);
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getB_num());
		return "redirect:/page/notice_list";
	}

	@GetMapping({ "/notice_get", "/notice_modify" })
	public void get(@RequestParam("b_num") Long b_num, @ModelAttribute("cri") Criteria cri, Model model, HttpSession session) {
		log.info("/notice_get");
		// 아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
		}
		model.addAttribute("notice", service.get(b_num));
	}

	@PostMapping("/notice_modify")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		log.info("modify:" + notice);
		if (service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/page/notice_list";
	}

	@PostMapping("/notice_remove")
	public String remove(@RequestParam("b_num") Long b_num, RedirectAttributes rttr) {
		log.info("remove....." + b_num);
		if (service.remove(b_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/page/notice_list";
	}

	@GetMapping("/notice_register")
	public void register() {
		log.info("register Get!");

	}

	@GetMapping("/notice_list")
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
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/user_qna")
	public void qna(Model model, HttpSession session) {
		log.info("qna Get!");
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			//���ã�����̺� ���ã���� �׸��� ��� ������ ������
			
		} 
	}
}
