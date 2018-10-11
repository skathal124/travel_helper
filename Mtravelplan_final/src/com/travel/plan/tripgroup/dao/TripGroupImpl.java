package com.travel.plan.tripgroup.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

@Repository
public class TripGroupImpl implements TripGroupDao {

	String ns = "TripGroup.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertGroup(Trip trip) {
		sqlSession.insert(ns+"insertGroup", trip);
	}

	@Override
	public List<TripGroup> getTseqList(String id) {
		return sqlSession.selectList(ns+"getTseqList", id);
	}

	
	@Override
	public void inviteGroup(Trip trip) {
		sqlSession.insert(ns+"insertGroup", trip);
	}

	@Override
	public List<TripGroup> getTseqId(String id) {
		return sqlSession.selectList(ns+"getTseqId", id);
	}

	@Override
	public void delTripgroup(int tseq) {
		sqlSession.delete(ns+"delTripgroup", tseq);
	}

	@Override
	@Transactional (readOnly = true)
	public List<TripGroup> getTripGroup(int tseq) {
		return sqlSession.selectList(ns+"getTripGroup", tseq);
	}

	@Override
	public void inviteMember(TripGroup tg) {
		sqlSession.insert(ns+"inviteMember",tg);
	}

	@Override
	public int commonIdCheck(TripGroup tg) {
		return sqlSession.selectOne(ns+"commonIdCheck",tg);
	}
	
	
	@Override
	public void delTripgroupByTgseq(int tgseq) {
		sqlSession.delete(ns+"delTripgroupByTgseq", tgseq);
	}

}
