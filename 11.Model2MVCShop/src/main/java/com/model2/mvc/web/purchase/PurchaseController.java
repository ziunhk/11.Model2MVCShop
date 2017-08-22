package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;



//==> ȸ������ Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="addPurchaseView", method=RequestMethod.GET)
	public String addPurchaseView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("/purchase/addPurchaseView");
		
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product", product);

		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	
	//@RequestMapping("/addPurchase.do")
	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public String addPurchase( @ModelAttribute("purchase") Purchase purchase, 
											@RequestParam("prodNo") int prodNo, 
											@RequestParam("buyerId") String buyerId, 
											Model model) throws Exception {

		System.out.println("/purchase/addPurchase");
		
		//Business Logic
		Product purchaseProd = productService.getProduct(prodNo);
		User buyer = userService.getUser(buyerId);
		purchase.setBuyer(buyer);
		purchase.setPurchaseProd(purchaseProd);
		purchase.setTranCode("1");
		
		model.addAttribute("purchase", purchase);

//		model.addAttribute("buyer", buyer);
//		model.addAttribute("product", purchaseProd);

		purchaseService.addPurchase(purchase);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	
	//@RequestMapping("/getPurchase.do") //data type check
	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public String getPurchase( @RequestParam("tranNo") int tranNo , Model model ) throws Exception {
		
		System.out.println("/purchase/getPurchase");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchase.setDivyDate(purchase.getDivyDate().substring(0, 10));
		// Model �� View ����
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	//@RequestMapping("/getPurchase2.do") //data type check ���X
	@RequestMapping(value="getPurchase2", method=RequestMethod.GET)
	public String getPurchase2( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		
		System.out.println("/purchase/getPurchase2");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		// Model �� View ����
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	
	
	//@RequestMapping("/updatePurchaseView.do")
	//method �� POST �� ������� 405 err �߻� ��?
	@RequestMapping(value="updatePurchaseView", method={RequestMethod.GET, RequestMethod.POST}) 
	public String updatePurchaseView( @RequestParam("tranNo") int tranNo , Model model ) throws Exception{

		System.out.println("/purchase/updatePurchaseView");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchase.setDivyDate(purchase.getDivyDate().substring(0, 10).replaceAll("-", ""));
		// Model �� View ����
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
		
	
	
	//@RequestMapping("/updatePurchase.do") // '����' button ������, // ����.....�ߺ��ð�....
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST) //RequestMethod.GET
	public String updatePurchase( @ModelAttribute("purchase") Purchase purchase , Model model) throws Exception{

		System.out.println("purchase/updatePurchase");
		
		//Business Logic ����
		purchaseService.updatePurchase(purchase);
		
		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo(); 
	}
	
	
	//@RequestMapping("/updatePurchase.do") // '����' button ������, // ����.....�ߺ��ð�....
	@RequestMapping(value="updateTranCode", method=RequestMethod.GET)
	public String updateTranCode(@ModelAttribute("purchase") Purchase purchase, 
												@RequestParam("prodNo") int prodNo, 
												Model model) throws Exception{

		System.out.println("purchase/updateTranCode");
				
		//Business Logic ����
		model.addAttribute("menu", "manage");
		purchase = purchaseService.getPurchase2(prodNo);
		purchaseService.updateTranCode(purchase);
		
		return "redirect:/product/listProduct";
	}
		

	
	//@RequestMapping("/listPurchase.do")
	@RequestMapping(value="listPurchase")
	public String listPurchase( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/purchase/listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=purchaseService.getPurchaseList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
}