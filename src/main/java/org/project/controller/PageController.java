package org.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.project.data.DateData;
import org.project.domain.ContentsVO;
import org.project.domain.DImgVO;
import org.project.domain.LikeVO;
import org.project.domain.MemberVO;
import org.project.domain.PlayVO;
import org.project.domain.PriceVO;
import org.project.service.PlayService;
import org.project.service.ContentsService;
import org.project.service.InfoImgService;
import org.project.service.LikeService;
import org.project.service.MemberService;
import org.project.service.ScheduleService;
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
	@Autowired
	private LikeService likeservice;

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
		int s_index = today_info.get("start") - 1;

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
				String result = String.valueOf(dateData.getYear()).substring(2) + '/'
						+ String.valueOf(Integer.parseInt(dateData.getMonth()) + 1) + '/' + i;
				calendarData.setMusicalCnt(scheduleservice.getMusicalCnt(result));
				calendarData.setConcertCnt(scheduleservice.getConcertsCnt(result));
				calendarData.setFestivalCnt(scheduleservice.getFestivalCnt(result));
				calendarData.setM_all_contents(contentsservice.getAllMusical(result));
				calendarData.setC_all_contents(contentsservice.getAllConcert(result));
				calendarData.setF_all_contents(contentsservice.getAllFestival(result));
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
				String result = String.valueOf(dateData.getYear()).substring(2) + '/'
						+ String.valueOf(Integer.parseInt(dateData.getMonth()) + 1) + '/' + i;
				calendarData.setMusicalCnt(scheduleservice.getMusicalCnt(result));
				calendarData.setConcertCnt(scheduleservice.getConcertsCnt(result));
				calendarData.setFestivalCnt(scheduleservice.getFestivalCnt(result));
				calendarData.setM_all_contents(contentsservice.getAllMusical(result));
				calendarData.setC_all_contents(contentsservice.getAllConcert(result));
				calendarData.setF_all_contents(contentsservice.getAllFestival(result));
//	            	 System.out.println(result);
//	            	 System.out.println(calendarData.getMusicalCnt());
			}
			dateList.add(calendarData);
		}

		// 달력 빈곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;
		int l_index = dateList.size();
		List<DateData> modalList = dateList.subList(s_index, l_index);
//	      log.info(modalList.get(0).getM_all_contents());
//	      System.out.println(dateList.get(s_index));
//	      System.out.println(modalList.get(0));
		if (dateList.size() % 7 != 0) {
			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
//	      int musicalCnt = scheduleservice.getMusical();
//	      int concertCnt = scheduleservice.getConcerts();
//	      int festivalCnt = scheduleservice.getFestival();

		// 모달창에 띄우기 위해서 필요한 코드 입니다.
//	      List<ContentsVO> today_m_contents = contentsservice.getToday_m_contents();
//	      List<ContentsVO> today_c_contents = contentsservice.getToday_c_contents();
//	      List<ContentsVO> today_f_contents = contentsservice.getToday_f_contents();

		// 배열에 담음
//	      model.addAttribute("musicalCnt", musicalCnt);
//	      model.addAttribute("concertCnt", concertCnt);
//	      model.addAttribute("festivalCnt", festivalCnt);
		model.addAttribute("DateList", dateList); // 날짜 데이터 배열
		model.addAttribute("ModalList", modalList);
		model.addAttribute("today_info", today_info);
//	      System.out.println(dateList.get(5));
		// 여기 모델도 모달창에 띄우려고 쓰는거입니다
//	      model.addAttribute("today_m_contents", today_m_contents);
//	      model.addAttribute("today_c_contents", today_c_contents);
//	      model.addAttribute("today_f_contents", today_f_contents);
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

		if (concertList == null || concertList.isEmpty()) {
			System.out.println(concertList.get(0).getM_num());
			model.addAttribute("concertContents", concertList);
			log.info("배열이 비어있습니다.");
		}
		model.addAttribute("concertContents", concertList);

		try {
			List<ContentsVO> festivaltList = contentsservice.getFestivalContents();

			System.out.println(festivaltList.get(0).getM_num());

			model.addAttribute("festivalContents", festivaltList);

		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
			log.info("배열이 비어있습니다.");
		}

	}

	@GetMapping("/musical_info")
	public void m_info(HttpSession session, @RequestParam("m_num") Long m_num, Model model) {
		String id = (String) session.getAttribute("id");
		log.info("musical_info get");
		// 로그인이 되어 있는 상태라면
		if (id != null) {
			// 유저 정보 가져와서
			MemberVO membervo = memberservice.getUserInfo(id);
			// 모델에 뿌려주고
			model.addAttribute("user", membervo);
			// 즐겨찾기테이블에 즐겨찾기한 항목의 모든 정보를 가져와
			List<LikeVO> likeList = likeservice.getLike(membervo.getId());
			log.info(likeList);
			// 즐겨찾기한 애들 이름만 담을 리스트
			List<String> nameList = new ArrayList<String>();
			for (LikeVO list : likeList) {
				String name = list.getLike_name();
				nameList.add(name);
			}
//			System.out.println(nameList);
			model.addAttribute("likeList", nameList);
		}
//		log.info(m_num);
		ContentsVO result = contentsservice.getMusical(m_num);
		String s_date = result.getM_start_date();
		result.setM_start_date(parseDate(s_date));
		String e_date = result.getM_end_date();
		result.setM_end_date(parseDate(e_date));

//		뮤지컬에 출연한 배우이름,이미지,역할 등등 가져오기
		List<PlayVO> actor = playservice.getActorList(m_num);
//		뮤지컬 가격정보 가져오기		
		List<PriceVO> priceList = contentsservice.getPrice(result.getM_title());
//		System.out.println(actor);
//		상세이미지 가져오기
		List<DImgVO> img = infoimgservice.InfoMImgList(m_num);

		model.addAttribute("actorList", actor);
		model.addAttribute("musical", result);
		model.addAttribute("ImgList", img);
		model.addAttribute("priceList", priceList);
	}

	@GetMapping("/concert_info")
	public void c_info(@RequestParam("m_num") Long m_num, HttpSession session, Model model) {
		log.info(m_num);
//		아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			List<LikeVO> likeList = likeservice.getLike(membervo.getId());
			log.info(likeList);
			List<String> nameList = new ArrayList<String>();
			for (LikeVO list : likeList) {
				String name = list.getLike_name();
				nameList.add(name);
			}
//			System.out.println(nameList);
			model.addAttribute("likeList", nameList);
		}
