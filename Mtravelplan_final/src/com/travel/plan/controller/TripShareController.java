package com.travel.plan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionException;
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
import com.travel.plan.member.model.TravelMember;
import com.travel.plan.planbasket.dao.PlanBasketService;
import com.travel.plan.planbasket.model.PlanBasket;
import com.travel.plan.shareboard.dao.ShareBoardService;
import com.travel.plan.shareboard.model.ShareBoard;
import com.travel.plan.trip.dao.TripService;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripcity.dao.TripCityService;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripdaily.dao.TripDailyService;
import com.travel.plan.tripdaily.model.TripDaily;
import com.travel.plan.triplike.dao.TripLikeService;

@Controller
public class TripShareController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private TripService tripService;
	@Autowired
	private TripCityService tripCityService;
	@Autowired
	private TripDailyService tripDailyService;
	@Autowired
	private ShareBoardService shareBoardService;
	@Autowired
	private TripLikeService tripLikeService;
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
	
	// 일정 공유 게시판!
	@RequestMapping(value = "sharetripboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String sharetripboard(Model model) {
		
		List<ShareBoard> sharelist = shareBoardService.getShareBoardList();
		model.addAttribute("sharelist",sharelist);
		
		return "sharetripboard.tiles";
	}//
		
	// 일정 QnA 게시판!
	@RequestMapping(value = "shareQnAboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String shareQnAboard(Model model) {
		// select 리스트 해오는 과정 필요
		
		
		return "shareQnAboard.tiles";
	}//

	
	@RequestMapping(value = "insertshare.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int insertshare(HttpServletRequest request, int tseq, Model model) throws Exception {
		// 올린이 id
		String id = null;
		try {
			id = getId(request);
		} catch (Exception e) {}
		Trip trip = tripService.getTrip(tseq);
		String tname = trip.getTname();
		String sdate = trip.getSdate().substring(0, 10);
		String edate = trip.getEdate().substring(0, 10);
		// sbname - tname + 기간
		String sbname = tname+" ("+sdate+" ~ "+edate+")";
		// sbcity
		List<TripCity> list = tripCityService.getCityList(tseq);
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < list.size(); i++){
			sb.append(list.get(i).getCityname() + " ");
		}
		String sbcity = sb.toString();
		
		ShareBoard board = new ShareBoard();

		board.setId(id);
		board.setSbcity(sbcity);
		// todo 도시 추가하지 않고 공유하면 오류남!
		board.setSbname(sbname);
		board.setTseq(tseq);

		// 이미 있는 insert된 값인지 검사한다
		int count = shareBoardService.checkshare(tseq);
		if(count == 0){
			shareBoardService.insertShareBoard(board);
			return 1;
		}
		else{
			return 0;
		}
		// 스코프가 필요한 경우 foward를 사용하고 그냥 가는 경우 redirect를 써준다
	}
	
	@RequestMapping(value = "sharedetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String sharedetail(int tseq, Model model) {
		// sbseq 를 통해 tseq와 trip을 얻어오자
		
		
		// tseq를 통해 여행 첫 날짜를 얻어와야한다.
		Trip trip = tripService.getTrip(tseq);
		String startday = trip.getSdate();
		
		// 보내는 값 : trip에서 받은 년, 월, tripcityList, trip,
		String year = startday.substring(0, 4);
	    String month = startday.substring(5,7);
	    model.addAttribute("year",year);
	    model.addAttribute("month",month);
		model.addAttribute("trip",trip);
		model.addAttribute("tseq",tseq);
		
		return "sharedetail.tiles";
	}//
	
	
	@RequestMapping(value = "checklike.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int countlike(HttpServletRequest request, int tseq, Model model) throws Exception {
		// tseq, getId를 보내서 좋아요를 찍었는지 아닌지 숫자로 반환
		Trip trip = new Trip();
		trip.setTseq(tseq);
		trip.setId(getId(request));
		
		int check = tripLikeService.getlike(trip);
		if(check != 0){
			return 1;
		}
		else {
			return 0;
		}
	}
	
	@RequestMapping(value = "deletelike.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int deletelike(HttpServletRequest request, int tseq, Model model) throws Exception {
		Trip trip = new Trip();
		trip.setTseq(tseq);
		trip.setId(getId(request));
		
		// 누르는 동시에 SHARE_BOARD의 totallike -1 업데이트
		
		tripLikeService.deletelikeOne(trip);
		shareBoardService.updatetotallike(tseq);
		return 1;
	}
	
	@RequestMapping(value = "insertlike.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int insertlike(HttpServletRequest request, int tseq, Model model) throws Exception {
		Trip trip = new Trip();
		trip.setTseq(tseq);
		trip.setId(getId(request));
		
		// 누르는 동시에 SHARE_BOARD의 totallike +1 업데이트
		
		tripLikeService.insertlikeOne(trip);
		shareBoardService.updatetotallike(tseq);
		return 1;
	}
	
	// 지도 추가 controller
	@RequestMapping(value = "dailyplan.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String dailyplan(int tseq, int tcseq, Model model) {
		
		Trip trip = tripService.getTrip(tseq);
		String startday = trip.getSdate();
		
		// 달력 날짜 띄우기 위한 변수
		String year = startday.substring(0, 4);
	    String month = startday.substring(5,7);
	    model.addAttribute("year",year);
	    model.addAttribute("month",month);
		model.addAttribute("trip",trip);
		model.addAttribute("tseq",tseq);
		
		// 도시 정보 tcseq - tripcity 가져와야함
		TripCity tripcity = tripCityService.getTripCity(tcseq);
		tripcity.setCitysdate(tripcity.getCitysdate().substring(0, 10));
		tripcity.setCityedate(tripcity.getCityedate().substring(0, 10));
		model.addAttribute("tripcity",tripcity);
		
		return "dailyplan.tiles";
	}//

	
	@RequestMapping(value = "addplanbasket.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String newcity(int tseq, int tcseq, String tempdate, Model model) {
		
		Trip trip = tripService.getTrip(tseq);
		TripCity city = tripCityService.getTripCity(tcseq);
		
		model.addAttribute("tseq",tseq);
		model.addAttribute("tcseq",tcseq);
		model.addAttribute("trip",trip);
		model.addAttribute("tripcity",city);
		model.addAttribute("tempdate",tempdate);

		return "addplanbasket.tiles";
	}//
	
	
	@RequestMapping(value = "addplanbasketaf.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String addplanbasketaf(HttpServletRequest request, int tseq, int tcseq, String tempdate, String basketname, Model model) {
		// 이를 기본으로 하는 PLAN_BASKET에 저장 -> 중복 검사 하지 않음
		PlanBasket basket = new PlanBasket();
		basket.setBasketname(basketname);
		basket.setSomeday(tempdate);
		String id = "";
		try {
			id = getId(request);
			basket.setId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 나중에 풀어!
		planBasketService.insertbasket(basket);
		
		// 추가한 최근 planseq을 가져오는 함수
		int planseq = planBasketService.getrecentPlanseq(id);
		
		// 저장할 날짜의 마커 정보들
		TripDaily tripDaily = new TripDaily();
		tripDaily.setTddate(tempdate);
		tripDaily.setTseq(tseq);
		tripDaily.setTcseq(tcseq);
		List<BasketDaily> basketdailylist = new ArrayList<BasketDaily>(); 
		List<TripDaily> tiprdailylist = tripDailyService.getTripDailyList(tripDaily);
		for (int i = 0; i < tiprdailylist.size(); i++) {
			BasketDaily daily = new BasketDaily();
			TripDaily temp = tiprdailylist.get(i);
			//일단 다 옮기고, planseq도 추가해야한다
			daily.setBtdnum(temp.getTdnum());
			daily.setBtdlat(temp.getTdlat());
			daily.setBtdlng(temp.getTdlng());
			daily.setBtdplace(temp.getTdplace());
			daily.setBtdwork(temp.getTdwork());
			daily.setBtddate(temp.getTddate());
			daily.setBtdmoney(temp.getTdmoney());
			daily.setBtdseq(temp.getTdseq());
			daily.setTseq(1);
			daily.setTcseq(1);
			daily.setBtdstime(temp.getTdstime());
			daily.setBtdetime(temp.getTdetime());
			// 방금 추가한 경로 바구니의 seq로 바꿔라
			daily.setPlanseq(planseq);
			basketdailylist.add(daily);
		}
		
		// basketdailylist -> insert 시켜야함!
		for (int i = 0; i < basketdailylist.size(); i++) {
			basketDailyService.insertBasketDaily(basketdailylist.get(i));
		}
		
		// 나중에 테스트할때 planbasket과 basketdaily 날리고 해보기
		return "OK";
	}//
	
	@RequestMapping(value = "mybasketlist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String mybasketlist(HttpServletRequest request,int tseq, int tcseq, String tempdate, Model model) {
		
		model.addAttribute("tseq",tseq);
		model.addAttribute("tcseq",tcseq);
		
		String id;
		try {
			id = getId(request);
			List<PlanBasket> planbasketlist =planBasketService.getPlanBasket(id);
			model.addAttribute("basketlist",planbasketlist);
			model.addAttribute("tempdate",tempdate);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "mybasketlist.tiles";
	}//
	
	
	@RequestMapping(value = "getbasketdaily.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String getbasketdaily(HttpServletRequest request,String someday, int planseq, int tseq, int tcseq, Model model) throws Exception {
		
		List<BasketDaily> basketlist = basketDailyService.getBasketDaily(planseq);
		// tripdaily 형태로 만들어야한다. planseq을 빼고 -> 날짜, tseq, tcseq를 넣은 tripdaily
		
		List<TripDaily> dailylist = new ArrayList<>();
		for (int i = 0; i < basketlist.size(); i++) {
			TripDaily daily = new TripDaily();
			daily.setTdseq(basketlist.get(i).getBtdseq());
			daily.setTseq(tseq);
			daily.setTcseq(tcseq);
			daily.setTddate(someday);
			daily.setTdnum(basketlist.get(i).getBtdnum());
			daily.setTdplace(basketlist.get(i).getBtdplace());
			daily.setTdstime(basketlist.get(i).getBtdstime());
			daily.setTdetime(basketlist.get(i).getBtdetime());
			daily.setTdmoney(basketlist.get(i).getBtdmoney());
			daily.setTdwork(basketlist.get(i).getBtdwork());
			daily.setTdlat(basketlist.get(i).getBtdlat());
			daily.setTdlng(basketlist.get(i).getBtdlng());
			dailylist.add(daily);
		}
		
		// insert 하기 전에 delete먼저 해야한다
		// delete가 문제 String 형식의 tddate의 ' 00:00:00.0'을 다 빼버려야한다
		if(dailylist.size() != 0){
			tripDailyService.deleteTripDaily(dailylist.get(dailylist.size()-1));
		}
		for (int i = 0; i < dailylist.size(); i++) {
			tripDailyService.insertTripDaily(dailylist.get(i));
		}
		
		return "OK";
	}
	
	
	@RequestMapping(value = "sbsearch.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String sbsearch(Model model, ShareBoard sb) {

		List<ShareBoard> sharelist = new ArrayList<ShareBoard>();
		List<ShareBoard> alllist = shareBoardService.getShareBoardList();
		String skeyword = sb.getSkeyword();
		
		if(sb.getS_category().equals("sbname")){
			for (int i = 0; i < alllist.size(); i++) {
				if(alllist.get(i).getSbname().contains(skeyword))
				sharelist.add(alllist.get(i));
			}
		}
		
		else if (sb.getS_category().equals("sbcity")){
			for (int i = 0; i < alllist.size(); i++) {
				if(alllist.get(i).getSbcity().contains(skeyword))
				sharelist.add(alllist.get(i));
			}
		}
		
		model.addAttribute("sharelist",sharelist);
		return "sharetripboard.tiles";
	}//
	
	@RequestMapping(value = "sharecan.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String sharecan(int sbseq, Model model) {

		shareBoardService.deleteshareboard(sbseq);
		
		return "redirect:/sharetripboard.do";
	}//
	
	
}
