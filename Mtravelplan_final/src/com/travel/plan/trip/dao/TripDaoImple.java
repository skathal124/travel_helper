package com.travel.plan.trip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripgroup.model.TripGroup;

@Repository
public class TripDaoImple implements TripDao {
	
	String ns = "Trip.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeTrip(Trip trip) {
		sqlSession.insert(ns+"writeTrip",trip);
	}

	@Override
	public List<Trip> getTripList() {
		return sqlSession.selectList(ns+"getTripList");
	}

	@Override
	public Trip getTrip(int tseq) {
		return sqlSession.selectOne(ns+"getTrip",tseq);
	}

	@Override
	public void updateTrip(Trip trip) {
		sqlSession.update(ns+"updateTrip",trip);
	}

	@Override
	public void delTrip(int tseq) {
		sqlSession.delete(ns+"delTrip",tseq);
	}

	@Override
	@Transactional (readOnly=true)
	public int getRecentTseq(Trip trip) {
		return sqlSession.selectOne(ns+"getRecentTseq", trip);
	}

	@Override
	public int getTripId(String id) {
		return sqlSession.selectOne(ns+"getTripId", id);
	}

	@Override
	public int getTripTotalCount(TripParam param) {
		return sqlSession.selectOne(ns+"getTripTotalCount",param);
	}

	@Override
	public List<Trip> getTripPageList(TripParam param) {
		return sqlSession.selectList(ns+"getTripPageList",param);
	}

	@Override
	public void InsertTripPaging(Trip trip) {
		sqlSession.insert(ns+"InsertTripPaging",trip);
	}

	@Override
	public void delTripPaging(Trip trip) {
		sqlSession.delete(ns+"delTripPaging",trip);
	}

}
