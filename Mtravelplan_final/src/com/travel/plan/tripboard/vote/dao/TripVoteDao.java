package com.travel.plan.tripboard.vote.dao;

import java.util.List;

import com.travel.plan.tripboard.model.TripPoll;
import com.travel.plan.tripboard.model.TripPollSub;
import com.travel.plan.tripboard.model.TripVoter;





public interface TripVoteDao {

	void makePoll(TripPoll poll);

	void makePollSub(TripPollSub pollsub);

	List<TripPoll> getPollAllList(TripPoll poll);

	int isVote(TripVoter hkVoter);

	TripPoll getPoll(TripPoll poll);

	List<TripPollSub> getPollSubList(TripPoll poll);
	
	void pollingVote(TripVoter voter);

	void pollingSub(TripVoter voter);

	void pollingPoll(TripVoter voter);
	
	List<TripPoll> getMyPollList(TripPoll poll);
	
	void deleteTrip_Voter(int tpseq);
	
	void deleteTrip_PollSub(int tpseq);
	
	void deleteTrip_Poll(int tpseq);

}
