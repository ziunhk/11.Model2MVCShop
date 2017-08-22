package com.model2.mvc.service.purchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;


/*
 *	FileName :  PurchaseServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
															"classpath:config/context-aspect.xml",
															"classpath:config/context-mybatis.xml",
															"classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	//@Test
	public void testAddPurchase() throws Exception {

		Purchase purchase = new Purchase();

		// product number�� ���, �ٷ� purchase ��ü�� �Է��� �Ұ��Ͽ� product ��ü�� �����ϰ� �Է������Ŀ� �� (product) ��ü�� �����´�.
		Product product = new Product(); 
		product.setProdNo(10005);
		purchase.setPurchaseProd(product);

		User buyer = new User();
		buyer.setUserId("user08");
		purchase.setBuyer(buyer);

		purchase.setPaymentOption("2  ");
		purchase.setReceiverName("testRecvName");
		purchase.setReceiverPhone("11111");
		purchase.setDivyAddr("testAddr");
		purchase.setDivyRequest("testDlvyReq");
		purchase.setTranCode("1");
		purchase.setDivyDate("20170811");

		purchaseService.addPurchase(purchase);

//		purchase = purchaseService.getPurchase(10056); // DB�� ����Ǵ� tran_no Ȯ��
//
//		// ==> console Ȯ��
//		System.out.println(purchase);
//
//		// ==> API Ȯ��
//		// DB�� ����Ǵ� transaction table�� prod_no Ȯ��
//		Assert.assertEquals(10000, purchase.getPurchaseProd().getProdNo()); 
//		Assert.assertEquals("user08", purchase.getBuyer().getUserId());
//
//		Assert.assertEquals("2  ", purchase.getPaymentOption());
//		Assert.assertEquals("testRecvName", purchase.getReceiverName());
//		Assert.assertEquals("11111", purchase.getReceiverPhone());
//		Assert.assertEquals("testAddr", purchase.getDivyAddr());
//		Assert.assertEquals("testDlvyReq", purchase.getDivyRequest());
//		Assert.assertEquals("20170811", purchase.getDivyDate());
	}

	//@Test
	public void testGetPurchase() throws Exception {

		Purchase purchase = new Purchase();

		purchase = purchaseService.getPurchase(10080); // tranNo�� purchase ��ü �ҷ�����

		// ==> console Ȯ��
		System.out.println("13579inTestGetPurchase() :: "+purchase);

		// ==> API Ȯ��
		Assert.assertEquals(10005, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user08", purchase.getBuyer().getUserId());
		Assert.assertEquals("2  ", purchase.getPaymentOption());
		Assert.assertEquals("testRecvName", purchase.getReceiverName());
		Assert.assertEquals("11111", purchase.getReceiverPhone());
		Assert.assertEquals("testAddr", purchase.getDivyAddr());
		Assert.assertEquals("testDlvyReq", purchase.getDivyRequest());
		Assert.assertEquals("1  ", purchase.getTranCode());
		//Assert.assertEquals("17/08/11", purchase.getDivyDate());

	}

	//@Test
	public void testUpdatePurchase() throws Exception {

		// Purchase purchase = purchaseService.getPurchase();
		// parameter�� 1. tranNo�� ������ Ȥ�� 2. prodNo�� ������ ���� ����
		// 1.�� ��� ���� tranNo�� �˾ƾ� �Ѵ�.(tranNo �� ���� sequence number�� �ڵ����� �ԷµǱ� ������ DB�󿡼� ���� ã�Ƽ�...)
		// tranNo �Էµ� �� DB���� Ȯ���Ͽ� ���� �Է¿���
		
		Purchase purchase = null;
		purchase = purchaseService.getPurchase(10080);
		System.out.println("\n24inPurhaseServiceTest.java :: "+purchase);
		
		purchase.setPaymentOption("2");
		purchase.setReceiverName("chngRcvNm");
		purchase.setReceiverPhone("22222");
		purchase.setDivyAddr("chngAddr");
		purchase.setDivyRequest("chngRqst");
		purchase.setDivyDate("20170822");
		
		System.out.println("\n2468inPurhaseServiceTest.java :: "+purchase);

		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10080);
		Assert.assertNotNull(purchase);

		// ==> console Ȯ��
		System.out.println(purchase);

		// ==> API Ȯ�� parameter ( expected, actual )
		// �����Ŀ� �Էµ� ���� ��
		Assert.assertEquals("2  ", purchase.getPaymentOption());
		Assert.assertEquals("chngRcvNm", purchase.getReceiverName());
		Assert.assertEquals("22222", purchase.getReceiverPhone());
		Assert.assertEquals("chngAddr", purchase.getDivyAddr());
		Assert.assertEquals("chngRqst", purchase.getDivyRequest());
		Assert.assertEquals("2017-08-22", purchase.getDivyDate().split(" ")[0]); //split(" ")[0] ��� substring(0, 10)) ��밡��
	}

	//@Test
	public void testGetPurchaseListAll() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = purchaseService.getPurchaseList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// ==> console Ȯ��
		// System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		map = purchaseService.getPurchaseList(search);

		list = (List<Object>) map.get("list");
		System.out.println("list :: " + list);
		System.out.println("list.size() :: " + list.size());
		Assert.assertEquals(3, list.size());

		// ==> console Ȯ��
		System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
	}

	// @Test
	public void testGetPurchaseListByProdNo() throws Exception { // �̸��� �������

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("admin");
		Map<String, Object> map = purchaseService.getPurchaseList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(1, list.size());

		// ==> console Ȯ��
		// System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setSearchCondition("0");
		search.setSearchKeyword("" + System.currentTimeMillis());
		map = purchaseService.getPurchaseList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(0, list.size());

		// ==> console Ȯ��
		// System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
	}

	// @Test
	public void testGetPurchaseListByProductName() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		search.setSearchKeyword("SCOTT");
		Map<String, Object> map = purchaseService.getPurchaseList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// ==> console Ȯ��
		System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setSearchCondition("1");
		search.setSearchKeyword("" + System.currentTimeMillis());
		map = purchaseService.getPurchaseList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(0, list.size());

		// ==> console Ȯ��
		System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
	}
}