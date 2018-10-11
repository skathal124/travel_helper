package com.travel.plan.tripboard.album.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	private AlbumDao boardDao;

	
	@Override
	public void downloadCount(int seq) {
		boardDao.downloadCount(seq);
	}

	@Override
	public TripAlbum getPhotoBySeq(int seq) {
		return boardDao.getPhotoBySeq(seq);
	}

	@Override
	public void deletePhotoBySeq(int seq) {
		boardDao.deletePhotoBySeq(seq);
	}

	@Override
	public void updateGroupPhoto(TripAlbum talbum) {
		boardDao.updateGroupPhoto(talbum);
	}

	@Override
	public String getFileName(int seq) {
		return boardDao.getFileName(seq);
	}
	
	@Override
	public void uploadGroupPhoto(TripAlbum tAlbum) {
		boardDao.uploadGroupPhoto(tAlbum);
	}

	@Override
	public List<TripAlbum> getPhotoByTseq(int tseq) {
		return (List<TripAlbum>) boardDao.getPhotoByTseq(tseq);
	}

}
