package com.travel.plan.tripboard.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;

@Repository
public class BoardDaoImpl implements BoardDao {

	String ns = "TripBoard.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void writeBoard(TripBoard tboard) {
		sqlSession.insert(ns+"writeBoard", tboard);
	}

	@Override
	public List<TripBoard> getBoardList(int tseq) {
		return sqlSession.selectList(ns+"getBoardList",tseq);
	}

	@Override
	public TripBoard getBoard(int tbseq) {
		return sqlSession.selectOne(ns+"getBoard", tbseq);
	}

	@Override
	public void writeBoardReply(TripBoardReply tbbreply) {
		sqlSession.insert(ns+"writeBoardReply", tbbreply);
	}

	@Override
	public List<TripBoardReply> getBoardReplyList(int tbseq) {
		return sqlSession.selectList(ns+"getBoardReplyList",tbseq);
	}

	@Override
	public void updateReplyCount(int tbseq) {
		sqlSession.update(ns+"updateReplyCount",tbseq);
	}

	@Override
	public void boardReadCount(int tbseq) {
		sqlSession.update(ns+"boardReadCount",tbseq);
	}

	@Override
	public void deleteBoard(int tbseq) {
		sqlSession.delete(ns+"deleteBoard",tbseq);
	}

	@Override
	public void deleteBoardReply(int tbseq) {
		sqlSession.delete(ns+"deleteBoardReply",tbseq);
	}

	@Override
	public void updateBoard(TripBoard tboard) {
		sqlSession.update(ns+"updateBoard",tboard);
	}

}
