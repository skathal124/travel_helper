package com.travel.plan.basketdaily.dao;

import java.util.List;

import com.travel.plan.basketdaily.model.BasketDaily;

public interface BasketDailyService {
	
	void insertBasketDaily(BasketDaily daily);
	
	List<BasketDaily> getBasketDaily(int planseq);
	
	void deleteBasketDaily(int planseq);
}
