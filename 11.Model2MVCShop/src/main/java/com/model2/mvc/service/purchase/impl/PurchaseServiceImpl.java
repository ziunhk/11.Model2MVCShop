package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	///Field
	@Autowired
	@Qualifier("purchaseDaoImpl")
	PurchaseDao purchaseDao;
	
	///Constructor
		public PurchaseServiceImpl(){
			System.out.println(this.getClass());
		}
	
	public void setPurchaseDao(PurchaseDao purchaseDao){
		System.out.println();
	}

	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.getPurchase(tranNo);
	}

	public Purchase getPurchase2(int prodNo) throws Exception {
		return purchaseDao.getPurchase2(prodNo);
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}

	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);
	}

	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		
		Map<String, Object> map = purchaseDao.getPurchaseList(search, buyerId); // purchase ��ü�� element�� �޴� list ����
		int totalCount = purchaseDao.getTotalCount(search); // totalCount�� getTotalCount method�� �̿��Ͽ� return �� ���� ����
		
		map.put("totalCount", new Integer(totalCount));
		map.put("buyerId", buyerId);
		
		return map;
	}
	
	public Map<String, Object> getSaleList(Search search) throws Exception {
		
		List<Purchase> list = purchaseDao.getSaleList(search);
		int totalCount = purchaseDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
