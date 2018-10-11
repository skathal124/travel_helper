package com.travel.plan.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.travel.plan.member.model.TravelMember;

@Repository
public class TravelMemberDaoImple implements TravelMemberDao {
	String ns = "TravelMember.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addMember(TravelMember member) {
		sqlSession.insert(ns+"addMember",member);
	}

	@Override
	public TravelMember checkMember(TravelMember member) {
		return (TravelMember)sqlSession.selectOne(ns+"checkMember",member);
	}

	@Override
	public int getID(TravelMember member) {
		return (int)sqlSession.selectOne(ns+"getID",member);
	}

	@Override
	public int getNickname(TravelMember member) {
		return (int)sqlSession.selectOne(ns+"getNickname",member);

	}

	@Override
	public int idorpass(TravelMember member) {
		return (int)sqlSession.selectOne(ns+"idorpass",member);
		
	}

	@Override
	public TravelMember getMember(String id) {
		return (TravelMember)sqlSession.selectOne(ns+"getMember",id);
	}
}
