package com.travel.plan.tripboard.board.dao;

import java.util.List;

import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;

public interface BoardService {

	void writeBoard(TripBoard tboard);
	List<TripBoard> getBoardList(int tseq);
	TripBoard getBoard(int tbseq);
	void writeBoardReply(TripBoardReply tbbreply);
	List<TripBoardReply> getBoardReplyList(int tbseq);
	void updateReplyCount(int tbseq);
	void boardReadCount(int tbseq);
	void deleteBoard(int tbseq);
	void deleteBoardReply(int tbseq);
	void updateBoard(TripBoard tboard);

}
