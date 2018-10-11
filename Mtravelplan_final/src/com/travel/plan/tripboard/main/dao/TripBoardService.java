package com.travel.plan.tripboard.main.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripBoardService {

	List<Integer> getMyGroup(String id);
	String getMyGroupName(TripGroup tg);
	int getTseqFromTG(int tgseq);
}

