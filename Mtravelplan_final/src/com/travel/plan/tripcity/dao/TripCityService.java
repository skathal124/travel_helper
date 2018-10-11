package com.travel.plan.tripcity.dao;

import java.util.List;

import com.travel.plan.tripcity.model.TripCity;

public interface TripCityService {

		void insertCity(TripCity TripCity);   // 나중에
		
		// 해당되는 여행 TripCity 리스트 가져오기 (달력 그릴 때 사용)
		List<TripCity> getCityList(int tseq);
		
		TripCity getTripCity(int tcseq);
		
		void updateTripCity(TripCity TripCity);
		
		void deleteTripCity(int tcseq);
		
		void deleteCityList(int tseq);
}

