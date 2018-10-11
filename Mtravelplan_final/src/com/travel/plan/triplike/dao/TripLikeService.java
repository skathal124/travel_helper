package com.travel.plan.triplike.dao;

import com.travel.plan.trip.model.Trip;

public interface TripLikeService {
	
	// tseq, id를 가진 lseq가 있나?
	int getlike(Trip trip);
	
	// tseq, id를 가진 trip 형태
	void insertlikeOne(Trip trip);
	
	// tseq의 like 총 수 -> ShareBoard 업데이트 해야한다
	int getSelectLike(int tseq);

	// 좋아요 취소
	void deletelikeOne(Trip trip);
	
	void deletelikeOneTseq(int tseq);
	
}
