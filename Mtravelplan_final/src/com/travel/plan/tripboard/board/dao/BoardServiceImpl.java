package com.travel.plan.tripboard.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.travel.plan.tripboard.help.TripParam;
import com.travel.plan.tripboard.model.TripAlbum;
import com.travel.plan.tripboard.model.TripBoard;
import com.travel.plan.tripboard.model.TripBoardReply;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	
	@Override
	@Transactional
	public void writeBoard(TripBoard mboard) {
		boardDao.writeBoard(mboard);
	}

	@Override
	@Transactional(readOnly=true)
	public List<TripBoard> getBoardList(int tseq) {
		return boardDao.getBoardList(tseq);
	}

	@Override
	@Transactional(readOnly=true)
	public TripBoard getBoard(int tbseq) {
		return boardDao.getBoard(tbseq);
	}

	@Override
	public void writeBoardReply(TripBoardReply tbbreply) {
		boardDao.writeBoardReply(tbbreply);
	}

	@Override
	public List<TripBoardReply> getBoardReplyList(int tbseq) {
		return boardDao.getBoardReplyList(tbseq);
	}

	@Override
	public void updateReplyCount(int tbseq) {
		boardDao.updateReplyCount(tbseq);
	}

	@Override
	public void boardReadCount(int tbseq) {
		boardDao.boardReadCount(tbseq);
	}

	@Override
	public void deleteBoard(int tbseq) {
		boardDao.deleteBoard(tbseq);
	}

	@Override
	public void deleteBoardReply(int tbseq) {
		boardDao.deleteBoardReply(tbseq);
	}

	@Override
	public void updateBoard(TripBoard tboard) {
		boardDao.updateBoard(tboard);
	}


}
