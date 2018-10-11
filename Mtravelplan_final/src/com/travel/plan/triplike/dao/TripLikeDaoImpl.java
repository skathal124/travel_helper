package com.travel.plan.triplike.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.trip.model.Trip;

@Repository
public class TripLikeDaoImpl implements TripLikeDao {

	String ns = "TripLike.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertlikeOne(Trip trip) {
		sqlSession.insert(ns+"insertlikeOne", trip);
	}

	@Override
	public int getSelectLike(int tseq) {
		return sqlSession.selectOne(ns+"getSelectLike", tseq);
	}

	@Override
	public void deletelikeOne(Trip trip) {
		sqlSession.delete(ns+"deletelikeOne", trip);
	}

	@Override
	public int getlike(Trip trip) {
		return sqlSession.selectOne(ns+"getlike", trip);
	}

	@Override
	public void deletelikeOneTseq(int tseq) {
		sqlSession.delete(ns+"deletelikeOneTseq", tseq);
	}

}
