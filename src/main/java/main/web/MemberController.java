package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	/*
	 * 회원등록화면
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}
	
	/*
	 * 회원등록처리 
	 */
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		
		String message = "";
		
		String result = memberService.insertMember(vo);
		
		if (result == null) {
			message = "ok";
		}
		return message;
	}
	
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userId) throws Exception {
		
		String message = "";
		int count = memberService.selectMemberIdCheck(userId);
		
		if (count == 0) {
			message = "ok";
		}
		
		return message;
	}
	
	@RequestMapping("/post1.do")
	public String post1() {
		return "member/post1";
	}
	
	@RequestMapping("/post2.do")
	public String post2(String dong, ModelMap model) throws Exception {
		
		List<?> list = memberService.selectPostList(dong);
		model.addAttribute("resultList", list);
		
		return "member/post2";
	}
	
}
