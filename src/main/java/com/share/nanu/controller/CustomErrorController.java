package com.share.nanu.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.security.MemberDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomErrorController implements ErrorController {

	@GetMapping("/errorPage")
	public ModelAndView handlerError(ModelAndView mav, HttpServletRequest request, HttpServletResponse response,@AuthenticationPrincipal MemberDetails md) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		log.info("에러 코드 : " + status);

		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				mav.setViewName("/error/404");
			} else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
				mav.setViewName("/error/404");
			} else if (statusCode == HttpStatus.FORBIDDEN.value()) {
				mav.setViewName("/error/404");
			} else {
				mav.setViewName("/error/404");
			}
		}
		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}

		return mav;

	}

	@Override
	public String getErrorPath() {

		return null;
	}

}
