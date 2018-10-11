package com.travel.plan.tripcity.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripCityDao {

	void insertCity(TripCity TripCity);
	
	// �ش�Ǵ� ���� TripCity ����Ʈ �������� (�޷� �׸� �� ���)
	List<TripCity> getCityList(int tseq);
	
	// tcseq�� �ش��ϴ� tripcity �������� (�����ϱ⿡ ���)
	TripCity getTripCity(int tcseq);
	
	// update �ϴ� ����
	void updateTripCity(TripCity TripCity);
	
	// tcseq�� �޾Ƽ� delete �ϴ� ����
	void deleteTripCity(int tcseq);
	
	// tseq�� �޾Ƽ� ���� ��ü�� ������ ����
	void deleteCityList(int tseq);
	
	
}
