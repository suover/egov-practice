package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}
	
	@RequestMapping(value="/codeWriteSave.do")
	public String insertCode(CodeVO vo) throws Exception {
		
		String result = codeService.insertCodes(vo);
		
		if (result == null) {
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		return "redirect:codeList.do";
	}
}
