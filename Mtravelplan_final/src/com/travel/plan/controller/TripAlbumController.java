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
import com.travel.plan.tripboard.album.dao.AlbumService;
import com.travel.plan.tripboard.board.dao.BoardService;
import com.travel.plan.tripboard.model.TripAlbum;

@Controller
public class TripAlbumController {
	

	   @Autowired
	   private AlbumService albumService;
	   
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
	

		
		 @RequestMapping(value = "tripPhoto.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String TripPhoto(HttpServletRequest request, Model model,int tseq) {
			   
				logger.info("Welcome TripController login! ");
				List<TripAlbum> albumlist = new ArrayList<TripAlbum>();
				albumlist = albumService.getPhotoByTseq(tseq);
				model.addAttribute("albumlist", albumlist);
				model.addAttribute("tseq", tseq);
				
				logger.info("-------------------- "+albumlist+"tseq:"+tseq);
				
				return "trip_photo.tiles";
			}//
		   
		   
		   
		   @RequestMapping(value = "photoWrite.do", 
				   method = {RequestMethod.GET,RequestMethod.POST})
			public String photoWrite(HttpServletRequest request, Model model,int tseq){
			  logger.info("Welcome TripController photoWrite! "+tseq);
			  model.addAttribute("tseq", tseq);
			  return "trip_photo_write.tiles";
			}
		   
					
					//String fupload = "c:\\upload";//상황에 따라 변경하도록 만들자.
			@RequestMapping(value = "photoWriteAf.do", 
					method = RequestMethod.POST)
			public String photoWriteAf(HttpServletRequest request, Model model,TripAlbum tAlbum,
					@RequestParam(value = "fileload", required = false) MultipartFile fileload){
				tAlbum.setFilename(fileload.getOriginalFilename());
				// 연습용 경로
							// String fupload = "C:\\Workspace\\travel\\travelplan0516\\WebContent\\webimage";
							String fupload = request.getServletContext().getRealPath("/webimage");
							String f = tAlbum.getFilename();
							String newFile = FUpUtil.getNewFile(f);
							tAlbum.setFilename(newFile);
							logger.info("-----------------------------------test "+tAlbum);
							try {
								File file = new File(fupload + "/" + newFile);
								FileUtils.writeByteArrayToFile(file, fileload.getBytes());
								albumService.uploadGroupPhoto(tAlbum);
								model.addAttribute("tseq", tAlbum.gettseq());
								logger.info("Welcome upload success! ");
							} catch (IOException e) {
								logger.info("Welcome upload fail! ");
							}
				return "redirect:/tripPhoto.do";
			}//
			
			@RequestMapping(value = "fileDownload.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String download(TripAlbum talbum,HttpServletRequest request,
					String filename, Model model) throws Exception {
				logger.info("----------------------------------download ");
				//String fupload = "c:\\upload\\";
				String fupload =
						request.getServletContext().getRealPath("/webimage");
				File downloadFile = new File(fupload +"/"+filename);
				
				model.addAttribute("downloadFile", downloadFile );
				model.addAttribute("seq", talbum.getSeq() );
				model.addAttribute("tseq", talbum.gettseq() );
				return "downloadView";
			}
			
			@RequestMapping(value = "deleteGroupPhoto.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String deleteGroupPhoto(TripAlbum talbum, Model model) {
				logger.info("Welcome TripController deltrip! "+ new Date());
				albumService.deletePhotoBySeq(talbum.getSeq());
				int tseq = talbum.gettseq();
				return "redirect:/tripPhoto.do?tseq="+tseq;
			}//
			
			@RequestMapping(value = "updateGroupPhoto.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String updatepage(int seq,int tseq,Model model) {
				TripAlbum talbum = new TripAlbum();
				talbum = albumService.getPhotoBySeq(seq);
				model.addAttribute("talbum",talbum);
				model.addAttribute("tseq",tseq);
				logger.info("--------updateGroupPhoto"+talbum+seq);
				return "updateGroupPhoto.tiles";
			}
			
			@RequestMapping(value = "updateGroupPhotoAf.do", method = RequestMethod.POST)
			public String updateGroupPhotoAf(TripAlbum talbum,HttpServletRequest request,
					@RequestParam(value="fileload", required=false) MultipartFile fileload, Model model) {
				
				talbum.setFilename(fileload.getOriginalFilename());
				int tseq = talbum.gettseq();
				logger.info("Welcome TripController updateGroupPhotoAf! "+ talbum);
				if(talbum.getFilename()==null || talbum.getFilename().equals("")){
					int seq1 = talbum.getSeq();
					talbum.setFilename(albumService.getFileName(seq1));
					albumService.updateGroupPhoto(talbum);
					model.addAttribute("tseq",tseq);
				}else{
					
					String fupload = request.getServletContext().getRealPath("/webimage");
					// String fupload = "C:\\Workspace\\travel\\travelplan05223som\\WebContent\\webimage";
					String f=talbum.getFilename();
					String newFile=FUpUtil.getNewFile(f);//이름+long+.접미사
					
					talbum.setFilename(newFile);//이름 변경
					try {
						File file=new File(fupload+"/"+newFile);
						//logger.info(fupload+"\\"+newFile);
						FileUtils.writeByteArrayToFile(file, fileload.getBytes());
						albumService.updateGroupPhoto(talbum);
						model.addAttribute("tseq",tseq);
					} catch (IOException e) {
						
					}
					
				}
				return "redirect:/tripPhoto.do?tseq="+tseq;
			}//
			
			
			@RequestMapping(value = "picture.do", method = {RequestMethod.GET,RequestMethod.POST})
			public String picture(String filename,Model model) {
				
				model.addAttribute("filename",filename);
				
				return "picture.tiles";
			}

}
