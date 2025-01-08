package main.service;

public interface MemberService {
	public String insertMember(MemberVO vo) throws Exception;
	public int selectMemberIdCheck(String userId) throws Exception;
}
