package com.travel.plan.shareboard.dao;

import java.util.List;

import com.travel.plan.shareboard.model.ShareBoard;

public interface ShareBoardService {
	
	void insertShareBoard(ShareBoard shareboard);
	
	List<ShareBoard> getShareBoardList();
	
	int checkshare(int tseq);
	
	void updatetotallike(int tseq);
	
	void deleteshareboard(int sbseq);
	
	void deleteshareboardtseq(int tseq);
}
