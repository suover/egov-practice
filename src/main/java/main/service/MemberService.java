package main.service;

import java.util.List;

public interface MemberService {
	public String insertMember(MemberVO vo) throws Exception;
	public int selectMemberIdCheck(String userId) throws Exception;
	public List<?> selectPostList(String dong) throws Exception;
}
