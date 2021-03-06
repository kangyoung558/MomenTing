package com.momtenting.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.momtenting.domain.MemberVo;
import com.momtenting.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService service;
	
	//private Authentication authentication;
	
	@GetMapping("register")
	public void register() {
		log.info("Member register....");
	}
	
	@PostMapping("register")
	public String register(MemberVo memberVo, RedirectAttributes rttr) {
		log.info("post register....");
		log.info(memberVo);
		service.register(memberVo);
		rttr.addFlashAttribute("result", memberVo.getUserName() + "님 가입을 축하드립니다.");
		return "redirect:/customLogin";
	}
	
	@GetMapping("userinfo")
	@PreAuthorize("isAuthenticated()")
	public void getUserInfo(@RequestParam("username") String username, Model model) {
		//MemberVo memberVo = (MemberVo) authentication.getPrincipal();
		
		log.info("Member update...." + username);
		log.info("Member update...." + service.get(username));
		model.addAttribute("userinfo", service.get(username));
	}
	
	@PostMapping("update")
	@PreAuthorize("isAuthenticated()")
	public String update(MemberVo memberVo, RedirectAttributes rttr) {
		log.info("update....");
		log.info(memberVo);
		if (service.update(memberVo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/customLogin";
	}
	
	@PostMapping("delete")
	@PreAuthorize("isAuthenticated()")
	public String delete(@RequestParam("userid") String userneme, RedirectAttributes rttr) {
		log.info("delete...");
		log.info(service.get(userneme));
		if(service.delete(userneme)) {
			rttr.addFlashAttribute("result", "그동안 MomenTing을 이용해 주셔서 감사합니다.");
		}
		return "redirect:/customLogin";
	}
}
