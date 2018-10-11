package com.travel.plan.tripcity.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

@Repository
public class TripCityImpl implements TripCityDao {

	String ns = "TripCity.";
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void insertCity(TripCity TripCity) {
		sqlSession.insert(ns+"insertCity", TripCity);
	}
	@Override
	public List<TripCity> getCityList(int tseq) {
		return sqlSession.selectList(ns+"getCityList", tseq);
	}
	@Override
	public TripCity getTripCity(int tcseq) {
		return sqlSession.selectOne(ns+"getTripCity", tcseq);
	}
	@Override
	public void updateTripCity(TripCity TripCity) {
		sqlSession.update(ns+"updateTripCity", TripCity);
	}
	@Override
	public void deleteTripCity(int tcseq) {
		sqlSession.delete(ns+"deleteTripCity", tcseq);
	}
	@Override
	public void deleteCityList(int tseq) {
		sqlSession.delete(ns+"deleteCityList", tseq);
	}
	
	
	
}
