package com.travel.plan.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSessionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.travel.plan.member.model.TravelMember;
import com.travel.plan.shareboard.dao.ShareBoardService;
import com.travel.plan.trip.dao.TripService;
import com.travel.plan.trip.help.FUpUtil;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripcity.dao.TripCityService;
import com.travel.plan.tripcity.model.TripCity;
import com.travel.plan.tripdaily.dao.TripDailyService;
import com.travel.plan.tripdaily.model.TripDaily;
import com.travel.plan.tripgroup.dao.TripGroupService;
import com.travel.plan.tripgroup.model.TripGroup;
import com.travel.plan.triplike.dao.TripLikeService;

@Controller
public class TripController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private TripService tripService;
	@Autowired
	private TripCityService tripCityService;
	@Autowired
	private TripGroupService tripGroupService;
	@Autowired
	private TripDailyService tripDailyService;
	@Autowired
	private ShareBoardService shareBoardService;
	@Autowired
	private TripLikeService tripLikeService;
	
	private String getId(HttpServletRequest request) throws Exception{
	      HttpSession session=request.getSession();
	      Object oLogin=session.getAttribute("login");
	      if(oLogin==null){
	         throw new Exception("session이 없다.");
	      }      
	      return ((TravelMember) request.getSession().getAttribute("login")).getId();
	   }


	@RequestMapping(value = "trip.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String trip(HttpServletRequest request, Model model, TripParam param) {
		logger.info("Welcome TripController login! ");
		String id;
		
		try {
			id = getId(request);
		} catch (Exception e) {
			return "redirect:/login.do";
		}
		
	     int sn=param.getPageNumber();
		 int start=(sn)*param.getRecordCountPerPage()+1;
	     int end=(sn+1)*param.getRecordCountPerPage();
		      
	     param.setStart(start);
		 param.setEnd(end);
			  
		List<TripGroup> list = tripGroupService.getTseqId(id);
	
		
		for (int i = 0; i < list.size(); i++) {
			Trip testtrip = tripService.getTrip(list.get(i).getTseq());
			String sdate = testtrip.getSdate().substring(0, 10);
			String edate = testtrip.getEdate().substring(0, 10);
			testtrip.setSdate(sdate);
			testtrip.setEdate(edate);
			tripService.InsertTripPaging(testtrip);
		}
		
		List<Trip> triplist = tripService.getTripPageList(param);
		
		 int totalRecordCount=
				 tripService.getTripTotalCount(param);
		
	      //페이징
	      model.addAttribute("pageNumber", sn);
		  model.addAttribute("pageCountPerScreen", 10);
		  model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		  model.addAttribute("totalRecordCount", totalRecordCount);
		  //검색
		  model.addAttribute("s_category", param.getS_category());
		  model.addAttribute("s_keyword", param.getS_keyword());
		  
		  model.addAttribute("trip", triplist);
		
		Trip trip_new = new Trip();
		tripService.delTripPaging(trip_new);
		return "trip.tiles";
	}//
	
	
	@RequestMapping(value = "newpage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String newpage(Model model) {
		logger.info("Welcome TripController newpage! ");
		return "newpage.tiles";
	}//

	@RequestMapping(value = "tripwrite.do", method = { RequestMethod.POST })
	public String tripwrite(Trip trip, HttpServletRequest request,
			@RequestParam(value = "fileload", required = false) MultipartFile fileload, Model model) {

		trip.setFilename(fileload.getOriginalFilename());
		
		// 연습용 경로
		// String fupload = "C:\\Workspace\\travel\\travelplan0516\\WebContent\\webimage";
		String fupload = request.getServletContext().getRealPath("/webimage");
		
		logger.info(": " + fupload);
		String f = trip.getFilename();

		String newFile = FUpUtil.getNewFile(f);

		logger.info(fupload + "/" + newFile);
		trip.setFilename(newFile);

		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			tripService.writeTrip(trip);
			model.addAttribute("trip", tripService);
			logger.info("Welcome upload success! ");
		} catch (IOException e) {
			logger.info("Welcome upload fail! ");
		}
		
		Trip rtrip = new Trip();
		try {
			rtrip.setId(getId(request));
		} catch (Exception e) {
			return "redirect:/login.do";

		}
		
		int ttseq = tripService.getRecentTseq(rtrip);
		rtrip.setTseq(ttseq);
		
		tripGroupService.insertGroup(rtrip);
		
		return "redirect:/trip.do";
	}//
	
	@RequestMapping(value = "deltrip.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String deltrip(int tseq, Model model) {
		logger.info("Welcome TripController deltrip! "+ new Date());
		// 좋아요도 지워야한다
		tripLikeService.deletelikeOneTseq(tseq);
		
		// 일정 공유 shareboard도 삭제해야한다
		shareBoardService.deleteshareboardtseq(tseq);
		
		// tripdaily 전부 삭제하는 쿼리 tseq
		tripDailyService.deleteDailyList(tseq);
		
		// tripcity 날리는거 
		tripCityService.deleteCityList(tseq);
		
		// 그룹 먼저 삭제
		tripGroupService.delTripgroup(tseq);
		
		// 그룹 삭제 뒤 테이블 delete
		tripService.delTrip(tseq);
		
		return "redirect:/trip.do";
	}//
	
	
	@RequestMapping(value = "tripdetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String tripdetail(int tseq, Model model) {
		
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
		
		return "tripdetail.tiles";
	}//
	
	
	///////////////////////////////////////////
		@RequestMapping(value = "checkid.do", method = {RequestMethod.GET,RequestMethod.POST})
	   @ResponseBody
	   public int checkid(int tseq,
	         String id, Model model) throws Exception {
	      logger.info("Welcome TripController checkid! "+ new Date());
	  
	  int count = tripService.getTripId(id);
	  //1
	  if(count==1){
	
	  TripGroup tg = new TripGroup();
	  tg.setId(id);
	  tg.setTseq(tseq);
	  int count2 = tripGroupService.commonIdCheck(tg);
	  
	  /*int result = count + count2;*/
	      if(count2==0) {
	    	  return 0;
	      } else {
	    	  return 1;
	      }
	      } else {return 1;}
	}
	
	
	
	
	@RequestMapping(value = "tripupdateaf.do", method = RequestMethod.POST)
	public String pdsupdateAf(Trip trip,String filename,HttpServletRequest request,
			@RequestParam(value="fileload", required=false) MultipartFile fileload, Model model) {
		
		trip.setFilename(fileload.getOriginalFilename());//이름이 포함안됨

		if(trip.getFilename()!=null && !trip.getFilename().equals("")){
			String fupload = request.getServletContext().getRealPath("/webimage");
			// String fupload = "C:\\Workspace\\travel\\travelplan05223som\\WebContent\\webimage";
			String f=trip.getFilename();
			String newFile=FUpUtil.getNewFile(f);//이름+long+.접미사
			
			trip.setFilename(newFile);//이름 변경
			try {
				File file=new File(fupload+"/"+newFile);
				//logger.info(fupload+"\\"+newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				tripService.updateTrip(trip);
			} catch (IOException e) {
			}
			
		}else {
			trip.setFilename("noimage.png");
			tripService.updateTrip(trip);
		}
		return "redirect:/trip.do";
	}//
	
	@RequestMapping(value = "updatepage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updatepage(int tseq,Model model) {
		logger.info("Welcome TripController login! ");
		Trip trip = tripService.getTrip(tseq);		
		model.addAttribute("trip",trip);
		return "updatepage.tiles";
	}//
	
	@RequestMapping(value = "grouppage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String grouppage(int tseq,Model model) {
		logger.info("Welcome TripController login! ");
		Trip trip = tripService.getTrip(tseq);
		List<TripGroup> list = tripGroupService.getTripGroup(tseq);
		model.addAttribute("trip",trip);
		model.addAttribute("tg",list);
		return "groupplus.tiles";
	}//
	
	
	
	////////////////////
	@RequestMapping(value = "inviteMember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String groupUpdate(int tseq,String id, Model model) {
		System.out.println(tseq + id);
		Trip trip = tripService.getTrip(tseq);
		model.addAttribute("trip",trip);
		
		TripGroup tg = new TripGroup();
		tg.setTseq(tseq);
		tg.setId(id);
		tripGroupService.inviteMember(tg);
		
		return "groupplus.tiles";
	}//
	
	@RequestMapping(value = "cityadd.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String newcity(int tseq,Model model) {
		model.addAttribute("tseq",tseq);
		Trip trip = tripService.getTrip(tseq);
		model.addAttribute("trip",trip);

		return "cityadd.tiles";
	}//
	
	@RequestMapping(value = "cityaddaf.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String cityaddaf(TripCity tripcity, Model model) {
		
		// insert 해야한다
		try{
			tripCityService.insertCity(tripcity);
			return "OK";
		}
		catch (SqlSessionException e) {
			System.out.println(e);
			return "NO!!";
		}
	}//
	
	@RequestMapping(value = "cityedit.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String cityedit(int tcseq, Model model) {
		
		// tcseq로 하나의 tripcity를 받는 것을 해야한다
		TripCity tripcity = tripCityService.getTripCity(tcseq);
		model.addAttribute("tripcity",tripcity);
		model.addAttribute("tseq",tripcity.getTseq());
		
		return "cityedit.tiles";
	}//
	
	@RequestMapping(value = "pushcitycal.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, List<TripCity>> getNotice(int tseq, Model model){

		List<TripCity> citylist = new ArrayList<TripCity>();
		citylist = tripCityService.getCityList(tseq);
		
		// 여기서 cityedate 날짜 전부 설정? 시간을 23:00 쯤으로 바꿔줘야함 
		// insert에서 해주려면 스트링아웃오브인덱스 뜬다
		for (int i = 0; i < citylist.size(); i++) {
			StringBuffer sb = new StringBuffer(citylist.get(i).getCityedate().substring(0, 11));
			sb.append("23:00:00");
			citylist.get(i).setCityedate(sb.toString());
		}
		
		Map<String, List<TripCity>> maps=new HashMap<>();
		maps.put("citylist", citylist);
		
		return maps;
	}
	
	@RequestMapping(value = "cityeditaf.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String cityeditaf(TripCity tripcity, Model model) {
		
		// update 해야한다
		try{
			tripCityService.updateTripCity(tripcity);
			return "OK";
		}
		catch (SqlSessionException e) {
			return "NO!!";
		}
	}//
	
	@RequestMapping(value = "citydelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String citydelete(int tcseq, Model model) {
		// trip daily 날리는 쿼리
		tripDailyService.deleteTripDailyList(tcseq);
		
		// update 해야한다
		try{
			tripCityService.deleteTripCity(tcseq);
			return "OK";
		}
		catch (SqlSessionException e) {
			return "NO!!";
		}
	}//
	
	@RequestMapping(value = "main_trip_start.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main_trip_start(Model model) {
		return "main_trip_start.tiles";
	}//
	
	@RequestMapping(value = "main_trip_share.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main_trip_share(Model model) {
		return "main_trip_share.tiles";
	}//
	
	
	@RequestMapping(value = "tripdailywrite.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String tripdailywrite(int tseq, int tcseq, Model model) {
		// tseq, tcseq만 온다
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
		
		return "tripdaily.tiles";
	}//
	
	@RequestMapping(value = "tripdata.do", method = RequestMethod.POST)
	@ResponseBody
	public List<TripDaily> tripdata(HttpServletRequest request,@RequestBody List<TripDaily> maps, Model model) {
		// insert 하기 전에 delete먼저 해야한다
		// delete가 문제 String 형식의 tddate의 ' 00:00:00.0'을 다 빼버려야한다
		if(maps.size() != 0){
			tripDailyService.deleteTripDaily(maps.get(maps.size()-1));
		}
		try{
			
			for (int i = 0; i < maps.size(); i++) {
				tripDailyService.insertTripDaily(maps.get(i));
			}
			return maps;
		} catch (SqlSessionException e) {
			return null;
		}
	}
	
	@RequestMapping(value = "gettripdailylist.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<TripDaily> gettripdailylist(HttpServletRequest request, TripDaily tripDaily, Model model) {
		
		List<TripDaily> tiprdailylist = tripDailyService.getTripDailyList(tripDaily);
		
		return tiprdailylist;
	}
	
	
	@RequestMapping(value = "deletedaily.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String deletedaily(HttpServletRequest request, TripDaily tripDaily, Model model) {
		
//		logger.info("확인용 "+tripDaily.toString());
		tripDailyService.deleteTripDaily(tripDaily);
		
		return "OK";
	}
	
	@RequestMapping(value = "printallday.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String printallday(int tcseq,Model model) {
		model.addAttribute("tcseq",tcseq);
		List<TripDaily> cityinfo = tripDailyService.getCityInfo(tcseq);
		TripCity tripcity = tripCityService.getTripCity(tcseq);
		int totalmoney = 0;
		
		for (int i = 0; i < cityinfo.size(); i++) {
			totalmoney += cityinfo.get(i).getTdmoney();
		}
		
		model.addAttribute("tripcity",tripcity);
		model.addAttribute("totalmoney",totalmoney);
		
		return "cityinfo.tiles";
	}//
	
	@RequestMapping(value = "getcityinfo.do", method = RequestMethod.POST)
	@ResponseBody
	public List<TripDaily> getcityinfo(int tcseq, Model model) {
			List<TripDaily> cityinfolist = tripDailyService.getCityInfo(tcseq);
			
			return cityinfolist;
	}
	
	
}
