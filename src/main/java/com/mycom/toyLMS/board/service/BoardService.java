package com.mycom.toyLMS.board.service;

import java.util.ArrayList;

import com.mycom.toyLMS.board.vo.Article;

public interface BoardService {

	ArrayList<Article> showBoard();

	Article showDetail(int bno);

}
