package com.travel.plan.shareboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.shareboard.model.ShareBoard;

@Repository
public class ShareBoardDaoImpl implements ShareBoardDao {

	String ns = "ShareBoard.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertShareBoard(ShareBoard shareboard) {
		sqlSession.insert(ns+"insertShareBoard", shareboard);
	}

	@Override
	public List<ShareBoard> getShareBoardList() {
		return sqlSession.selectList(ns+"getShareBoardList");
	}

	@Override
	public int checkshare(int tseq) {
		return sqlSession.selectOne(ns+"checkshare", tseq);
	}

	@Override
	public void updatetotallike(int tseq) {
		sqlSession.update(ns+"updatetotallike", tseq);
	}

	@Override
	public void deleteshareboard(int sbseq) {
		sqlSession.delete(ns+"deleteshareboard", sbseq);
	}

	@Override
	public void deleteshareboardtseq(int tseq) {
		sqlSession.delete(ns+"deleteshareboardtseq", tseq);
	}
}
