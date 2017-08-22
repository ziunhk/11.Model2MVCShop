package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

//==> ���Ű������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
///Method TTL : 6EA
public interface PurchaseDao {

	// item ���� �߰�
	public void addPurchase(Purchase purchase) throws Exception; 
	
	// ������ item ã�� by tranNo
	public Purchase getPurchase(int tranNo) throws Exception;
	
	// ������ item ã�� by prodNo
	public Purchase getPurchase2(int prodNo) throws Exception;
	
	// ������ item ���� ���� ����
	public void updatePurchase(Purchase purchase) throws Exception;
	
	// ���ſϷ� -> ����� -> ��ۿϷ� ����
	public void updateTranCode(Purchase purchase) throws Exception;

	// ���� item ��� 
	public List<Purchase> getPurchaseList(Search search) throws Exception;
	
	// �Խ��� ó��
	public int getTotalCount(Search search) throws Exception;
	
	// �̰ǹ��� : Ȥ�ø𸣴�...
	public Map<String, Object> getSaleList(Search search) throws Exception;
		
}
