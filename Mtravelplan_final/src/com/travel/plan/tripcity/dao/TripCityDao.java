package com.travel.plan.tripcity.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripCityDao {

	void insertCity(TripCity TripCity);
	
	// 해당되는 여행 TripCity 리스트 가져오기 (달력 그릴 때 사용)
	List<TripCity> getCityList(int tseq);
	
	// tcseq에 해당하는 tripcity 가져오기 (수정하기에 사용)
	TripCity getTripCity(int tcseq);
	
	// update 하는 쿼리
	void updateTripCity(TripCity TripCity);
	
	// tcseq를 받아서 delete 하는 쿼리
	void deleteTripCity(int tcseq);
	
	// tseq을 받아서 도시 전체를 날리는 쿼리
	void deleteCityList(int tseq);
	
	
}
