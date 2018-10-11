package com.travel.plan.planbasket.dao;

import java.util.List;

import com.travel.plan.planbasket.model.PlanBasket;

public interface PlanBasketService {
	
	void insertbasket(PlanBasket basket);
	
	// ������ ����, id�� ��� �ٱ��� select
	List<PlanBasket> getPlanBasket(String id);

	int getrecentPlanseq(String id);
	
	void deletePlanBasket(int planseq);
	
}
