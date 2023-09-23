package org.project.controller;

import java.util.List;

import org.project.domain.ContentsVO;
import org.project.service.ContentsService;
import org.project.service.InfoImgService;
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
	
	@GetMapping("/contentsDelete")
	public void contentsDelete(Model model) {
		log.info("delete Get");
		List<ContentsVO> musicalList = contentsservice.getMusicalContents();
		log.info(musicalList);
		if (musicalList == null || musicalList.isEmpty()) {

			System.out.println(musicalList.get(0).getM_num());
			log.info("배열이 비어있습니다.");

			model.addAttribute("musicalContents", musicalList);
		}

		model.addAttribute("musicalContents", musicalList);
		
		List<ContentsVO> concertList = contentsservice.getConcertContents();

		if (concertList == null || concertList.isEmpty()) {
			System.out.println(concertList.get(0).getM_num());
			model.addAttribute("concertContents", concertList);
			log.info("배열이 비어있습니다.");
		}
		model.addAttribute("concertContents", concertList);
	}
	
	
	@PostMapping("/contentsDelete")
	public String contentsDelete(Model model, ContentsVO contentsvo, @RequestParam("contentType") String contentType, @RequestParam(value = "selectedcontents", required = false) String[] selectedContents) {
	    log.info("컨텐츠 삭제");

	    if ("musical".equals(contentType)) {
	        // 뮤지컬 삭제 로직
	        if (selectedContents != null && selectedContents.length > 0) {
	            log.info("selectedContents 배열 길이: " + selectedContents.length);

	            for (String contentNumStr : selectedContents) {
	                try {
	                    int m_num = Integer.parseInt(contentNumStr);
	                    log.info("선택된 뮤지컬 컨텐츠 " + m_num);

	                    contentsservice.deleteContentsByM_num(m_num);
	                } catch (NumberFormatException e) {
	                    log.error("잘못된 컨텐츠 번호 형식: " + contentNumStr, e);
	                } catch (Exception e) {
	                    log.error("컨텐츠 삭제 중 오류 발생: " + e.getMessage(), e);
	                }
	            }
	        } else {
	            log.info("선택한 뮤지컬 컨텐츠 없음");
	        }
	    } else if ("concert".equals(contentType)) {
	        // 콘서트 삭제 로직
	        if (selectedContents != null && selectedContents.length > 0) {
	            log.info("selectedContents 배열 길이: " + selectedContents.length);

	            for (String contentNumStr : selectedContents) {
	                try {
	                    int m_num = Integer.parseInt(contentNumStr);
	                    log.info("선택된 콘서트 컨텐츠 " + m_num);

	                    contentsservice.deleteConcertContentsByM_num(m_num); // m_num을 정수로 변환하여 전달
	                } catch (NumberFormatException e) {
	                    log.error("잘못된 컨텐츠 번호 형식: " + contentNumStr, e);
	                } catch (Exception e) {
	                    log.error("컨텐츠 삭제 중 오류 발생: " + e.getMessage(), e);
	                }
	            }
	        } else {
	            log.info("선택한 콘서트 컨텐츠 없음");
	        }
	    }

	    // 삭제 후에 어떤 페이지로 리다이렉트할 지 결정
	    return "redirect:/page/contentsDelete";
	}
}
