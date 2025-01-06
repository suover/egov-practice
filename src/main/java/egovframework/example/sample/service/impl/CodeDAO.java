package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO {

	public String insertCodes(CodeVO vo) {
		
		return (String) insert("codeDAO.insertCodes", vo);
	}

}
