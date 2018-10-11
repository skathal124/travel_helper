package com.travel.plan.tripboard.album.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;

@Repository
public class AlbumDaoImpl implements AlbumDao {

	String ns = "TripAlbum.";
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void downloadCount(int seq) {
		sqlSession.update(ns+"downloadCount",seq);
	}

	@Override
	public TripAlbum getPhotoBySeq(int seq) {
		return sqlSession.selectOne(ns+"getPhotoBySeq",seq);
	}

	@Override
	public void deletePhotoBySeq(int seq) {
		sqlSession.delete(ns+"deletePhotoBySeq",seq);
		
	}

	@Override
	public void updateGroupPhoto(TripAlbum talbum) {
		sqlSession.update(ns+"updateGroupPhoto",talbum);
	}

	@Override
	public String getFileName(int seq) {
		return sqlSession.selectOne(ns+"getFileName",seq);
	}
	@Override
	public void uploadGroupPhoto(TripAlbum tAlbum) {
		sqlSession.insert(ns+"uploadGroupPhoto",tAlbum);
	}

	@Override
	public List<TripAlbum> getPhotoByTseq(int tseq) {
		return sqlSession.selectList(ns+"getPhotoByTseq",tseq);
	}
}
