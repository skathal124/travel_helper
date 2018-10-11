package com.travel.plan.trip.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripService {

	void writeTrip(Trip trip);
	List<Trip> getTripList ();
	Trip getTrip(int tseq);
	void updateTrip(Trip trip);
	void delTrip(int tseq);
	
	int getRecentTseq(Trip trip);
	int getTripId(String id);
	
	int getTripTotalCount(TripParam param);
	List<Trip> getTripPageList(TripParam param);
	void InsertTripPaging(Trip trip);
	void delTripPaging(Trip trip);
}
