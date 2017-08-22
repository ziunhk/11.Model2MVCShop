package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

//==> ��ǰ���� RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method ���� ����

	public ProductRestController() {
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
	

	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/getProduct : GET");

		// Business Logic
		return productService.getProduct(prodNo);
	}

	@RequestMapping(value = "json/addProduct", method = RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception {

		//@ModelAttribute("product") Product product,

		System.out.println("/product/addProduct");

		//Business Logic
		product.setManuDate(product.getManuDate().replace("-", "")); // because of DB type or size...
		productService.addProduct(product);

		return product;
	}
	
	@RequestMapping(value="json/updateProductView", method = RequestMethod.GET)
	public Product updateProductView( @RequestParam("prodNo") int prodNo ) throws Exception{

		System.out.println("/product/updateProductView");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		return product; // �̰� Ȯ��
	}
	
	
	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception{
		
		System.out.println("/product/updateProduct");
		System.out.println("product :: "+product);
		
		//Business Logic
		product.setManuDate(product.getManuDate().replace("-", "")); //���� manuDate �Ⱦ���...
		productService.updateProduct(product);
		
		return product;
	}
	
	@RequestMapping(value ="json/listProduct", method = RequestMethod.POST)
	public Map listProduct(@RequestBody Search search) throws Exception{
				
		System.out.println("/product/listProduct");
		
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//Business Logic
		Map<String, Object> map = productService.getProductList(search);
		System.out.println("listProduct map :: "+map);
		//resultpage�� map�� �־��ָ�...
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//map.put("resultPage", resultPage);
		System.out.println("\n\n\nlistProduct resultPage :: \n"+resultPage+"\n\n\n");
		System.out.println("\n\n\nlistProduct map :: \n"+map.toString()+"\n\n\n");
		
		return map;
		
	}
	

}