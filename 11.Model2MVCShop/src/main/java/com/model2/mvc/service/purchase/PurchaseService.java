package com.model2.mvc.service.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public Map<String,Object> getPurchaseList(Search search, String buyerId) throws Exception;
	
	// �ǸſϷ�� item ��� : only for 'admin'
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	
}