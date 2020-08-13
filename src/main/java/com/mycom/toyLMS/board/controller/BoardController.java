package com.mycom.toyLMS.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.toyLMS.board.service.BoardService;
import com.mycom.toyLMS.board.vo.Article;
import com.mycom.toyLMS.common.Pagenation;
import com.mycom.toyLMS.common.vo.PageInfo;
import com.mycom.toyLMS.member.dto.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	// 전체 글
	@RequestMapping("list")
	public String board(Model model, @RequestParam(value="page", required = false) Integer page) {
		System.out.println("board()");
		
		int currentPage = 1;
		
		if(page!=null) {
			currentPage = page;
		}
		// 페이징 시작
		// 글의 총 개수 가져오기(12)
		int listCount = bService.listCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Article> list = bService.showBoard(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println(pi);
		System.out.println(list);
		
		return "board";
	}
	
	// 상세 글 보기
	@RequestMapping("view/{articleNo}")
	public String detail(@PathVariable String articleNo, Model model) {
		System.out.println(articleNo);
		
		int bno = Integer.parseInt(articleNo);
		Article article = bService.showDetail(bno);
		model.addAttribute("article", article);
		return "detail";
	}
	
	@RequestMapping("write")
	public String writeGet(HttpSession session) {
		
		// 미로그인상태시 로그인화면으로 이동
		if(session.getAttribute("loginUserInfo") == null) {
			return "redirect:/member/login";
		}
		
		return "write";
	}
	
	@RequestMapping("dowrite")
	public String writePost(@RequestParam("content") String content, @RequestParam("title") String title, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUserInfo");
		String id = member.getId();
//		System.out.println("글 작성 제목 : " + title);
//		System.out.println("글 작성 내용 : " + content);
//		System.out.println("글 작성자 : " + id);
		
		bService.writeArticle(content, title, id);
		
		return "redirect:/board/list";
	}
	
	// 선택한 글의 내용을 가지고 수정하기 페이지로 이동
	@RequestMapping("modify/{articleNo}")
	public String modifyForm(@PathVariable String articleNo, Model model) {
		System.out.println("수정화면");

		int bno = Integer.parseInt(articleNo);
		Article article = bService.showDetail(bno);
		model.addAttribute("article", article);

		return "modify";
	}
	
	@RequestMapping("modify")
	public String modify(HttpServletRequest request) {
		System.out.println("수정시작");
		
//		System.out.println(request.getParameter("bno"));
//		System.out.println(request.getParameter("title"));
//		System.out.println(request.getParameter("content"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Article article = new Article();
		article.setBno(bno);
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		
		bService.modifyArticle(article);
		
		return "redirect:/board/list";
	}
	
	
}
