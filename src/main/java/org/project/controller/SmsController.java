package org.project.controller;

import org.project.service.SmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import lombok.extern.log4j.Log4j;
@RestController
@Log4j
@RequestMapping("/sms/*")
public class SmsController {
	@Autowired
	SmsService smsservice;
    
    @PostMapping("/sendSMS")
    public String sendSMS(@RequestParam(name = "to") String to
    		, @RequestParam(name = "subject") String subject,
    		@RequestParam(name = "content") String content,@RequestParam(name = "reserveTime") String reserveTime  ) {
    	log.info("포스트센드메세지");
    	
        try {
            String result = SmsSender.sendSms(to, subject, content, reserveTime);
            log.info(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
}