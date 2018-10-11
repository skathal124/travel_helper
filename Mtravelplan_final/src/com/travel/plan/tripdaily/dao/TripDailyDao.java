package com.travel.plan.tripdaily.dao;

import java.util.List;

import com.travel.plan.tripdaily.model.TripDaily;

public interface TripDailyDao {
	
	// 하루 데이터 저장
	void insertTripDaily(TripDaily tripdaily);
	
	//tddate, TSEQ, TCSEQ 값 세개로 delete하는 메소드
	void deleteTripDaily(TripDaily tripdaily);
	
	// tddate, TSEQ, TCSEQ 값을 가지고 있는 TripDaily를 가져오는 메소드
	List<TripDaily> getTripDailyList(TripDaily tripdaily);

	void deleteDailyList(int tseq);
	
	// TCSEQ으로 TripDaily (한눈에 보기)
	List<TripDaily> getCityInfo(int tcseq);
	
	// tcseq 갖고 있는 tripdaily전부 삭제
	void deleteTripDailyList(int tcseq);
	
}
