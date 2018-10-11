package com.travel.plan.tripboard.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

@Repository
public class TripBoardDaoImpl implements TripBoardDao {

	String ns = "TripBoard.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Integer> getMyGroup(String id) {
		return sqlSession.selectList(ns+"getMyGroup",id);
	}

	@Override
	public String getMyGroupName(TripGroup tg) {
		return sqlSession.selectOne(ns+"getMyGroupName",tg);
	}

	@Override
	public int getTseqFromTG(int tgseq) {
		return sqlSession.selectOne(ns+"getTseqFromTG",tgseq);
	}

	
}
