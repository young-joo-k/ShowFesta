package org.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.project.data.DateData;
import org.project.domain.MemberVO;
import org.project.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
public class PageController {
	@Autowired
	ScheduleService service;

	@GetMapping("/calendar")
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {
		log.info("calendar Get");
		Calendar cal = Calendar.getInstance();
		DateData calendarData;

		// 寃��깋 �궇吏�
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}
		// 寃��깋 �궇吏� end

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		// �떎吏덉쟻�씤 �떖�젰 �뜲�씠�꽣 由ъ뒪�듃�뿉 �뜲�씠�꽣 �궫�엯 �떆�옉.
		// �씪�떒 �떆�옉 �씤�뜳�뒪源뚯� �븘臾닿쾬�룄 �뾾�뒗 �뜲�씠�꽣 �궫�엯
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null);
			dateList.add(calendarData);
		}

		// �궇吏� �궫�엯
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

		// �떖�젰 鍮덇납 鍮� �뜲�씠�꽣濡� �궫�엯
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {
			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		int todayCnt = service.selectCnt();
		// 諛곗뿴�뿉 �떞�쓬
		model.addAttribute("todayCnt", todayCnt);
		model.addAttribute("dateList", dateList); // �궇吏� �뜲�씠�꽣 諛곗뿴
		model.addAttribute("today_info", today_info);
		return "/page/calendar";
	}

	@GetMapping("/musical_info")
	public void main() {

	}

	@GetMapping("/news")
	public void latestNewsPage() {
		log.info("News get");
	}

	@GetMapping("/main")
	public void homePage() {
		log.info("main get");
	}

}
