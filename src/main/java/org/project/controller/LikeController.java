package org.project.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.project.domain.LikeVO;
import org.project.service.LikeService;
import org.project.service.SmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/like/*")
@AllArgsConstructor
public class LikeController {
	@Autowired
	private LikeService likeservice;
	@Autowired
	SmsService smsservice;

	@GetMapping("/insert")
	@CrossOrigin(origins = "*")
	public String likeInsert(LikeVO likevo, String name, String phone) {
		log.info("등록likevo");
		log.info(phone);
		log.info(name);
		// like_name, id, like_type, like_img, m_num
		likeservice.LikeInsert(likevo);
		Timestamp result = smsservice.checkSend(likevo.getLike_name(), likevo.getId());
		if (result != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 날짜 및 시간 형식 지정
			String resultToString = sdf.format(result);
			System.out.println("어디까지 뜨는거야" + resultToString);
			return resultToString;
		}
		return null;
	}

	@GetMapping("/delete")
	public void likeDelete(LikeVO likevo) {
		log.info("삭제" + likevo);
		likeservice.LikeDelete(likevo);
	}

	@GetMapping("/actor_insert")
	public void likeActorInsert(LikeVO likevo) {
		log.info(likevo);
		likeservice.LikeActorInsert(likevo);
	}

	@GetMapping("/actor_delete")
	public void likeActorDelete(LikeVO likevo) {
		log.info(likevo);
		likeservice.LikeActorDelete(likevo);
	}

}
