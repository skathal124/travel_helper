package com.travel.plan.basketdaily.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.plan.basketdaily.model.BasketDaily;

@Service
public class BasketDailyServiceImpl implements BasketDailyService {

	@Autowired 
	private BasketDailyDao basketDailyDao;
	
	@Override
	@Transactional
	public void insertBasketDaily(BasketDaily daily) {
		basketDailyDao.insertBasketDaily(daily);
	}

	@Override
	@Transactional (readOnly=true)
	public List<BasketDaily> getBasketDaily(int planseq) {
		return basketDailyDao.getBasketDaily(planseq);
	}

	@Override
	public void deleteBasketDaily(int planseq) {
		basketDailyDao.deleteBasketDaily(planseq);
	}

}
