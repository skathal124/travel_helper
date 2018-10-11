package com.travel.plan.tripboard.vote.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.tripboard.help.PollBean;
import com.travel.plan.tripboard.model.TripPoll;
import com.travel.plan.tripboard.model.TripPollSub;
import com.travel.plan.tripboard.model.TripVoter;

@Service
public class TripVoteServiceImpl implements TripVoteService {
	
	@Autowired
	private TripVoteDao TripPollDao;
	
	@Override
	@Transactional
	public void makePoll(PollBean pbean) {
		TripPoll poll=new TripPoll(
				pbean.getTseq(),
				pbean.getId(),
				pbean.getQuestion(),
				pbean.getSdate(),
				pbean.getEdate(),
				pbean.getItemcount(),0
				);
		int itemcount=pbean.getItemcount();
		String[] answer=pbean.getPollnum();
		
		TripPollDao.makePoll(poll);
		for (int i = 0; i < itemcount; i++) {
			TripPollSub pollsub=new TripPollSub();
			pollsub.setAnswer(answer[i]);
			TripPollDao.makePollSub(pollsub);
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<TripPoll> getPollAllList(TripPoll poll) {
		List<TripPoll> plists=TripPollDao.getPollAllList(poll);
		List<TripPoll> plists2=new ArrayList<TripPoll>();
		for (TripPoll poll1:plists) {
			String id=poll.getId();
			int pollid=poll1.getTpseq();
			int count=TripPollDao.isVote(new TripVoter(pollid,-1,id));
			//System.out.println("-------------------------------------::::"+count);
			if(count>0){
				poll1.setVote(true);//투표했다.
			}else{
				poll1.setVote(false);//
			}
			plists2.add(poll1);
			
		}
		return plists2;
	}

	@Override
	@Transactional(readOnly=true)
	public TripPoll getPoll(TripPoll poll) {
		return TripPollDao.getPoll( poll);
	}

	@Override
	@Transactional(readOnly=true)
	public List<TripPollSub> getPollSubList(TripPoll poll) {
		return TripPollDao.getPollSubList( poll);
	}

	@Override
	@Transactional
	public void polling(TripVoter voter) {
		TripPollDao.pollingVote(voter);
		TripPollDao.pollingSub(voter);
		TripPollDao.pollingPoll(voter);
	}

	@Override
	public List<TripPoll> getMyPollList(TripPoll poll) {
		return TripPollDao.getMyPollList(poll);
	}

	@Override
	public void deleteTrip_Voter(int tpseq) {
		TripPollDao.deleteTrip_Voter(tpseq);
	}

	@Override
	public void deleteTrip_PollSub(int tpseq) {
		TripPollDao.deleteTrip_PollSub(tpseq);
	}

	@Override
	public void deleteTrip_Poll(int tpseq) {
		TripPollDao.deleteTrip_Poll(tpseq);
	}
}
