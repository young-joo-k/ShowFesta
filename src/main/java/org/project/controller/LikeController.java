package org.project.controller;

import org.project.domain.LikeVO;
import org.project.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/insert")
	public void likeInsert(LikeVO likevo) {
		log.info(likevo);
		likeservice.LikeInsert(likevo);
	}

	@GetMapping("/delete")
	public void likeDelete(LikeVO likevo) {
		log.info(likevo);
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
