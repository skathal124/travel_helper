package com.travel.plan.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.travel.plan.member.model.TravelMember;
import com.travel.plan.trip.help.FUpUtil;
import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripboard.board.dao.BoardService;
import com.travel.plan.tripboard.main.dao.TripBoardService;
import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;
import com.travel.plan.tripgroup.model.TripGroup;

@Controller
public class TripBoardController {
	

	   @Autowired
	   private TripBoardService TripBoardService;
	   
	   @Autowired
	   private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	
	private String getId(HttpServletRequest request) throws Exception{
	      HttpSession session=request.getSession();
	      Object oLogin=session.getAttribute("login");
	      if(oLogin==null){
	         throw new Exception("session이 없다.");
	      }      
	      return ((TravelMember) request.getSession().getAttribute("login")).getId();
	}
	

	
	@RequestMapping(value = "board.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String tripboard(Model model,int tseq) {
		logger.info("Welcome board!");
		model.addAttribute("tseq",tseq);
		List<TripBoard> tblist = boardService.getBoardList(tseq);

		model.addAttribute("board",tblist);

		return "board.tiles";
	}//
	
	@RequestMapping(value = "boardwrite.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardwrite(Model model, int tseq) {
		logger.info("Welcome board!");
		model.addAttribute("tseq",tseq);
		
		return "board_write.tiles";
	}//
	
	
	@RequestMapping(value = "boardwriteaf.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardwriteaf(TripBoard board, HttpServletRequest request,
		@RequestParam(value = "fileload", required = false) MultipartFile fileload, Model model) {

		logger.info("Welcome boardwriteaf!");
		
		board.setFilename(fileload.getOriginalFilename());
		String fupload = request.getServletContext().getRealPath("/webimage");
		String f = board.getFilename();

		String newFile = FUpUtil.getNewFile(f);
		board.setFilename(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			boardService.writeBoard(board);
	
			model.addAttribute("board", boardService);
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
		
		return "redirect:/board.do?tseq="+board.getTseq();
	}//
	
	
	


	   
	   @RequestMapping(value = "tripBoardMain.do", method = {RequestMethod.GET,RequestMethod.POST})
	   public String getMyGroup(HttpServletRequest request, Model model) {
	      
	      logger.info("Welcome MyPageController mpgroup! ");
	      String id;

	      try{
	         id=getId(request);//위에 메서드로 만듬
	     
	      }catch (Exception e) {
	         return "redirect:/login.do";
	      }
	      	List<Integer> tseqlist = new ArrayList<>();
	      	tseqlist = TripBoardService.getMyGroup(id);
			List<Trip> tlist = new ArrayList<>(); 

			for (int i = 0; i < tseqlist.size(); i++) {
				Trip trip = new Trip();
				TripGroup tg = new TripGroup();
				int tgseq= tseqlist.get(i);
				tg.setId(id);
				tg.setTgseq(tgseq);
				trip.setTname(TripBoardService.getMyGroupName(tg));
				trip.setId(id);
				trip.setTseq(TripBoardService.getTseqFromTG(tgseq));
				tlist.add(trip);
			}
			logger.info("-------------------- "+tlist);
			model.addAttribute("triplist", tlist);
	        
			return "trip_board_main.tiles";
	   }
	   
	   
		@RequestMapping(value = "boarddetail.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String boarddetail(Model model, int tbseq) {
			logger.info("Welcome board!");
			
			boardService.boardReadCount(tbseq);
			model.addAttribute("board",boardService.getBoard(tbseq));
			model.addAttribute("tbseq",tbseq);
			model.addAttribute("tseq",boardService.getBoard(tbseq).getTseq());
			
			List<TripBoardReply> tbrlist = boardService.getBoardReplyList(tbseq);
			model.addAttribute("reply",tbrlist);
			return "board_detail.tiles";
		}//
		
	   
	   
	   
	   
	   
		@RequestMapping(value = "boardreply.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String boardreply(Model model, int tbseq, String content, String id) {
			logger.info("Welcome boardreply!");

			model.addAttribute("tbseq",tbseq);
			model.addAttribute("tseq",boardService.getBoard(tbseq).getTseq());

			TripBoardReply tbr = new TripBoardReply();
			tbr.setTbseq(tbseq);
			tbr.setContent(content);
			tbr.setId(id);
			
			boardService.writeBoardReply(tbr);


			boardService.updateReplyCount(tbseq);

			
			return "redirect:/boarddetail.do?tbseq="+tbseq;
//			return null;
		}//
		
		@RequestMapping(value = "boarddelete.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String boarddelete(Model model, int tbseq) {
			logger.info("Welcome boarddelete!");
			int tseq = boardService.getBoard(tbseq).getTseq();
			boardService.deleteBoardReply(tbseq);
			boardService.deleteBoard(tbseq);
			
			return "redirect:/board.do?tseq="+tseq;
		}//
		
		
		@RequestMapping(value = "boardupdate.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String boardupdate(Model model, int tbseq) {
			logger.info("Welcome boardupdate!");
			
			model.addAttribute("tseq",boardService.getBoard(tbseq).getTseq());
			TripBoard tb = boardService.getBoard(tbseq);

			model.addAttribute("board",tb);
			return "board_update.tiles";
		}//
		
		
		@RequestMapping(value = "boardupdateaf.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String boardupdateaf(TripBoard board, HttpServletRequest request, 
			@RequestParam(value = "fileload", required = false) MultipartFile fileload, Model model) {

			logger.info("Welcome boardwriteaf!");
			
			board.setFilename(fileload.getOriginalFilename());
			String fupload = request.getServletContext().getRealPath("/webimage");
			String f = board.getFilename();

			String newFile = FUpUtil.getNewFile(f);
			board.setFilename(newFile);
			try {
				File file = new File(fupload + "/" + newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				
				boardService.updateBoard(board);
				model.addAttribute("board", boardService);
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
			
			return "redirect:/boarddetail.do?tbseq="+board.getTbseq();
		}//


}
