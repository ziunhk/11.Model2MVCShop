package com.model2.mvc.web.purchase;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

//==>판매관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
			
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception{
		
		System.out.println("/purchase/json/getPurchase : GET");
		
		//Business Logic
		return purchaseService.getPurchase(tranNo);
	}
	
	
	//@RequestMapping("/addPurchase")
	@RequestMapping(value="json/addPurchase", method=RequestMethod.POST)
	public Purchase addPurchase( @RequestBody Purchase purchase, 
												Model model) throws Exception {

		System.out.println("/purchase/addPurchase");
		
		//Business Logic
		String buyerId = purchase.getBuyer().getUserId();
		int prodNo = purchase.getPurchaseProd().getProdNo();
		
		User buyer = userService.getUser(buyerId);
		purchase.setBuyer(buyer);
		Product purchaseProd = productService.getProduct(prodNo);
		purchase.setPurchaseProd(purchaseProd);
		purchase.setTranCode("1");
//		purchase.setDivyDate(purchase.getDivyDate().substring(0, 10).replaceAll("-", "")); SQL Exception literal error 발생
		System.out.println("\n\n\ndebugging\n\n\n");
		
		System.out.println("\n\npurchase :: \n\n"+purchase);
			
		model.addAttribute("purchase", purchase);

		purchaseService.addPurchase(purchase);

		return purchase;
	}
	
	//여기서부터 수정
	@RequestMapping(value = "json/updatePurchase", method = RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase)throws Exception{
		
		System.out.println("/purchase/updatePurchase");
		System.out.println("purchase :: "+purchase);
		
		//Business Logic
		//purchase.setDivyDate(purchase.getDivyDate().replace("-", "")); 
		purchaseService.updatePurchase(purchase);
		Purchase toBePurchase = purchaseService.getPurchase(purchase.getTranNo());
		
		return toBePurchase;
	}
	
	
	@RequestMapping(value ="json/listPurchase", method = RequestMethod.POST)
	public Map listPurchase(@RequestBody Search search) throws Exception{
				
		System.out.println("/purchase/listPurchase");
		
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//Business Logic
		Map<String, Object> map = purchaseService.getPurchaseList(search);
		System.out.println("listPurchase map :: "+map);
		//resultpage를 map에 넣어주면...
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//map.put("resultPage", resultPage);
		System.out.println("\n\n\nlistPurchase resultPage :: \n"+resultPage+"\n\n\n");
		System.out.println("\n\n\nlistPurchase map :: \n"+map.toString()+"\n\n\n");
		
		return map;
		
	}
	

}
