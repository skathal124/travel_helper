package com.travel.plan.trip.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripgroup.model.TripGroup;

@Service
public class TripServiceImple implements TripService {
	
	@Autowired
	private TripDao tripDao;

	@Override
	@Transactional
	public void writeTrip(Trip trip) {
		tripDao.writeTrip(trip);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Trip> getTripList() {
		return tripDao.getTripList();
	}

	@Override
	@Transactional(readOnly=true)
	public Trip getTrip(int tseq) {
		return tripDao.getTrip(tseq);

	}

	@Override
	@Transactional
	public void updateTrip(Trip trip) {
		tripDao.updateTrip(trip);
	}

	@Override
	@Transactional
	public void delTrip(int tseq) {
		tripDao.delTrip(tseq);
	}

	@Override
	public int getRecentTseq(Trip trip) {
		return tripDao.getRecentTseq(trip);
	}

	@Override
	public int getTripId(String id) {
		return tripDao.getTripId(id);
	}

	@Override
	public int getTripTotalCount(TripParam param) {
		return tripDao.getTripTotalCount(param);
	}

	@Override
	public List<Trip> getTripPageList(TripParam param) {
		return tripDao.getTripPageList(param);
	}

	@Override
	public void InsertTripPaging(Trip trip) {
		tripDao.InsertTripPaging(trip);
	}

	@Override
	public void delTripPaging(Trip trip) {
		tripDao.delTripPaging(trip);
	}

}
