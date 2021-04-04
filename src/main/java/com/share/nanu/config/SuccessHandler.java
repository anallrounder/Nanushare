package com.share.nanu.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class SuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	public SuccessHandler(String defalutTargetUrl) {
		setDefaultTargetUrl(defalutTargetUrl);
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session != null) { // 이전페이지 주소가 없다면 null 
			String redirectUrl = (String) session.getAttribute("prevPage"); //리다이렉트 되어질 주소를 저장
			if (redirectUrl != null) {
				session.removeAttribute("prevPage"); //이전 주소의 세션을 삭제
				getRedirectStrategy().sendRedirect(request, response, redirectUrl); //이전주소로 리다이렉트
			} else {
				super.onAuthenticationSuccess(request, response, authentication);
			}
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}

	}
}
