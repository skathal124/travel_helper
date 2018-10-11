package com.travel.plan.tripcity.dao;

import java.util.List;

import com.travel.plan.tripcity.model.TripCity;

public interface TripCityService {

		void insertCity(TripCity TripCity);   // ���߿�
		
		// �ش�Ǵ� ���� TripCity ����Ʈ �������� (�޷� �׸� �� ���)
		List<TripCity> getCityList(int tseq);
		
		TripCity getTripCity(int tcseq);
		
		void updateTripCity(TripCity TripCity);
		
		void deleteTripCity(int tcseq);
		
		void deleteCityList(int tseq);
}

