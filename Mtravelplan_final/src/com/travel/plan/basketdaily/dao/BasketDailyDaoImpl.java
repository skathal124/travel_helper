package com.travel.plan.basketdaily.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.basketdaily.model.BasketDaily;

@Repository
public class BasketDailyDaoImpl implements BasketDailyDao {

	String ns = "BasketDaily.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertBasketDaily(BasketDaily daily) {
		sqlSession.insert(ns+"insertBasketDaily", daily);
	}

	@Override
	public List<BasketDaily> getBasketDaily(int planseq) {
		return sqlSession.selectList(ns+"getBasketDaily", planseq);
	}

	@Override
	public void deleteBasketDaily(int planseq) {
		sqlSession.delete(ns+"deleteBasketDaily", planseq);
	}

}
