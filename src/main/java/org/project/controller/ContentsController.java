package org.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor
public class ContentsController {

	@GetMapping("/contentsPlus")
	public void contentsPlus() {
		log.info("plus Get");
		
	}


}
