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
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.plan.basketdaily.dao.BasketDailyService;
import com.travel.plan.basketdaily.model.BasketDaily;
import com.travel.plan.member.dao.TravelMemberService;
import com.travel.plan.member.model.TravelMember;
import com.travel.plan.mypage.dao.MyPageService;
import com.travel.plan.planbasket.dao.PlanBasketService;
import com.travel.plan.planbasket.model.PlanBasket;
import com.travel.plan.trip.dao.TripService;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.dao.TripGroupService;
import com.travel.plan.tripgroup.model.TripGroup;

@Controller
public class MyPageController {
	
   private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
   

   @Autowired
   private MyPageService myPageService;
   @Autowired
   private TripService tripService;
   @Autowired
   private TripGroupService tripGroupService;
   @Autowired
   private TravelMemberService TravelMemberService;
   @Autowired
   private PlanBasketService planBasketService;
   @Autowired
   private BasketDailyService basketDailyService;
   
   private String getId(HttpServletRequest request) throws Exception{
      HttpSession session=request.getSession();
      Object oLogin=session.getAttribute("login");
      if(oLogin==null){
         throw new Exception("session이 없다.");
      }      
      return ((TravelMember) request.getSession().getAttribute("login")).getId();
   }
   
   @RequestMapping(value = "mpgroup.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String mpgroup(HttpServletRequest request, Model model) {
      
      logger.info("Welcome MyPageController mpgroup! ");
      String id;

      try{
         id=getId(request);//위에 메서드로 만듬
     
      }catch (Exception e) {
         return "redirect:/login.do";
      }
      List<Integer> tseqlist = new ArrayList<>();
		tseqlist = myPageService.inmytrip(id);
		List<Trip> triplist = new ArrayList<>(); 
		
		
		for (int i = 0; i < tseqlist.size(); i++) {
			Trip trip = new Trip();
			trip = tripService.getTrip(tseqlist.get(i));
			triplist.add(trip);
		}
		
		model.addAttribute("triplist", triplist);
      
		return "mpgroup.tiles";
   }//
   
   @RequestMapping(value = "mpbasket.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String mpbasket(HttpServletRequest request, Model model) {
	   // 추가!
      String id;
      try{
         id=getId(request);//위에 메서드로 만듬
         //id로 내 그룹 찾기
         List<PlanBasket> basketlist = planBasketService.getPlanBasket(id);
         model.addAttribute("basketlist",basketlist);
         
      }catch (Exception e) {
         return "redirect:/login.do";
      }
      return "mpbasket.tiles";
   }//
   
   
   @RequestMapping(value = "memberdetail.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String memberdetail(int tseq,Model model) {
      model.addAttribute("tseq",tseq);
      TravelMember tempMeber = new TravelMember();
      List<TripGroup> memberidlist = new ArrayList<>();
      memberidlist = tripGroupService.getTripGroup(tseq);
      String tname = tripService.getTrip(tseq).getTname();
      
      
      List<TravelMember> memberlist = new ArrayList<>();
      for (int i = 0; i < memberidlist.size(); i++) {
         tempMeber = TravelMemberService.getMember(memberidlist.get(i).getId());
         memberlist.add(tempMeber);
      }
      model.addAttribute("memberlist", memberlist);
      model.addAttribute("tname", tname);
      return "memberdetail.tiles";
   }//
   
   
   @RequestMapping(value = "mpinvite.do", method = {RequestMethod.GET,RequestMethod.POST})
   public String mpinvite(HttpServletRequest request, Model model) {
      
      logger.info("Welcome MyPageController mpinvite! ");
      String id;
      TripGroup tg = new TripGroup();
      try{
         id=getId(request);//위에 메서드로 만듬
         tg.setId(id);
      }catch (Exception e) {
         return "redirect:/login.do";
      }
      List<Integer> tseqlist = new ArrayList<>();
		tseqlist = myPageService.getTseqFromId(tg);
		List<Trip> triplist = new ArrayList<>(); 
		
		
		for (int i = 0; i < tseqlist.size(); i++) {
			Trip trip = new Trip();
			trip = tripService.getTrip(tseqlist.get(i));
			triplist.add(trip);
		}
		

		model.addAttribute("triplist", triplist);
      
      return "mpinvite.tiles";
   }//
   
   @RequestMapping(value = "addmypage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String addmypage(int tseq, Model model, HttpServletRequest request) {
		logger.info("Welcome PDfSController pdsdel! "+ new Date());
		String id;
		try{
			id=getId(request);//위에 메서드로 만듬
		}catch (Exception e) {
			return "redirect:/login.do";
		}
		Trip tripg = new Trip();
		tripg.setId(id);
		tripg.setTseq(tseq);
		myPageService.changeGroupIn(tripg);
	
		return "redirect:/mpinvite.do";
	}//
	
	@RequestMapping(value = "delmypage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String delmypage(int tseq, Model model, HttpServletRequest request) {
		logger.info("Welcome PDSController pdsdel! "+ new Date());
		 String id;
		 TripGroup tg = new TripGroup();
	      try{
	         id=getId(request);//위에 메서드로 만듬
	         tg.setId(id);
	         tg.setTseq(tseq);
	      }catch (Exception e) {
	         return "redirect:/login.do";
	      }
	    int tgseq = myPageService.getTgseqFromTg(tg); 
		tripGroupService.delTripgroupByTgseq(tgseq);
		return "redirect:/mpinvite.do";
	}//
	
