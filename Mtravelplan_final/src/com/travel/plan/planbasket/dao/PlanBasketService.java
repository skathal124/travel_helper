package com.travel.plan.planbasket.dao;

import java.util.List;

import com.travel.plan.planbasket.model.PlanBasket;

public interface PlanBasketService {
	
	void insertbasket(PlanBasket basket);
	
	// 나중을 위해, id로 경로 바구니 select
	List<PlanBasket> getPlanBasket(String id);

	int getrecentPlanseq(String id);
	
	void deletePlanBasket(int planseq);
	
}
