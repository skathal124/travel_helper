package com.travel.plan.planbasket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.plan.planbasket.model.PlanBasket;

@Repository
public class PlanBasketDaoImpl implements PlanBasketDao {

	String ns = "PlanBasket.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertbasket(PlanBasket basket) {
		sqlSession.insert(ns+"insertbasket", basket);
	}

	@Override
	public List<PlanBasket> getPlanBasket(String id) {
		return sqlSession.selectList(ns+"getPlanBasket", id);
	}

	@Override
	public int getrecentPlanseq(String id) {
		return sqlSession.selectOne(ns+"getrecentPlanseq", id);
	}

	@Override
	public void deletePlanBasket(int planseq) {
		sqlSession.delete(ns+"deletePlanBasket", planseq);
	}

}
