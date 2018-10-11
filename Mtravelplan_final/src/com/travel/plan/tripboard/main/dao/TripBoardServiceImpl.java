package com.travel.plan.tripboard.main.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

@Service
public class TripBoardServiceImpl implements TripBoardService {

	@Autowired
	private TripBoardDao TripBoardDao;

	@Override
	public List<Integer> getMyGroup(String id) {
		return TripBoardDao.getMyGroup(id);
	}

	@Override
	public String getMyGroupName(TripGroup tg) {
		return TripBoardDao.getMyGroupName(tg);
	}

	@Override
	public int getTseqFromTG(int tgseq) {
		return TripBoardDao.getTseqFromTG(tgseq);
	}



}
