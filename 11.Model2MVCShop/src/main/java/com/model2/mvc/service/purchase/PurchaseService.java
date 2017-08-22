package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

/*
 * ���Ű����� �߻�ȭ ĸ��ȭ�� PurchaseService Interface (TTL : 7EA)
 */
///Method TTL : 7EA
public interface PurchaseService {

	// ���� �߰�
	public void addPurchase(Purchase purchase) throws Exception;
	
	// ������ item tranNo�� ã��
	public Purchase getPurchase(int tranNo) throws Exception;
	
	// ������ item prodNo�� ã��
	public Purchase getPurchase2(int prodNo) throws Exception;

	// ������ item ���� ���� ����
	public void updatePurchase(Purchase purchase) throws Exception;
	
	// ������ item�� ���ſϷ� -> ����� -> ��ۿϷ� ����
	public void updateTranCode(Purchase purchase) throws Exception;
	
	// ���� item ���
	public Map<String,Object> getPurchaseList(Search search) throws Exception;
	
	// �̰� ���� �𸣰ڴ�.
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	
}