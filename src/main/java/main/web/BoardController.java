package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		
		System.out.println(vo.getTitle());
		
		String result = boardService.insertNBoard(vo);
		String msg = "";
		
		if (result == null) {
			msg = "ok";
		} else {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		int pageSize = 10; //한 페이지당 개수
		
		int total = boardService.selectNBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/pageSize);
		int viewPage = vo.getViewPage();
		
		if (viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		
		int startIndex = (viewPage-1) * pageSize;
		
		vo.setStartIndex(startIndex);
		vo.setPageSize(pageSize);
		
		int startRowNo = total - (viewPage - 1) * pageSize;
		
		List<?> list = boardService.selectNBoardList(vo);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("resultList", list);
		model.addAttribute("rowNumber", startRowNo);
		
		System.out.println("list : " + list);
		
		return "board/boardList";
	}
}
