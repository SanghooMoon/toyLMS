package com.mycom.toyLMS.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.toyLMS.board.service.BoardService;
import com.mycom.toyLMS.board.vo.Article;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@RequestMapping("list")
	public String board(Model model) {
		
		ArrayList<Article> list = bService.showBoard();
		model.addAttribute("list", list);
		return "board";
	}

	@RequestMapping("view/*")
	public String detailArticle(HttpServletRequest request) {
		
		// 더 좋은 방법 없나? 근오형한테 물어보자
		String[] arr = request.getRequestURI().split("/");
		int bno = Integer.parseInt(arr[arr.length-1]);
		
//		System.out.println(arr[arr.length-1]);
		Article article = bService.showDetail(bno);
		request.setAttribute("article", article);
		return "detail";
	}
	
}
