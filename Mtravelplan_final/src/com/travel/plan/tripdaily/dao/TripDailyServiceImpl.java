package com.travel.plan.tripdaily.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.tripcity.dao.TripCityDao;
import com.travel.plan.tripdaily.model.TripDaily;

@Service
public class TripDailyServiceImpl implements TripDailyService {

	@Autowired
	private TripDailyDao tripDailyDao;
	
	@Override
	@Transactional
	public void insertTripDaily(TripDaily tripdaily) {
		tripDailyDao.insertTripDaily(tripdaily);
	}

	@Override
	@Transactional
	public void deleteTripDaily(TripDaily tripdaily) {
		tripDailyDao.deleteTripDaily(tripdaily);
	}

	@Override
	@Transactional (readOnly=true)
	public List<TripDaily> getTripDailyList(TripDaily tripdaily) {
		return tripDailyDao.getTripDailyList(tripdaily);
	}

	@Override
	@Transactional
	public void deleteDailyList(int tseq) {
		tripDailyDao.deleteDailyList(tseq);
	}

	@Override
	@Transactional (readOnly=true)
	public List<TripDaily> getCityInfo(int tcseq) {
		return tripDailyDao.getCityInfo(tcseq);
	}

	@Override
	@Transactional
	public void deleteTripDailyList(int tcseq) {
		tripDailyDao.deleteTripDailyList(tcseq);
	}

}
