package com.mycom.toyLMS.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.toyLMS.board.vo.Article;
import com.mycom.toyLMS.board.vo.Reply;
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

	public void updateArticle(SqlSessionTemplate sqlSession, Article article) {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.updateArticle", article);
	}

	public void deleteArticle(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.deleteArticle", bno);
	}

	public void insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insertReply", reply);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", bno);
	}

	public void updateHit(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.updateHit", bno);
	}
	
	 
	
}
