package com.travel.plan.triplike.dao;

import com.travel.plan.trip.model.Trip;

public interface TripLikeService {
	
	// tseq, id�� ���� lseq�� �ֳ�?
	int getlike(Trip trip);
	
	// tseq, id�� ���� trip ����
	void insertlikeOne(Trip trip);
	
	// tseq�� like �� �� -> ShareBoard ������Ʈ �ؾ��Ѵ�
	int getSelectLike(int tseq);

	// ���ƿ� ���
	void deletelikeOne(Trip trip);
	
	void deletelikeOneTseq(int tseq);
	
}
