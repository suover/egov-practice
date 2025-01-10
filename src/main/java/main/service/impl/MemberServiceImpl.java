package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public String insertMember(MemberVO vo) throws Exception {
		
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String userId) throws Exception {
		
		return memberDAO.selectMemberIdCheck(userId);
	}

	@Override
	public List<?> selectPostList(String dong) throws Exception {
		
		return memberDAO.selectPostList(dong);
	}

	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		
		return memberDAO.selectMemberCount(vo);
	}

}
