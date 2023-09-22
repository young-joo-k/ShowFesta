package org.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping("/sms/*")
public class SmsController {

    @GetMapping("/sendSMSForm")
    public String sendSMSForm() {
    	log.info("get sendSMSForm");
        return "/sms/sendSMSForm"; // SMS 발송 폼을 나타내는 JSP 페이지로 이동
    }

    @PostMapping("/sendSMS")
    public String sendSMS(@RequestParam(name = "to") String to
    		, @RequestParam(name = "subject") String subject,
    		@RequestParam(name = "content") String content,
            Model model) {
        try {
            String result = SmsSender.sendSms(to, subject, content);
            model.addAttribute("result", result);
            log.info("sendSMS");
            return "/sms/smsResult"; // SMS 발송 결과를 보여주는 JSP 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "SMS 발송에 실패했습니다.");
            return "/sms/smsResult"; // SMS 발송 실패 시 결과 페이지로 이동
        }
    }
}