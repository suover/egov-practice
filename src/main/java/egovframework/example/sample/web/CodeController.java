package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	
	@RequestMapping(value="/codeList.do")
	public String selectCodeList(CodeVO vo, ModelMap model) throws Exception {
		
		int total = codeService.selectCodesCount(vo);
		List<?> list = codeService.selectCodesList(vo);
		
		model.addAttribute("resultList", list);
		model.addAttribute("resultTotal", total);
		
		return "code/codeList";
	}
	
	@RequestMapping(value="/codeDelete.do")
	public String deleteCode(int code) throws Exception {
		
		int result = codeService.deleteCodes(code);
		
		if (result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		
		return "redirect:codeList.do";
	}
	
	@RequestMapping(value="/codeModifyWrite.do")
	public String selectCodesDetail(int code, ModelMap model) throws Exception {
		
		CodeVO vo = codeService.selectCodesDetail(code);
		model.addAttribute("vo", vo);
		
		return "code/codeModifyWrite";
	}
	
	@RequestMapping(value="/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception {
		
		int result = codeService.updateCodes(vo);
		
		if (result == 1) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
		
		return "redirect:codeList.do";
	}
	
}
