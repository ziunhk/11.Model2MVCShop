package com.model2.mvc.service.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

/*
 * 구매관리를 추상화 캡슐화한 PurchaseService Interface (TTL : 7EA)
 */
///Method TTL : 7EA
public interface PurchaseService {

	// 구매 추가
	public void addPurchase(Purchase purchase) throws Exception;
	
	// 구매한 item tranNo로 찾기
	public Purchase getPurchase(int tranNo) throws Exception;
	
	// 구매한 item prodNo로 찾기
	public Purchase getPurchase2(int prodNo) throws Exception;

	// 구매한 item 관련 정보 수정
	public void updatePurchase(Purchase purchase) throws Exception;
	
	// 구매한 item의 구매완료 -> 배송중 -> 배송완료 수정
	public void updateTranCode(Purchase purchase) throws Exception;
	
	// 구매 item 목록
	public Map<String,Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	// 판매완료된 item 목록 : only for 'admin'
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	
}