	@RequestMapping(value = "delmypage2.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String delmypage2(int tseq, Model model, HttpServletRequest request) {
		logger.info("Welcome PDSController pdsdel! "+ new Date());
		 String id;
		 TripGroup tg = new TripGroup();
	      try{
	         id=getId(request);//위에 메서드로 만듬
	         tg.setId(id);
	         tg.setTseq(tseq);
	      }catch (Exception e) {
	         return "redirect:/login.do";
	      }
	    int tgseq = myPageService.getTgseqFromTg(tg);
	    String personId = myPageService.getPersonId(tseq);  
	    if(id==personId||id.equals(personId)){
	    	tripGroupService.delTripgroup(tseq);
	    	tripService.delTrip(tseq);
	    }else{
	    	tripGroupService.delTripgroupByTgseq(tgseq);
	    }
	      
		
		return "redirect:/mpgroup.do";
	}//
	
	  @RequestMapping(value = "changeMypage.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String changeMypage(Model model, HttpServletRequest request) {
				logger.info("Welcome MyPageController changeMypage! "+ new Date());
				String id;
				try{
					id=getId(request);//위에 메서드로 만듬
				}catch (Exception e) {
					return "redirect:/login.do";
				}
				TravelMember member = new TravelMember();
				member = TravelMemberService.getMember(id);
				model.addAttribute("member", member);
				return "changeinfo.tiles";
			}//
	  
	  @RequestMapping(value = "changeinfo.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String changeinfo(Model model, HttpServletRequest request) {
			logger.info("Welcome MyPageController changeMypage! "+ new Date());
			String id;
			try{
				id=getId(request);//위에 메서드로 만듬
			}catch (Exception e) {
				return "redirect:/login.do";
			}
			TravelMember member = new TravelMember();
			member = TravelMemberService.getMember(id);
			model.addAttribute("member", member);
			return "changeinfo_2.tiles";
		}//
	  
	  @RequestMapping(value = "deleteinfo.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String deleteinfo(Model model, HttpServletRequest request) {
			logger.info("Welcome MyPageController changeMypage! "+ new Date());
			String id;
			try{
				id=getId(request);//위에 메서드로 만듬
			}catch (Exception e) {
				return "redirect:/login.do";
			}
			TravelMember member = new TravelMember();
			member = TravelMemberService.getMember(id);
			model.addAttribute("member", member);
			return "deleteinfo.tiles";
		}//
	  
	  @RequestMapping(value = "ChangeInfoAf.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String ChangeInfoAf(TravelMember member, Model model, HttpServletRequest request) {
				logger.info("Welcome MyPageController changeMypage! "+ new Date());
				String id;
				try{
					id=getId(request);//위에 메서드로 만듬
				}catch (Exception e) {
					return "redirect:/login.do";
				}
				TravelMember originalMember = TravelMemberService.getMember(id);
				String email = originalMember.getEmail();
				String nickname = originalMember.getNickname();
				String pwd = originalMember.getPwd();
				
				if(member.getEmail().equals("")){
					member.setEmail(email);
				}
				if(member.getNickname().equals("")){
					member.setNickname(nickname);
				}
				if(member.getPwd().equals("")){
					member.setPwd(pwd);
				}
				
				member.setId(id);
				myPageService.changeMyInfo(member);
				
				return "firstmain.tiles";
			}//
	  
	  @RequestMapping(value = "checkMypagePwd.do", 
				method = {RequestMethod.GET,RequestMethod.POST})
	  
		@ResponseBody
		public String checkMypagePwd(
				TravelMember member, Model model,HttpServletRequest request) throws Exception {
			logger.info("Welcome MyPageController checkMypagePwd! "+ new Date());
			String id;
			try{
				id=getId(request);//위에 메서드로 만듬
			}catch (Exception e) {
				return "redirect:/login.do";
			}
			
			member.setId(id);
			int count=myPageService.checkMypagePwd(member);
			
			String Message = "";
			if(count>0){
				Message="SUCS";
			}else{
				Message="FAIL";
			}
			return Message;
		}//
	  
	  @RequestMapping(value = "deleteMember.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String deleteMember(Model model, HttpServletRequest request) {
			logger.info("Welcome MyPageController deleteMember! ");
			String id;
			try{
				id=getId(request);//위에 메서드로 만듬
			}catch (Exception e) {
				return "redirect:/login.do";
			}
			myPageService.deleteTripBoardReplyById(id);
			myPageService.deleteTripBoardById(id);
			myPageService.deleteTripGroupById(id);
			myPageService.deleteTripById(id);
			myPageService.deleteMemberById(id);
			
			
			return "login.tiles";
		}//

	  
	   @RequestMapping(value = "sharedelete.do", method = RequestMethod.POST)
	   @ResponseBody
	   public int sharedelete(int planseq, Model model){
		   
		   basketDailyService.deleteBasketDaily(planseq);
		   planBasketService.deletePlanBasket(planseq);
		   return 1;
	   }
	   
	  
}