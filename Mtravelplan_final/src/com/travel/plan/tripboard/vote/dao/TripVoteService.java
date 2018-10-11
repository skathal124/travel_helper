package com.travel.plan.tripboard.vote.dao;

import java.util.List;

import com.travel.plan.tripboard.help.PollBean;
import com.travel.plan.tripboard.model.TripPoll;
import com.travel.plan.tripboard.model.TripPollSub;
import com.travel.plan.tripboard.model.TripVoter;


public interface TripVoteService {

	void makePoll(PollBean pbean);

	List<TripPoll> getPollAllList(TripPoll poll);

	TripPoll getPoll(TripPoll poll);

	List<TripPollSub> getPollSubList(TripPoll poll);

	void polling(TripVoter voter);
	
	List<TripPoll> getMyPollList(TripPoll poll);
	
	void deleteTrip_Voter(int tpseq);
	
	void deleteTrip_PollSub(int tpseq);
	
	void deleteTrip_Poll(int tpseq);
	

}
