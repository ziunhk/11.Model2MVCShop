package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

//==> ��ǰ�������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
///Method TTL : 5EA
public interface ProductDao { 
	
	// insert : ��ǰ���
	public void addProduct(Product product) throws Exception;
	
	// select one : ��ǰ 1���� ���� ��ǰ���� Ȯ��
	public Product getProduct(int prodNo) throws Exception;

	// select map? list? : ��ǰ ���� ����Ʈ
	public List<Product> getProductList(Search search) throws Exception;
	
	// update : ��ǰ ���� ����
	public void updateProduct(Product product) throws Exception;
	
	// �Խ��� ó��
	public int getTotalCount(Search search) throws Exception;

}
