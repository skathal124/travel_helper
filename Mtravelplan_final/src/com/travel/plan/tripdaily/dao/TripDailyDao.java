package com.travel.plan.tripdaily.dao;

import java.util.List;

import com.travel.plan.tripdaily.model.TripDaily;

public interface TripDailyDao {
	
	// �Ϸ� ������ ����
	void insertTripDaily(TripDaily tripdaily);
	
	//tddate, TSEQ, TCSEQ �� ������ delete�ϴ� �޼ҵ�
	void deleteTripDaily(TripDaily tripdaily);
	
	// tddate, TSEQ, TCSEQ ���� ������ �ִ� TripDaily�� �������� �޼ҵ�
	List<TripDaily> getTripDailyList(TripDaily tripdaily);

	void deleteDailyList(int tseq);
	
	// TCSEQ���� TripDaily (�Ѵ��� ����)
	List<TripDaily> getCityInfo(int tcseq);
	
	// tcseq ���� �ִ� tripdaily���� ����
	void deleteTripDailyList(int tcseq);
	
}
