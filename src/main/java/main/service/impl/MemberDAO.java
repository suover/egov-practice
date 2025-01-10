package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		
		return (String) insert("memberDAO.insertMember", vo);
	}

	public int selectMemberIdCheck(String userId) {
		
		return (int) select("memberDAO.selectMemberIdCheck", userId);
	}

	public List<?> selectPostList(String dong) {
		
		return list("memberDAO.selectPostList", dong);
	}

	public int selectMemberCount(MemberVO vo) {
		
		return (int) select("memberDAO.selectMemberCount", vo);
	}

}
