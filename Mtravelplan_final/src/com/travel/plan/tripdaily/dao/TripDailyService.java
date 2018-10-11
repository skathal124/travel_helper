package com.travel.plan.tripdaily.dao;

import java.util.List;

import com.travel.plan.tripdaily.model.TripDaily;

public interface TripDailyService {
	
	void insertTripDaily(TripDaily tripdaily);
	
	void deleteTripDaily(TripDaily tripdaily);

	List<TripDaily> getTripDailyList(TripDaily tripdaily);
	
	void deleteDailyList(int tseq);
	
	List<TripDaily> getCityInfo(int tcseq);
	
	void deleteTripDailyList(int tcseq);
}
