package org.project.controller;

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
	@GetMapping("/insert")
	public String like(@RequestParam("actorNum")Long num, @RequestParam("userId")String a, String b) {
		log.info(num);
		log.info(a);
		return null;
	}
}
