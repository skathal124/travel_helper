package com.travel.plan.planbasket.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.planbasket.model.PlanBasket;

@Service
public class PlanBasketServiceImpl implements PlanBasketService {

	@Autowired
	private PlanBasketDao planBasketDao;
	
	@Override
	@Transactional
	public void insertbasket(PlanBasket basket) {
		planBasketDao.insertbasket(basket);
	}

	@Override
	@Transactional (readOnly=true)
	public List<PlanBasket> getPlanBasket(String id) {
		return planBasketDao.getPlanBasket(id);
	}

	@Override
	@Transactional (readOnly=true)
	public int getrecentPlanseq(String id) {
		return planBasketDao.getrecentPlanseq(id);
	}

	@Override
	public void deletePlanBasket(int planseq) {
		planBasketDao.deletePlanBasket(planseq);
	}

}
