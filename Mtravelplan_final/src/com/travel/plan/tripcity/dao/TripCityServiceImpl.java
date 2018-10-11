package com.travel.plan.tripcity.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

@Service
public class TripCityServiceImpl implements TripCityService {

	@Autowired
	private TripCityDao tripCityDao;

	@Override
	public void insertCity(TripCity TripCity) {
		tripCityDao.insertCity(TripCity);
	}

	@Override
	public List<TripCity> getCityList(int tseq) {
		return tripCityDao.getCityList(tseq);
	}

	@Override
	public TripCity getTripCity(int tcseq) {
		return tripCityDao.getTripCity(tcseq);
	}

	@Override
	public void updateTripCity(TripCity TripCity) {
		tripCityDao.updateTripCity(TripCity);
	}

	@Override
	public void deleteTripCity(int tcseq) {
		tripCityDao.deleteTripCity(tcseq);
	}

	@Override
	public void deleteCityList(int tseq) {
		tripCityDao.deleteCityList(tseq);
	}
	

}
