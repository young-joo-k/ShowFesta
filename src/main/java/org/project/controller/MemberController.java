package org.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.project.domain.MemberVO;
import org.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@Service
@RequestMapping("/join/*")
public class MemberController {
	@Autowired
	private MemberService service;


	//�뾽濡쒕뱶濡� 媛��뒗 硫붿냼�뱶
	@GetMapping("/upload")
	public void form() {}
	
	@PostMapping("join/upload")
	public String upload(MemberVO membervo,@RequestParam("file") MultipartFile file,RedirectAttributes rttr) {
		String fileRealName = file.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
		long size = file.getSize(); //�뙆�씪 �궗�씠利�
		
		System.out.println("�뙆�씪紐� : "  + fileRealName);
		System.out.println("�슜�웾�겕湲�(byte) : " + size);
		//�꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽  �솗�옣�옄 紐낆쓣 援ы븿
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:\\fileUpload";
		
		// �뤃�뜑媛� �뾾�뒗 寃쎌슦 �뤃�뜑瑜� �깮�꽦�빀�땲�떎.
	    File folder = new File(uploadFolder);
	    if (!folder.exists()) {
	        folder.mkdirs(); // �뤃�뜑 諛� �븯�쐞 �뤃�뜑源뚯� 紐⑤몢 �깮�꽦
	    }
		
	    //而댄벂�꽣�뒗 �룞�씪�븳 �뙆�씪 ���옣�� 紐삵빐�꽌 uuid瑜� �넻�빐�꽌 �옖�뜡�쑝濡� 諛쏆븘�빞 �븳�떎怨� �븿
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("�깮�꽦�맂 怨좎쑀臾몄옄�뿴" + uniqueName);
		System.out.println("�솗�옣�옄紐�" + fileExtension);
		
		
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid �쟻�슜 �쟾
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // �쟻�슜 �썑
		try {
			file.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		//�뿬湲곕��꽣 �궗�뾽�옄 �쉶�썝媛��엯 �븯�뒗 湲곕뒫 �궗�떎 諛묒뿉�옉 �삊媛숈븘�꽌 萸붽� �븿�닔濡� 留뚮뱾硫� 醫뗭� �븡�쓣源� �떢湲댄븳�뜲 �뼱耳��븷吏� 紐⑤Ⅴ寃잛쓬
		log.info("�궗�뾽�옄 register ->" + membervo);
		boolean IDChk;
		boolean EChk;
		IDChk = service.registerIdCheck(membervo.getId());
		EChk = service.registerEmailCheck(membervo.getEmail());
		if (IDChk == false) {
			rttr.addFlashAttribute("result", "以묐났�맂 ID");
			return "redirect:/join/register";
		}
		if (EChk == false) {
			rttr.addFlashAttribute("result", "以묐났�맂 EMAIL");
			return "redirect:/join/register";
		}
		membervo.setFilename(uniqueName);
		service.register2(membervo);
		///////////////////////////////�뿬湲곗꽌�뒗 �쉶�썝媛��엯�쓣 �닃�윭�룄 愿�由ъ옄 �듅�씤�븯�뿉 �쉶�썝媛��엯�씠 �릺�뒗 嫄곕씪 洹몃깷 硫붿씤�쑝濡� 蹂대깂
		rttr.addFlashAttribute("result", "愿�由ъ옄�쓽 �듅�씤�쓣 湲곕떎由ъ꽭�슂");
		return "redirect:/join/main";
	}
	

	
	@GetMapping("join/login")
	public String login(HttpSession session) {
		log.info("login Get");
		String id = (String) session.getAttribute("id");
		if (id == null || id.equals("�듅�씤�씠 �릺吏� �븡�� �궗�슜�옄 �엯�땲�떎.")|| id.equals("�뾾�뒗 �븘�씠�뵒 �엯�땲�떎.") || id.equals("�뙣�뒪�썙�뱶媛� �떎由낅땲�떎.") || id.equals("�쑀�� ���엯�씠 �떎由낅땲�떎.")) {// 濡쒓렇�씤 x
		    session.invalidate();
			return "/join/login";
		}
		return "redirect:home";// 濡쒓렇�씤 o
	}

	@PostMapping("join/login")
	public String login(MemberVO membervo, HttpSession session, RedirectAttributes rttr) {
		log.info("login post, Id -> " + membervo.getId());
		String checkId = service.login(membervo.getId(), membervo.getPw());
		if (checkId != null && checkId.equals(membervo.getId())) {
		    session.setAttribute("id", checkId);
		    log.info(checkId + "->main");
		    return "redirect:home";
		}
		rttr.addFlashAttribute("result", checkId);
		log.info(checkId+"->login");
		return "redirect:/join/login";
	}

	@RequestMapping(value = "join/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		log.info("logout");
	    session.invalidate();
	    log.info("logout");
	    return "/home";
	}

	@GetMapping("/main")
	public void main(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		log.info("main Get");
		if (id != null) {
			MemberVO membervo = service.getUserInfo(id);
			model.addAttribute("user", membervo);
		}
	}
	@GetMapping("id_find")
	public void findId() {
		log.info("id_find Get");
	}
	
	@PostMapping("id_find")
	public String findId(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phone") String phone, Model model) {
		// MemberService瑜� �샇異쒗븯�뿬 �븘�씠�뵒 李얘린 濡쒖쭅 �닔�뻾
        String foundId = service.findId(name, email, phone);

        if (foundId != null) {
            model.addAttribute("message", "�븘�씠�뵒�뒗 " + foundId + " �엯�땲�떎.");
            model.addAttribute("foundId", foundId);
        } else {
            model.addAttribute("message", "�씪移섑븯�뒗 �븘�씠�뵒瑜� 李얠쓣 �닔 �뾾�뒿�땲�떎.");
        }

        return "id_find_result"; // 寃곌낵瑜� �몴�떆�븷 JSP �뙆�씪�쓽 �씠由� 諛섑솚
    }
	@GetMapping("id_find_result")
	public void findIdResult() {
		log.info("id_find_Result Get");
	}
	
	@GetMapping("pw_find")
	public void findPw() {
		log.info("pw_find Get");
	}

	
	@PostMapping("pw_find")
	public String findPw(
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("checked") int checked,
			@RequestParam("phone") String phone, Model model) {
		// MemberService瑜� �샇異쒗븯�뿬 �븘�씠�뵒 李얘린 濡쒖쭅 �닔�뻾
        String foundPw = service.findPw(id, name, email, phone, checked);

        if (foundPw != null) {
            model.addAttribute("message", "鍮꾨�踰덊샇�뒗 " + foundPw + " �엯�땲�떎.");
            model.addAttribute("foundPw", foundPw);
        } else {
            model.addAttribute("message", "�씪移섑븯�뒗 鍮꾨�踰덊샇瑜� 李얠쓣 �닔 �뾾�뒿�땲�떎.");
        }

        return "/join/pw_find_result"; // 寃곌낵瑜� �몴�떆�븷 JSP �뙆�씪�쓽 �씠由� 諛섑솚
    }
	
	@GetMapping("register")
	public void register() {
		log.info("register Get");
	}
	
	@PostMapping("join/register")
	public String register(MemberVO membervo, RedirectAttributes rttr) {
		log.info("register ->" + membervo);
		boolean IDChk;
		boolean EChk;
		IDChk = service.registerIdCheck(membervo.getId());
		EChk = service.registerEmailCheck(membervo.getEmail());
		if (IDChk == false) {
			rttr.addFlashAttribute("result", "以묐났�맂 ID");
			return "redirect:/join/register";
		}
		else if (EChk == false) {
			rttr.addFlashAttribute("result", "以묐났�맂 EMAIL");
			return "redirect:/join/register";
		}

		service.register(membervo);
		rttr.addFlashAttribute("result", "�쉶�썝媛��엯 �셿猷�");
		// redirect login
		return "redirect:/join/login";
	}

}