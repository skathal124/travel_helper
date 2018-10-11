package com.travel.plan.mypage.dao;

import java.util.List;

import com.travel.plan.member.model.TravelMember;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

public interface MyPageService {

	List<String> showlist(String id);
	List<Integer> inmytrip(String id);
	String inmytripname(int tseq);
	List<Integer> getTseqFromId(TripGroup tg);
	void changeGroupIn(Trip trip);
	String getPersonId(int seq);
	int getTgseqFromTg(TripGroup tg);
	void changeMyInfo(TravelMember member);
	int checkMypagePwd(TravelMember member);
	
	void deleteMemberById(String id);
	void deleteTripById(String id);
	void deleteTripGroupById(String id);
	void deleteTripBoardReplyById(String id);
	void deleteTripBoardById(String id);
}
