package com.mycom.toyLMS.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.toyLMS.board.vo.Article;

@Repository
public class BoardDAO {

	public ArrayList<Article> selectBoard(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoard");
	}

	public Article selectArticle(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> hs = new HashMap<String, Integer>();
		hs.put("bno", bno);
		return sqlSession.selectOne("boardMapper.selectArticle", hs);
	}
	
	 
	
}
