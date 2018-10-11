package com.travel.plan.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.member.model.TravelMember;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

@Repository
public class MyPageDaoImple implements MyPageDao {

	String ns = "MyPage.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<String> showlist(String id) {
		return sqlSession.selectList(ns+"showlist",id);
	}

	@Override
	public List<Integer> inmytrip(String id) {
		return sqlSession.selectList(ns+"inmytrip",id);
	}

	@Override
	public String inmytripname(int tseq) {
		return sqlSession.selectOne(ns+"inmytripname",tseq);
	}

	@Override
	public List<Integer> getTseqFromId(TripGroup tg) {
		return sqlSession.selectList(ns+"getTseqFromId",tg);
	}

	@Override
	public void changeGroupIn(Trip trip) {
		sqlSession.update(ns+"changeGroupIn", trip);
	}

	@Override
	public String getPersonId(int seq) {
		return sqlSession.selectOne(ns+"getPersonId",seq);
	}

	@Override
	public int getTgseqFromTg(TripGroup tg) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getTgseqFromTg",tg);
	}

	@Override
	public void changeMyInfo(TravelMember member) {
		sqlSession.update(ns+"changeMyInfo", member);
	}

	@Override
	public int checkMypagePwd(TravelMember member) {
		return sqlSession.selectOne(ns+"checkMypagePwd",member);
	}

	@Override
	public void deleteMemberById(String id) {
		sqlSession.delete(ns+"deleteMemberById",id);
	}

	@Override
	public void deleteTripById(String id) {
		sqlSession.delete(ns+"deleteTripById",id);
	}

	@Override
	public void deleteTripGroupById(String id) {
		sqlSession.delete(ns+"deleteTripGroupById",id);
	}

	@Override
	public void deleteTripBoardReplyById(String id) {
		sqlSession.delete(ns+"deleteTripBoardReplyById",id);
	}

	@Override
	public void deleteTripBoardById(String id) {
		sqlSession.delete(ns+"deleteTripBoardById",id);
	}



}
