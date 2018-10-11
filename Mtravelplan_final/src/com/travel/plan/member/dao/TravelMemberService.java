package com.travel.plan.member.dao;

import com.travel.plan.member.model.TravelMember;

public interface TravelMemberService {
	void addMember(TravelMember member) ;
	int idorpass(TravelMember member);
	TravelMember checkMember(TravelMember member);
	int getID(TravelMember member);
	int getNickname(TravelMember member);
	TravelMember getMember(String id);
}
