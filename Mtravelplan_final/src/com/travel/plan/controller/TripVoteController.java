package com.travel.plan.controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travel.plan.member.model.TravelMember;
import com.travel.plan.tripboard.help.DateUtil;
import com.travel.plan.tripboard.help.PollBean;
import com.travel.plan.tripboard.model.TripPoll;
import com.travel.plan.tripboard.model.TripVoter;
import com.travel.plan.tripboard.vote.dao.TripVoteService;




@Controller
public class TripVoteController {
	
	private static final Logger logger = 
LoggerFactory.getLogger(TripVoteController.class);
	
	@Autowired
	private TripVoteService TripPollService;
	
	private String getId(HttpServletRequest request) throws Exception{
	      HttpSession session=request.getSession();
	      Object oLogin=session.getAttribute("login");
	      if(oLogin==null){
	         throw new Exception("session이 없다.");
	      }      
	      return ((TravelMember) request.getSession().getAttribute("login")).getId();
	   }
	  @RequestMapping(value = "vote.do", method = {RequestMethod.GET,RequestMethod.POST})
	   public String vote(Model model,HttpServletRequest request,int tseq) {
	      logger.info("Welcome board!");
	      String id;
	      try{
		         id=getId(request);//위에 메서드로 만듬
		     }catch (Exception e) {
		         return "redirect:/login.do";
		     }
	      TripPoll poll = new TripPoll();
	      poll.setTseq(tseq);
	      poll.setId(id);
	      
	      List<TripPoll> pollist = TripPollService.getPollAllList(poll);
	      List<TripPoll> pollist1 = new ArrayList<>();
	      List<TripPoll> pollist2 = new ArrayList<>();
	      
	      for(TripPoll poll1:pollist){
	    	  boolean isS = poll1.isVote();
	    	  if(isS || DateUtil.isEnd(poll1.getEdate())){
	    		  pollist1.add(poll1);
	    	  }else{
	    		  pollist2.add(poll1);
	    	  }
	      }
	      
	      model.addAttribute("pollist",pollist2);
	      model.addAttribute("end_pollist",pollist1);
	      model.addAttribute("tseq",tseq);
	      logger.info("Welcome board!pollist: "+pollist2);
	      return "vote.tiles2";
	   }//
	  
	 
	   @RequestMapping(value = "voteWrite.do", method = {RequestMethod.GET,RequestMethod.POST})
	   public String voteWrite(Model model,int tseq) {
	      logger.info("Welcome voteResult!");
	      model.addAttribute("tseq",tseq);
	      return "voteWrite.tiles";
	   }//
	   
		@RequestMapping(value = "voteWriteAf.do", 
				method = {RequestMethod.GET,RequestMethod.POST})
		public String votemakeAf(PollBean pbean,Model model) {
			logger.info("Welcome PollController pollmakeAf! "+ new Date());
			int tseq = pbean.getTseq();
			TripPollService.makePoll(pbean);
			
			return "redirect:/vote.do?tseq="+tseq;
		}//
	   
	   @RequestMapping(value = "voteDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	   public String voteDetail(Model model,TripPoll poll) {
	      logger.info("Welcome voteDetail!"+poll);

			model.addAttribute("poll", 
					TripPollService.getPoll(poll));
			model.addAttribute("pollsublist", 
					TripPollService.getPollSubList(poll));
			model.addAttribute("tseq",poll.getTseq());
	      return "voteDetail.tiles";
	   }//
	   
	   @RequestMapping(value = "polling.do", 
      method = {RequestMethod.GET,RequestMethod.POST})
      public String polling(TripVoter voter,HttpServletRequest request ,Model model,int tseq) {
         logger.info("Welcome PollController polling! "+ new Date());
         logger.info("Welcome PollController voter! -----------------------------"+ voter);
          String id;
            try{
                  id=getId(request);//위에 메서드로 만듬
              }catch (Exception e) {
                  return "redirect:/login.do";
              }
            voter.setId(id);
         TripPollService.polling(voter);

         return "redirect:/vote.do?tseq="+tseq;
      }   
		
		@RequestMapping(value = "voteresult.do", 
		method = {RequestMethod.GET,RequestMethod.POST})
	public String pollresult(TripPoll poll, Model model) {
		logger.info("Welcome PollController pollresult! "+ poll);
		int tseq = poll.getTseq();
		model.addAttribute("poll", TripPollService.getPoll(poll));
		model.addAttribute("pollsublist", TripPollService.getPollSubList(poll));
		model.addAttribute("tseq",tseq);
		return "voteResult.tiles";
	}
		  
		  @RequestMapping(value = "voteDeleteAf.do", method = {RequestMethod.GET,RequestMethod.POST})
		   public String voteDeleteAf(Model model,TripPoll poll,HttpServletRequest request) {
		      logger.info("Welcome voteResult!");
		      //Alter Table 한 순서대로 삭제
		      int tpseq = poll.getTpseq();
		      int tseq = poll.getTseq();
		      
		      TripPollService.deleteTrip_Voter(tpseq);
		      
		      TripPollService.deleteTrip_PollSub(tpseq);
		      
		      TripPollService.deleteTrip_Poll(tpseq);
		      
		      return "redirect:/vote.do?tseq="+tseq;
		   }


}
