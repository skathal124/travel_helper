package com.travel.plan.tripboard.album.dao;

import java.util.List;

import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;

public interface AlbumDao {

	void downloadCount(int seq);
	void deletePhotoBySeq(int seq);
	TripAlbum getPhotoBySeq(int seq);
	void updateGroupPhoto(TripAlbum talbum);
	String getFileName(int seq);
	void uploadGroupPhoto(TripAlbum tAlbum);
	List<TripAlbum> getPhotoByTseq(int tseq);
	
}
