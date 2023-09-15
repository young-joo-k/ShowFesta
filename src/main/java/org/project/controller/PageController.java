package org.project.controller;

import java.io.IOException;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.project.data.DateData;
import org.project.domain.ContentsVO;
import org.project.domain.DImgVO;
import org.project.domain.MemberVO;
import org.project.domain.PlayVO;
import org.project.service.PlayService;
import org.project.service.ContentsService;
import org.project.service.InfoImgService;
import org.project.service.MemberService;
import org.project.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
public class PageController {
	@Autowired
	private ScheduleService scheduleservice;
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private ContentsService contentsservice;
	
	@Autowired
	private PlayService playservice;
	
	@Autowired
	private InfoImgService infoimgservice;
	
	@GetMapping("/calendar")
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {
		log.info("calendar Get");
		Calendar cal = Calendar.getInstance();
		DateData calendarData;

		// 검색 날짜
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}
		// 검색 날짜 end

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		
		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		// 달력 빈곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {
			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
//		System.out.println(dateList);
		int musicalCnt = scheduleservice.getMusical();
		int concertCnt = scheduleservice.getConcerts();
		int festivalCnt = scheduleservice.getFestival();
		
		//모달창에 띄우기 위해서 필요한 코드 입니다.
		List<ContentsVO> today_m_contents = contentsservice.getToday_m_contents();
		List<ContentsVO> today_c_contents = contentsservice.getToday_c_contents();
		List<ContentsVO> today_f_contents = contentsservice.getToday_f_contents();
		
		// 배열에 담음
		model.addAttribute("musicalCnt", musicalCnt);
		model.addAttribute("concertCnt", concertCnt);
		model.addAttribute("festivalCnt", festivalCnt);
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		
		//여기 모델도 모달창에 띄우려고 쓰는거입니다
		model.addAttribute("today_m_contents", today_m_contents);
		model.addAttribute("today_c_contents", today_c_contents);
		model.addAttribute("today_f_contents", today_f_contents);
		return "/page/calendar";
	}

	@GetMapping("/main")
	public void main(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		log.info("main Get");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);

		}
		List<ContentsVO> musicalList = contentsservice.getMusicalContents();

		if (musicalList == null || musicalList.isEmpty()) {

			System.out.println(musicalList.get(0).getM_num());
			log.info("배열이 비어있습니다.");

			model.addAttribute("musicalContents", musicalList);
		}
		model.addAttribute("musicalContents", musicalList);
				
		List<ContentsVO> concertList = contentsservice.getConcertContents();
		
		
		if(concertList == null || concertList.isEmpty()) {
			System.out.println(concertList.get(0).getM_num());
			model.addAttribute("concertContents", concertList);
			log.info("배열이 비어있습니다.");
		}
		model.addAttribute("concertContents", concertList);
		
		try {
			List<ContentsVO> festivaltList = contentsservice.getFestivalContents();
			
			System.out.println(festivaltList.get(0).getM_num());
			
			model.addAttribute("festivalContents", festivaltList);
			
		} catch(IndexOutOfBoundsException e) {
			e.printStackTrace();
			log.info("배열이 비어있습니다.");
		}
		 
	}
	@GetMapping("/musical_info")
	public void m_info(HttpSession session,@RequestParam("m_num") Long m_num, Model model) {
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			log.info(membervo);

		}
		log.info(m_num);
		ContentsVO result = contentsservice.getMusical(m_num);
		String s_date = result.getM_start_date();
		result.setM_start_date(parseDate(s_date));
		String e_date = result.getM_end_date();
		result.setM_end_date(parseDate(e_date));

//		뮤지컬에 출연한 배우이름,이미지,역할 등등 가져오기
		List<PlayVO> actor = playservice.getActorList(m_num);

		System.out.println(actor);
//		상세이미지 가져오기
		List<DImgVO> img = infoimgservice.InfoMImgList(m_num);

		model.addAttribute("actorList", actor);
		model.addAttribute("musical", result);
		model.addAttribute("ImgList",img);
	}

	@GetMapping("/concert_info")
	public void c_info(@RequestParam("m_num") Long m_num, HttpSession session, Model model) {
		log.info(m_num);
//		아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
		}
//		컨텐츠 번호,이름,날짜 등등 가져오기
		ContentsVO result = contentsservice.getConcert(m_num);
		String s_date = result.getM_start_date();
		result.setM_start_date(parseDate(s_date));
		String e_date = result.getM_end_date();
		result.setM_end_date(parseDate(e_date));
//		상세이미지 가져오기
		List<DImgVO> img = infoimgservice.InfoCImgList(m_num);
		System.out.println(img);
		model.addAttribute("concert", result);
		model.addAttribute("ImgList",img);
	}

	
	//오라클로 날짜를 받아오면 2023-08-10 00:00:00 이런식으로 가져오는데 이걸 2023.08.10 으로 바꾸는 함수
	public String parseDate(String inputString)
	{
		String[] parts = inputString.split(" "); // 공백을 기준으로 문자열을 나눔
		String datePart = parts[0]; // "2023-08-10" 부분을 가져옴
		String[] dateParts = datePart.split("-"); // "-"을 기준으로 날짜 부분을 나눔
		String formattedDate = dateParts[0] + "." + dateParts[1] + "." + dateParts[2]; // 원하는 형식으로 조합
		return formattedDate;
	}
	
	@GetMapping("/news")
	public void latestNewsPage() {
		log.info("News get");
	}
	
	
	//	뮤지컬 유형별페이지 가져옵니다
	@GetMapping("/mContents")
	public void musicalContent(Model model) {
		log.info("musical contents get");
		
		List<ContentsVO> musicalList = contentsservice.getMusicalContents();
		
		if(musicalList == null || musicalList.isEmpty()) {
			
			System.out.println(musicalList.get(0).getM_num());
			log.info("배열이 비어있습니다.");
			
			model.addAttribute("musicalContents", musicalList);
		}
		model.addAttribute("musicalContents", musicalList);
	}
	
	//	콘서트 유형별페이지 가져옵니다
	@GetMapping("/concertContents")
	public void concertContent(Model model) {
		log.info("concert contents get");
		
		List<ContentsVO> concertList = contentsservice.getConcertContents();
		
		
		if(concertList == null || concertList.isEmpty()) {
			System.out.println(concertList.get(0).getM_num());
			model.addAttribute("concertContents", concertList);
			log.info("배열이 비어있습니다.");
		}
		model.addAttribute("concertContents", concertList);
	}
	
	//	페스티벌 유형별페이지 가져옵니다
	@GetMapping("/festivalContents")
	public void festivalContent(Model model) {
		log.info("festival contents get");
		
//		List<ContentsVO> festivaltList = contentsservice.getFestivalContents();
//		
//		if (festivaltList == null || festivaltList.isEmpty()) {
//			log.info("배열이 비어있습니다.");
//	        model.addAttribute("emptyContents", festivaltList);
//	        
//	    } else {
//	        model.addAttribute("festivalContents", festivaltList);
//	    }
		
		try {
			List<ContentsVO> festivaltList = contentsservice.getFestivalContents();
			
			System.out.println(festivaltList.get(0).getM_num());
			
			model.addAttribute("festivalContents", festivaltList);
			
		} catch(IndexOutOfBoundsException e) {
			e.printStackTrace();
			log.info("배열이 비어있습니다.");
		}
		 
	}
	
	

}
