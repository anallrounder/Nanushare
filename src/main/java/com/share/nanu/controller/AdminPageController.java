package com.share.nanu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.share.nanu.VO.Board_ListVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.page.pageVO;
import com.share.nanu.service.MyPageService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
public class AdminPageController {

	@Autowired
	private MyPageService mgservice;
	
	@GetMapping("/Donation")
	public ModelAndView adminDM(ModelAndView mov) {
		
		return mov;
	}
}