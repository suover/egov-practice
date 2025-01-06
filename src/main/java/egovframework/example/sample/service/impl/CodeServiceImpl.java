package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertCodes(CodeVO vo) throws Exception {
		
		return codeDAO.insertCodes(vo);
	}

}
