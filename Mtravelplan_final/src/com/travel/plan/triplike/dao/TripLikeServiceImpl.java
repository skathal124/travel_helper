package com.travel.plan.triplike.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.plan.trip.model.Trip;

@Service
public class TripLikeServiceImpl implements TripLikeService {

	@Autowired
	private TripLikeDao tripLikeDao;
	
	@Override
	public void insertlikeOne(Trip trip) {
		tripLikeDao.insertlikeOne(trip);
	}

	@Override
	public int getSelectLike(int tseq) {
		return tripLikeDao.getSelectLike(tseq);
	}

	@Override
	public void deletelikeOne(Trip trip) {
		tripLikeDao.deletelikeOne(trip);
	}

	@Override
	public int getlike(Trip trip) {
		return tripLikeDao.getlike(trip);
	}

	@Override
	public void deletelikeOneTseq(int tseq) {
		tripLikeDao.deletelikeOneTseq(tseq);
	}

}
