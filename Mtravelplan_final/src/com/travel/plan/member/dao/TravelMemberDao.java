package com.travel.plan.member.dao;

import com.travel.plan.member.model.TravelMember;

public interface TravelMemberDao {
	int idorpass(TravelMember member);
	void addMember(TravelMember member) ;
	TravelMember checkMember(TravelMember member);
	int getID(TravelMember member);
	int getNickname(TravelMember member);
	TravelMember getMember(String id);
}