//		컨텐츠 번호,이름,날짜 등등 가져오기
		ContentsVO result = contentsservice.getConcert(m_num);
		String s_date = result.getM_start_date();
		result.setM_start_date(parseDate(s_date));
		String e_date = result.getM_end_date();
		result.setM_end_date(parseDate(e_date));
//		상세이미지 가져오기
		List<DImgVO> img = infoimgservice.InfoCImgList(m_num);
//		콘서트 가격정보 가져오기		
		List<PriceVO> priceList = contentsservice.getPrice(result.getM_title());
		model.addAttribute("concert", result);
		model.addAttribute("ImgList", img);
		model.addAttribute("priceList", priceList);
	}

	@GetMapping("/festival_info")
	public void f_info(@RequestParam("m_num") Long m_num, HttpSession session, Model model) {
		log.info(m_num);
//		아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			List<LikeVO> likeList = likeservice.getLike(membervo.getId());
			log.info(likeList);
			List<String> nameList = new ArrayList<String>();
			for (LikeVO list : likeList) {
				String name = list.getLike_name();
				nameList.add(name);
			}
//			System.out.println(nameList);
			model.addAttribute("likeList", nameList);
		}
//		컨텐츠 번호,이름,날짜 등등 가져오기
		ContentsVO result = contentsservice.getFestival(m_num);
		String s_date = result.getM_start_date();
		result.setM_start_date(parseDate(s_date));
		String e_date = result.getM_end_date();
		result.setM_end_date(parseDate(e_date));
		model.addAttribute("festival", result);
	}

	// 오라클로 날짜를 받아오면 2023-08-10 00:00:00 이런식으로 가져오는데 이걸 2023.08.10 으로 바꾸는 함수
	public String parseDate(String inputString) {
		String[] parts = inputString.split(" "); // 공백을 기준으로 문자열을 나눔
		String datePart = parts[0]; // "2023-08-10" 부분을 가져옴
		String[] dateParts = datePart.split("-"); // "-"을 기준으로 날짜 부분을 나눔
		String formattedDate = dateParts[0] + "." + dateParts[1] + "." + dateParts[2]; // 원하는 형식으로 조합
		return formattedDate;
	}

