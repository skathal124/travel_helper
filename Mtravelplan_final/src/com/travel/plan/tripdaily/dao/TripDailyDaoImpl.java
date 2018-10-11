package com.travel.plan.tripdaily.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.tripdaily.model.TripDaily;

@Repository
public class TripDailyDaoImpl implements TripDailyDao {

	String ns = "TripDaily.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertTripDaily(TripDaily tripdaily) {
		sqlSession.insert(ns+"insertTripDaily", tripdaily);
	}

	@Override
	public void deleteTripDaily(TripDaily tripdaily) {
		sqlSession.delete(ns+"deleteTripDaily", tripdaily);
	}

	@Override
	public List<TripDaily> getTripDailyList(TripDaily tripdaily) {
		return sqlSession.selectList(ns+"getTripDailyList", tripdaily);
	}

	@Override
	public void deleteDailyList(int tseq) {
		sqlSession.delete(ns+"deleteDailyList", tseq);
	}

	@Override
	public List<TripDaily> getCityInfo(int tcseq) {
		return sqlSession.selectList(ns+"getCityInfo", tcseq);
	}

	@Override
	public void deleteTripDailyList(int tcseq) {
		sqlSession.delete(ns+"deleteTripDailyList", tcseq);
	}

}
