package com.mycom.toyLMS.board.controller;

import java.util.ArrayList;

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
	
	
//	@RequestMapping("view/*")
//	public String detailArticle(HttpServletRequest request) {
//		
//		// 더 좋은 방법 없나? 근오형한테 물어보자, @pathValidate ? @requestBody
//		String[] arr = request.getRequestURI().split("/");
//		int bno = Integer.parseInt(arr[arr.length-1]);
//		
////		System.out.println(arr[arr.length-1]);
//		Article article = bService.showDetail(bno);
//		request.setAttribute("article", article);
//		return "detail";
//	}
	
	
	@RequestMapping("view/{articleNo}")
	public String test(@PathVariable String articleNo, Model model) {
		System.out.println(articleNo);
		
		int bno = Integer.parseInt(articleNo);
		Article article = bService.showDetail(bno);
		model.addAttribute("article", article);
		return "detail";
	}
	
	
}
