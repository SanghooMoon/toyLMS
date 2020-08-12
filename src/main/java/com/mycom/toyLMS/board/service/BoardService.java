package com.mycom.toyLMS.board.service;

import java.util.ArrayList;

import com.mycom.toyLMS.board.vo.Article;
import com.mycom.toyLMS.common.vo.PageInfo;

public interface BoardService {

	ArrayList<Article> showBoard(PageInfo pi);

	Article showDetail(int bno);

	int listCount();

	void writeArticle(String content, String title, String id);

}
