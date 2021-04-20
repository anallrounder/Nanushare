package com.share.nanu.controller;


import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/error")
public class CustomErrorController implements ErrorController{
	
	private String path = "/error";
	private String viewPath = "404";
	
	/*
	 * @RequestMapping("/error") public String error() {
	 * 
	 * }
	 */
	

	@Override
	public String getErrorPath() {
		
		return null;
	}

}
