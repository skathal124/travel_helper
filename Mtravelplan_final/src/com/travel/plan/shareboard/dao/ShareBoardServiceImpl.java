package com.travel.plan.shareboard.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.plan.shareboard.model.ShareBoard;

@Service
public class ShareBoardServiceImpl implements ShareBoardService {

	@Autowired
	private ShareBoardDao shareBoardDao;

	@Override
	public void insertShareBoard(ShareBoard shareboard) {
		shareBoardDao.insertShareBoard(shareboard);
	}

	@Override
	public List<ShareBoard> getShareBoardList() {
		return shareBoardDao.getShareBoardList();
	}

	@Override
	public int checkshare(int tseq) {
		return shareBoardDao.checkshare(tseq);
	}

	@Override
	public void updatetotallike(int tseq) {
		shareBoardDao.updatetotallike(tseq);
	}

	@Override
	public void deleteshareboard(int sbseq) {
		shareBoardDao.deleteshareboard(sbseq);
	}

	@Override
	public void deleteshareboardtseq(int tseq) {
		shareBoardDao.deleteshareboardtseq(tseq);
	}

	
}
