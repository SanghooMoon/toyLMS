package com.mycom.toyLMS;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.toyLMS.board.service.BoardService;
import com.mycom.toyLMS.board.vo.Article;


@Controller
public class HomeController {
	
	@Autowired
	BoardService bService;
	
	
	// 메인화면으로 이동
	@RequestMapping(value = "/")
	public String index(Model model) {

		ArrayList<Article> list = bService.showTopHit();
		model.addAttribute("list", list);
		return "index";
	}
	
	
}
