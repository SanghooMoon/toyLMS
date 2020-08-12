package com.mycom.toyLMS.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.toyLMS.board.vo.Article;
import com.mycom.toyLMS.common.vo.PageInfo;

@Repository
public class BoardDAO {

	public ArrayList<Article> selectBoard(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		// 킹프링
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
											//시작해야할 글번호, 가져올 글 개수
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoard", null ,rowBounds);
	}

	public Article selectArticle(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
	
		return sqlSession.selectOne("boardMapper.selectArticle", bno);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public Object insertArticle(SqlSessionTemplate sqlSession, String content, String title, String id) {
		// TODO Auto-generated method stub
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("id", id);
		hs.put("content", content);
		hs.put("title", title);
		return sqlSession.insert("boardMapper.insertArticle", hs);
	}
	
	 
	
}
