package com.mycom.toyLMS.common;

import com.mycom.toyLMS.common.vo.PageInfo;

// 페이징 계산 클래스
public class Pagenation {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 10;
		
		// 계산식,,
															// 11/10 = 1.1, 2.0 > 2
															// 10/10 = 1, 	1.9 > 1
		maxPage = (int)((double)listCount/boardLimit+0.9);	//	9/10 = 0.9, 1.8 > 1
		
		startPage = ((int)((double)currentPage/pageLimit+0.9)-1)*pageLimit+1;		//	1/10+0.9-1  * 10 + 1
																					// 25/10 3-1 		21
																					// 56/10 6-1 5		51?
		endPage = startPage + pageLimit -1;		// 51 + 10 - 1, 61 - 1 = 60
												// 11 + 10 - 1, 21 - 1 = 20
		
		//	10 > 5
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
	
}
/*
 * private int currentPage;		// 현재 페이지
	private int listCount;		// 게시글 총 개수
	private int pageLimit;		// 한 페이지에 보여줄 제한된 개수
	private int maxPage;		// 끝 페이지 번호, listCount/pageLimit = maxPage, 100/10 = 10
	private int startPage;		// 1~10 || 1~5, 11~20 || 6~10 	페이징의 첫번째 페이지
	private int endPage;		// 페이징의 마지막 페이지
	private int boardLimit;		// 페이징 갯수(10, 5)
 * 
 */


