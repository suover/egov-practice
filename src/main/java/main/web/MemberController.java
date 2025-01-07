package main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	/*
	 * 회원등록화면
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}
}
