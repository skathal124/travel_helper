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
	         throw new Exception("session�� ����.");
	      }      
	      return ((TravelMember) request.getSession().getAttribute("login")).getId();
	}
	
	// ���� ���� �Խ���!
	@RequestMapping(value = "sharetripboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String sharetripboard(Model model) {
		
		List<ShareBoard> sharelist = shareBoardService.getShareBoardList();
		model.addAttribute("sharelist",sharelist);
		
		return "sharetripboard.tiles";
	}//
		
	// ���� QnA �Խ���!
	@RequestMapping(value = "shareQnAboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String shareQnAboard(Model model) {
		// select ����Ʈ �ؿ��� ���� �ʿ�
		
		
		return "shareQnAboard.tiles";
	}//

	
	@RequestMapping(value = "insertshare.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int insertshare(HttpServletRequest request, int tseq, Model model) throws Exception {
		// �ø��� id
		String id = null;
		try {
			id = getId(request);
		} catch (Exception e) {}
		Trip trip = tripService.getTrip(tseq);
		String tname = trip.getTname();
		String sdate = trip.getSdate().substring(0, 10);
		String edate = trip.getEdate().substring(0, 10);
		// sbname - tname + �Ⱓ
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
		// todo ���� �߰����� �ʰ� �����ϸ� ������!
		board.setSbname(sbname);
		board.setTseq(tseq);

		// �̹� �ִ� insert�� ������ �˻��Ѵ�
		int count = shareBoardService.checkshare(tseq);
		if(count == 0){
			shareBoardService.insertShareBoard(board);
			return 1;
		}
		else{
			return 0;
		}
		// �������� �ʿ��� ��� foward�� ����ϰ� �׳� ���� ��� redirect�� ���ش�
	}
	
	@RequestMapping(value = "sharedetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String sharedetail(int tseq, Model model) {
		// sbseq �� ���� tseq�� trip�� ������
		
		
		// tseq�� ���� ���� ù ��¥�� ���;��Ѵ�.
		Trip trip = tripService.getTrip(tseq);
		String startday = trip.getSdate();
		
		// ������ �� : trip���� ���� ��, ��, tripcityList, trip,
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
		// tseq, getId�� ������ ���ƿ並 ������� �ƴ��� ���ڷ� ��ȯ
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
		
		// ������ ���ÿ� SHARE_BOARD�� totallike -1 ������Ʈ
		
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
		
		// ������ ���ÿ� SHARE_BOARD�� totallike +1 ������Ʈ
		
		tripLikeService.insertlikeOne(trip);
		shareBoardService.updatetotallike(tseq);
		return 1;
	}
	
	// ���� �߰� controller
	@RequestMapping(value = "dailyplan.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String dailyplan(int tseq, int tcseq, Model model) {
		
		Trip trip = tripService.getTrip(tseq);
		String startday = trip.getSdate();
		
		// �޷� ��¥ ���� ���� ����
		String year = startday.substring(0, 4);
	    String month = startday.substring(5,7);
	    model.addAttribute("year",year);
	    model.addAttribute("month",month);
		model.addAttribute("trip",trip);
		model.addAttribute("tseq",tseq);
		
		// ���� ���� tcseq - tripcity �����;���
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
		// �̸� �⺻���� �ϴ� PLAN_BASKET�� ���� -> �ߺ� �˻� ���� ����
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
		// ���߿� Ǯ��!
		planBasketService.insertbasket(basket);
		
		// �߰��� �ֱ� planseq�� �������� �Լ�
		int planseq = planBasketService.getrecentPlanseq(id);
		
		// ������ ��¥�� ��Ŀ ������
		TripDaily tripDaily = new TripDaily();
		tripDaily.setTddate(tempdate);
		tripDaily.setTseq(tseq);
		tripDaily.setTcseq(tcseq);
		List<BasketDaily> basketdailylist = new ArrayList<BasketDaily>(); 
		List<TripDaily> tiprdailylist = tripDailyService.getTripDailyList(tripDaily);
		for (int i = 0; i < tiprdailylist.size(); i++) {
			BasketDaily daily = new BasketDaily();
			TripDaily temp = tiprdailylist.get(i);
			//�ϴ� �� �ű��, planseq�� �߰��ؾ��Ѵ�
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
			// ��� �߰��� ��� �ٱ����� seq�� �ٲ��
			daily.setPlanseq(planseq);
			basketdailylist.add(daily);
		}
		
		// basketdailylist -> insert ���Ѿ���!
		for (int i = 0; i < basketdailylist.size(); i++) {
			basketDailyService.insertBasketDaily(basketdailylist.get(i));
		}
		
		// ���߿� �׽�Ʈ�Ҷ� planbasket�� basketdaily ������ �غ���
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
		// tripdaily ���·� �������Ѵ�. planseq�� ���� -> ��¥, tseq, tcseq�� ���� tripdaily
		
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
		
		// insert �ϱ� ���� delete���� �ؾ��Ѵ�
		// delete�� ���� String ������ tddate�� ' 00:00:00.0'�� �� ���������Ѵ�
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
