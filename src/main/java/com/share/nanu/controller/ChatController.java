package com.share.nanu.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.security.MemberDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ChatController {
	
	private Set<String> roomList = new HashSet<String>();
	
	@GetMapping("/chat")
	public ModelAndView chatUser(ModelAndView mov) {
		
		mov.setViewName("/chat/chatUser");
		
		return mov;
	}
	
	@GetMapping("/chat/{username}")
	public ModelAndView chat(ModelAndView mov, @PathVariable("username") String username) {
		log.info("==========chat start! : " + username + "님 채팅방 입장 ==============");
		
		mov.addObject("username", username);
		mov.setViewName("/chat/chatAdmin");
		
		return mov;
	}
	
	@GetMapping("/admin/room")
	public ModelAndView room (ModelAndView mov, @AuthenticationPrincipal MemberDetails md) {
		
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
			
		
		log.info("==========현재 채팅방의 수 : " + String.valueOf(roomList.size())+ "==============");
		
		mov.addObject("roomList", roomList);
		mov.setViewName("/admin/admin_chatRoom");
		
		return mov;
	}
	
	@GetMapping("/room/list")
	public Set<String> getRoomList () {

		return roomList;
	}
	
	@PostMapping("/room")
	public Set<String> creatRomm(@AuthenticationPrincipal MemberDetails memberDetails) {
		String username = memberDetails.getUsername();
		roomList.add(username);
		
		return roomList;
	}

}
