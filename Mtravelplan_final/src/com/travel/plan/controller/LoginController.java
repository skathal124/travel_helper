package com.travel.plan.controller;

import java.util.Date;

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

import com.travel.plan.member.dao.TravelMemberService;
import com.travel.plan.member.help.YesMember;
import com.travel.plan.member.model.TravelMember;;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private TravelMemberService travelMemberService;
	
	private String getId(HttpServletRequest request) throws Exception{
	      HttpSession session=request.getSession();
	      Object oLogin=session.getAttribute("login");
	      if(oLogin==null){
	         throw new Exception("session이 없다.");
	      }      
	      return ((TravelMember) request.getSession().getAttribute("login")).getId();
	   }

	
	@RequestMapping(value = "login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(Model model) {
		return "login.tiles";
	}//

	@RequestMapping(value = "regi.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String regi(Model model) {
		return "regi.tiles";
	}//
	
	@RequestMapping(value = "main.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(HttpServletRequest request, Model model) {
		 String id;
	      try{
	         id=getId(request);//위에 메서드로 만듬
	      }catch (Exception e) {
	         return "redirect:/login.do";
	      }
		return "firstmain.tiles";
	}//
	
	
	@RequestMapping(value = "loginAf.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String loginAf(HttpServletRequest request
			,TravelMember member,Model model)  {
		TravelMember login=travelMemberService.checkMember(member);
		if(login!=null && !login.getId().equals("")){
			request.getSession().setAttribute(
					"login", login);
			request.getSession().setMaxInactiveInterval(60*60);	
			return "forward:/main.do";
		}else{
			request.getSession().invalidate();
			return "redirect:/login.do";
		}	
	}
	
	@RequestMapping(value = "logout.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request,Model model) {
		request.getSession().invalidate();
		return "login.tiles";
	}//
	
	
	@RequestMapping(value = "regiAf.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String regiAf(TravelMember member,Model model) {
		travelMemberService.addMember(member);
		return "redirect:/login.do";
	}//
	
	
	@RequestMapping(value = "getID.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public YesMember getID(
			TravelMember member, Model model) throws Exception {
		int count=travelMemberService.getID(member);
		
		YesMember yes=new YesMember();
		if(count>0){
			yes.setMessage("SUCS");
		}else{
			yes.setMessage("FAIL");
		}
		return yes;
	}//
	
	
	@RequestMapping(value = "getNickname.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public YesMember getNickname(
			TravelMember member, Model model) throws Exception {
		int count=travelMemberService.getNickname(member);
		
		YesMember yes2=new YesMember();
		if(count>0){
			yes2.setMessage("SUCS");
		}else{
			yes2.setMessage("FAIL");
		}
		return yes2;
	}//
	
	@RequestMapping(value = "idorpass.do", 
	         method = {RequestMethod.GET,RequestMethod.POST})
	   @ResponseBody
	   public YesMember idorpass(
	         TravelMember member, Model model) throws Exception {
	      int count=travelMemberService.idorpass(member);
	      
	      YesMember yes=new YesMember();
	      if(count==0){
	         yes.setMessage("FAIL");
	      }else{
	         yes.setMessage("SUCS");
	      }
	      return yes;
	   }//

}
