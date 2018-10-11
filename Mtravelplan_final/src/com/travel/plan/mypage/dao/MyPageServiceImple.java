package com.travel.plan.mypage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.plan.member.model.TravelMember;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

@Service
public class MyPageServiceImple implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	

	@Override
	public List<String> showlist(String id) {
		return myPageDao.showlist(id);
	}


	@Override
	public List<Integer> inmytrip(String id) {
		return myPageDao.inmytrip(id);
	}


	@Override
	public String inmytripname(int tseq) {
		return myPageDao.inmytripname(tseq);
	}


	@Override
	public List<Integer> getTseqFromId(TripGroup tg) {
		return myPageDao.getTseqFromId(tg);
	}


	@Override
	public void changeGroupIn(Trip trip) {
		myPageDao.changeGroupIn(trip);
	}


	@Override
	public String getPersonId(int seq) {
		return myPageDao.getPersonId(seq);
	}


	@Override
	public int getTgseqFromTg(TripGroup tg) {
		return myPageDao.getTgseqFromTg(tg);
	}


	@Override
	public void changeMyInfo(TravelMember member) {
		myPageDao.changeMyInfo(member);
	}


	@Override
	public int checkMypagePwd(TravelMember member) {
		return myPageDao.checkMypagePwd(member);
	}


	@Override
	public void deleteMemberById(String id) {
		myPageDao.deleteMemberById(id);
	}


	@Override
	public void deleteTripById(String id) {
		myPageDao.deleteTripById(id);
	}


	@Override
	public void deleteTripGroupById(String id) {
		myPageDao.deleteTripGroupById(id);
	}


	@Override
	public void deleteTripBoardReplyById(String id) {
		myPageDao.deleteTripBoardReplyById(id);
	}


	@Override
	public void deleteTripBoardById(String id) {
		myPageDao.deleteTripBoardById(id);
	}


}
