package com.travel.plan.member.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.member.model.TravelMember;

@Service
public class TravelMemberServiceImple implements TravelMemberService {
	
	@Autowired 
	private TravelMemberDao travelMemberDao;
	
	@Override
	public void addMember(TravelMember member) {
		travelMemberDao.addMember(member);
	}

	@Override
	@Transactional(readOnly=true)
	public TravelMember checkMember(TravelMember member) {
		return travelMemberDao.checkMember(member);
	}

	@Override
	@Transactional(readOnly=true)
	public int getID(TravelMember member) {
		return travelMemberDao.getID(member);
	}

	@Override
	@Transactional(readOnly=true)
	public int getNickname(TravelMember member) {
		return travelMemberDao.getNickname(member);
	}

	@Override
	public int idorpass(TravelMember member) {
		return travelMemberDao.idorpass(member);
		
	}
	
	@Override
	public TravelMember getMember(String id) {
		return travelMemberDao.getMember(id);
	}

}
