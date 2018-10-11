package com.travel.plan.tripboard.vote.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.tripboard.model.TripPoll;
import com.travel.plan.tripboard.model.TripPollSub;
import com.travel.plan.tripboard.model.TripVoter;




@Repository
public class TripVoteDaoImpl implements TripVoteDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns="TripVote.";
	
	@Override
	public void makePoll(TripPoll poll) {
		sqlSession.insert(ns+"makePoll",poll);
	}

	@Override
	public void makePollSub(TripPollSub pollsub) {
		sqlSession.insert(ns+"makePollSub",pollsub);
	}

	@Override
	public List<TripPoll> getPollAllList(TripPoll poll) {
		List<TripPoll> list=new ArrayList<TripPoll>();
		return list=sqlSession.selectList(ns+"getPollAllList",poll);
	}

	@Override
	public int isVote(TripVoter hkVoter) {
		return (Integer)sqlSession.selectOne(ns+"isVote",hkVoter);
	}

	@Override
	public TripPoll getPoll(TripPoll poll) {
		TripPoll hp=new TripPoll();
		return hp =(TripPoll)sqlSession.selectOne(ns+"getPoll",poll);
	}

	@Override
	public List<TripPollSub> getPollSubList(TripPoll poll) {
		List<TripPollSub> lists=new ArrayList<TripPollSub>();
		return lists=sqlSession.selectList(ns+"getPollSubList",poll);
	}

	@Override
	public void pollingVote(TripVoter voter) {
		sqlSession.insert(ns+"pollingVote",voter);
	}

	@Override
	public void pollingSub(TripVoter voter) {
		sqlSession.update(ns+"pollingSub",voter);
	}

	@Override
	public void pollingPoll(TripVoter voter) {
		sqlSession.update(ns+"pollingPoll",voter);
	}

	@Override
	public List<TripPoll> getMyPollList(TripPoll poll) {
		return sqlSession.selectList(ns+"getMyPollList",poll);
	}

	@Override
	public void deleteTrip_Voter(int tpseq) {
		sqlSession.delete(ns+"deleteTrip_Voter",tpseq);
	}

	@Override
	public void deleteTrip_PollSub(int tpseq) {
		sqlSession.delete(ns+"deleteTrip_PollSub",tpseq);
	}

	@Override
	public void deleteTrip_Poll(int tpseq) {
		sqlSession.delete(ns+"deleteTrip_Poll",tpseq);
	}


}
