package com.travel.plan.tripgroup.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

@Service
public class TripGroupServiceImpl implements TripGroupService {

	@Autowired
	private TripGroupDao tripGroupDao;
	
	@Override
	public void insertGroup(Trip trip) {
		tripGroupDao.insertGroup(trip);
	}

	@Override
	public List<TripGroup> getTseqList(String id) {
		return tripGroupDao.getTseqList(id);
	}

	@Override
	public void inviteGroup(Trip trip) {
		tripGroupDao.inviteGroup(trip);
	}

	@Override
	public List<TripGroup> getTseqId(String id) {
		return tripGroupDao.getTseqId(id);
	}

	@Override
	public void delTripgroup(int tseq) {
		tripGroupDao.delTripgroup(tseq);
	}

	@Override
	public List<TripGroup> getTripGroup(int tseq) {
		return tripGroupDao.getTripGroup(tseq);
	}
	@Override
	public void inviteMember(TripGroup tg) {
		tripGroupDao.inviteMember(tg);
	}

	@Override
	public int commonIdCheck(TripGroup tg) {
		return tripGroupDao.commonIdCheck(tg);
	}

	
	
	@Override
	public void delTripgroupByTgseq(int tgseq) {
		tripGroupDao.delTripgroupByTgseq(tgseq);
	}
}