//	@GetMapping("/news")
//	public void latestNewsPage() {
//		log.info("News get");
//	}

	// 뮤지컬 유형별페이지 가져옵니다
	@GetMapping("/mContents")
	public void musicalContent(HttpSession session, Model model) {
		log.info("musical contents get");
		String id = (String) session.getAttribute("id");
		if (id != null) {
			// 유저 정보 가져와서
			MemberVO membervo = memberservice.getUserInfo(id);
			// 모델에 뿌려주고
			model.addAttribute("user", membervo);
			// 즐겨찾기테이블에 즐겨찾기한 항목의 모든 정보를 가져와
			List<LikeVO> likeList = likeservice.getLike(membervo.getId());
			log.info(likeList);
			// 즐겨찾기한 애들 이름만 담을 리스트
			List<String> nameList = new ArrayList<String>();
			for (LikeVO list : likeList) {
				String name = list.getLike_name();
				nameList.add(name);
			}
//			System.out.println(nameList);
			model.addAttribute("likeList", nameList);
		}

		List<ContentsVO> musicalList = contentsservice.getMusicalContents();


		if (musicalList == null || musicalList.isEmpty()) {

			System.out.println(musicalList.get(0).getM_num());
			log.info("배열이 비어있습니다.");

			model.addAttribute("musicalContents", musicalList);
		}
		
		model.addAttribute("musicalContents", musicalList);
	}

	// 콘서트 유형별페이지 가져옵니다
	@GetMapping("/concertContents")
	public void concertContent(Model model) {
		log.info("concert contents get");

		List<ContentsVO> concertList = contentsservice.getConcertContents();

		if (concertList == null || concertList.isEmpty()) {
			System.out.println(concertList.get(0).getM_num());
			model.addAttribute("concertContents", concertList);
			log.info("배열이 비어있습니다.");
		}
		model.addAttribute("concertContents", concertList);
	}

	// 페스티벌 유형별페이지 가져옵니다
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

		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
			log.info("배열이 비어있습니다.");
		}

	}

	// 마이페이지
	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session, RedirectAttributes rttr) {
		log.info("mypage get");
//		아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
			// 즐겨찾기테이블에 즐겨찾기한 항목의 모든 정보를 가져와
			List<LikeVO> likeInfo = likeservice.getLike(membervo.getId());
			model.addAttribute("likeInfo", likeInfo);

		}
		if ("admin".equals(id)) {
			MemberVO membervo = memberservice.getUserInfo(id);
//			rttr.addF("manager", membervo);
			model.addAttribute("manager", membervo);
			// 사용자정보를 다 가지고 마이페이지로 넘어갑니다.
			List<MemberVO> memberAll = memberservice.getAllUser();
//			model.addAttribute("allUser", memberAll);

			model.addAttribute("allUser", memberAll);
			log.info("회원정보 전달");
			log.info("너는 관리자니까 관리자 화면으로 가");
			return "/page/adminPage";

		} else if (id == null) {

			return "/join/login";
		}

		return "/page/myPage";
	}
//	@GetMapping("/myPage")
//	public String myPage(Model model, HttpSession session ) {
//		log.info("mypage get");
////		아이디 정보
//		String id = (String) session.getAttribute("id");
//		if (id != null) {
//			MemberVO membervo = memberservice.getUserInfo(id);
//			model.addAttribute("user", membervo);
//			//즐겨찾기테이블에 즐겨찾기한 항목의 모든 정보를 가져와
//			List<LikeVO> likeInfo = likeservice.getLike(membervo.getId());
//			model.addAttribute("likeInfo",likeInfo);
//			
//		} if ("admin".equals(id)) {
//			MemberVO membervo = memberservice.getUserInfo(id);
//			model.addAttribute("manager", membervo);
//			
//			//사용자정보를 다 가지고 넘어갈거야 
//			List<MemberVO> memberAll = memberservice.getAllUser();
//			model.addAttribute("allUser", memberAll);
//			log.info("회원정보 전달 되나요");
//			return "redirect:/page/adminPage";
//			
//		} else if(id == null){
//			
//			return "/join/login";
//		}
//		
//		return "/page/myPage";
//	}

	// 회원정보수정페이지
	@GetMapping("/memberUpdate")
	public String memberCorrect(Model model, HttpSession session) {
		log.info("memberUpdate get");

		// 아이디 정보
		String id = (String) session.getAttribute("id");
		if (id != null) {
			MemberVO membervo = memberservice.getUserInfo(id);
			model.addAttribute("user", membervo);
		}

		return "/page/memberUpdate";
	}

	@GetMapping("/adminPage")
	public String adminPage(Model model, HttpSession session) {
	    String id = (String) session.getAttribute("id");
	    if (id != null) {
	        MemberVO membervo = memberservice.getUserInfo(id);
	        model.addAttribute("user", membervo);
	    }
	    else {
	    	return "redirect:/page/main";
	    }
	    return "/page/adminPage"; // 수정된 부분: 뷰 이름을 반환
	}

	@PostMapping("/deleteUsers")
	public String deleteUsers(@RequestParam(value = "selectedUsers", required = false) String[] selectedUsers, HttpServletRequest request) {
	    log.info("deleteUsers Post");
	    log.info(selectedUsers);
	    if (selectedUsers != null && selectedUsers.length > 0) {
	        log.info("selectedUsers 배열의 길이: " + selectedUsers.length); // 배열의 길이 출력
	        for (String userId : selectedUsers) {
	            log.info("선택된 사용자 ID: " + userId); // 각 사용자 ID 출력
	        
	            try {
	                memberservice.deleteUserById(userId);
	            } catch (Exception e) {
	                log.error("사용자 삭제 중 오류 발생: " + e.getMessage(), e); // 예외 정보 로그로 출력
	            }
	        }
	    } else {
	    	log.info("선택된 사용자가 없습니다.");
	    }
	    
	    // 삭제 후 관리자 페이지로 리디렉션
	    return "redirect:/page/myPage"; 
	}
	
	 @PostMapping("/contentSearchDate")
	    public String contentSearchDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, Model model) {
	        // startDate와 endDate를 사용하여 mContents를 가져오는 로직을 작성
		 
		 try {
	            if (startDate != null && endDate != null) {
	            	log.info(startDate);
	            	log.info(endDate);
	                List<ContentsVO> searchResult = contentsservice.getMusicalContentsByDate(startDate, endDate);
	                
	                model.addAttribute("searchResult", searchResult);
	                log.info(searchResult + "searchResult");
	            } 
	            return "/page/mContents"; 
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	 }
}


