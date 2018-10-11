package com.travel.plan.tripgroup.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripGroupDao {

	// tseq, id �ʿ� -> �׷����
	void insertGroup(Trip trip);
	// ���� ���� �׷� tseq�� �������� ����
	List<TripGroup> getTseqList(String id);
	

	// �߰�
	// id�� ���� tseq���� �����´�
	List<TripGroup> getTseqId(String id);
	void delTripgroup(int tseq);
	// ���߿� �ʴ�� invite �������Ѵ�!
	void inviteGroup(Trip trip); // �ʴ� �Է��� id, tseq ���
	
	List<TripGroup> getTripGroup(int tseq);
	
	//////////
	void inviteMember(TripGroup tg);
	int commonIdCheck(TripGroup tg);
	
	
	// 170529
	void delTripgroupByTgseq(int tgseq);
	
}
