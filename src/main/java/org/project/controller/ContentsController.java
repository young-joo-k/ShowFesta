package org.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.project.domain.ContentsVO;
import org.project.domain.MemberVO;
import org.project.service.ContentsService;
import org.project.service.InfoImgService;
import org.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
	private MemberService memberservice;
	
	@GetMapping("/contentsPlus")
	public void contentsPlus(Model model, HttpSession session) {
		log.info("plus Get");
		log.info("/notice_get");
		// 아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
		}

	}

	
	@PostMapping("/contentsPlus")
	public String contentsPlus(ContentsVO contentsvo, @RequestParam("type") String type) {
	    try {
	        if ("musical".equals(type)) {
	            contentsservice.musicalContentsPlus(contentsvo);
	        } else if ("concert".equals(type)) {
	            contentsservice.concertContentsPlus(contentsvo);
	        } else {
	            // ��ȿ���� ���� type ���� �ƴ� ��쿡 ���� ó��
	            throw new IllegalArgumentException("��ȿ���� ���� type ���Դϴ�: " + type);
	        }
	        return "redirect:/page/adminPage";
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	@GetMapping("/contentsDelete")
	public void contentsDelete(Model model, HttpSession session) {
		log.info("delete Get");
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			}
		List<ContentsVO> musicalList = contentsservice.getMusicalContents();
		log.info(musicalList);
		if (musicalList == null || musicalList.isEmpty()) {

			System.out.println(musicalList.get(0).getM_num());
			log.info("�迭�� ����ֽ��ϴ�.");

			model.addAttribute("musicalContents", musicalList);
		}

		model.addAttribute("musicalContents", musicalList);
		
		List<ContentsVO> concertList = contentsservice.getConcertContents();

		if (concertList == null || concertList.isEmpty()) {
			System.out.println(concertList.get(0).getM_num());
			model.addAttribute("concertContents", concertList);
			log.info("�迭�� ����ֽ��ϴ�.");
		}
		model.addAttribute("concertContents", concertList);
	}
	
	
	@PostMapping("/contentsDelete")
	public String contentsDelete(Model model, ContentsVO contentsvo, @RequestParam("contentType") String contentType, @RequestParam(value = "selectedcontents", required = false) String[] selectedContents) {
	    log.info("������ ����");

	    if ("musical".equals(contentType)) {
	        // ������ ���� ����
	        if (selectedContents != null && selectedContents.length > 0) {
	            log.info("selectedContents �迭 ����: " + selectedContents.length);

	            for (String contentNumStr : selectedContents) {
	                try {
	                    int m_num = Integer.parseInt(contentNumStr);
	                    log.info("���õ� ������ ������ " + m_num);

	                    contentsservice.deleteContentsByM_num(m_num);
	                } catch (NumberFormatException e) {
	                    log.error("�߸��� ������ ��ȣ ����: " + contentNumStr, e);
	                } catch (Exception e) {
	                    log.error("������ ���� �� ���� �߻�: " + e.getMessage(), e);
	                }
	            }
	        } else {
	            log.info("������ ������ ������ ����");
	        }
	    } else if ("concert".equals(contentType)) {
	        // �ܼ�Ʈ ���� ����
	        if (selectedContents != null && selectedContents.length > 0) {
	            log.info("selectedContents �迭 ����: " + selectedContents.length);

	            for (String contentNumStr : selectedContents) {
	                try {
	                    int m_num = Integer.parseInt(contentNumStr);
	                    log.info("���õ� �ܼ�Ʈ ������ " + m_num);

	                    contentsservice.deleteConcertContentsByM_num(m_num); // m_num�� ������ ��ȯ�Ͽ� ����
	                } catch (NumberFormatException e) {
	                    log.error("�߸��� ������ ��ȣ ����: " + contentNumStr, e);
	                } catch (Exception e) {
	                    log.error("������ ���� �� ���� �߻�: " + e.getMessage(), e);
	                }
	            }
	        } else {
	            log.info("������ �ܼ�Ʈ ������ ����");
	        }
	    }

	    // ���� �Ŀ� � �������� �����̷�Ʈ�� �� ����
	    return "redirect:/page/contentsDelete";
	}
}
