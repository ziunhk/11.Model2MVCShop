package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;



//==> ��ǰ���� Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
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
	
	
	@RequestMapping(value="addProductView", method=RequestMethod.POST)
	public ModelAndView addProductView() throws Exception {

		System.out.println("/product/addProductView");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/product/addProductView.jsp");
		
		return modelAndView;
	}
	
	
	//��������
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public ModelAndView addProduct( @ModelAttribute("product") Product product, 
														@RequestParam("toUploadFileName") final MultipartFile uploadFile) throws Exception {
		
		/*
		 * ,
		 * HttpServletRequest request,
		 * HttpServletResponse response 
		 * parameter���� ���ܽ�Ŵ
		 */

		System.out.println("/product/addProduct");
		
		//������ �־��� ��� ����
		String filePath = "C:\\Users\\Admin\\git\\09.Model2MVCShop(jQuery)\\"
								+ "09.Model2MVCShop(jQuery)\\WebContent\\images\\uploadFiles\\";
	
		//Business Logic �� Model(data) / View(jsp) ������ ���� ModelAndView ����
		product.setManuDate(product.getManuDate().replace("-", "")); //because of DB type or size...
		
		File file = new File(filePath+uploadFile.getOriginalFilename()); //���ο� ���ϰ�ο� �̸��� ����
		product.setFileName(uploadFile.getOriginalFilename()); // product��ü �̸� �����Ͽ� DB ���� ���� 
		uploadFile.transferTo(file);
		productService.addProduct(product);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(product);
		modelAndView.setViewName("/product/addProduct.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="getProduct", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo , 
														Model model ) throws Exception {
		
		System.out.println("/product/getProduct");
		
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("product", product);
		modelAndView.setViewName("/product/getProduct.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="updateProductView", method = RequestMethod.GET)
	public ModelAndView updateProductView( @RequestParam("prodNo") int prodNo , 
																	Model model ) throws Exception{

		System.out.println("/product/updateProductView");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		// Model �� View ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("product", product);
		modelAndView.setViewName("/product/updateProductView.jsp");
		
		return modelAndView; // �̰� Ȯ��
	}
	
	

	@RequestMapping(value="updateProduct", method = RequestMethod.POST)
	public ModelAndView updateProduct( @ModelAttribute("product") Product product, 
															@RequestParam("toUploadFileName") final MultipartFile uploadFile, 
															@RequestParam("menu") String menu) throws Exception{
		
		/*
		 * ,
		 * HttpServletRequest request,
		 * HttpServletResponse response 
		 * parameter���� ���ܽ�Ŵ
		 */
		
		System.out.println("/product/updateProduct");
		
		//������ ������ �־��� ��� ����
		String filePath = "C:\\Users\\Admin\\git\\09.Model2MVCShop(jQuery)\\"
								+ "09.Model2MVCShop(jQuery)\\WebContent\\images\\uploadFiles\\";
			
		//Business Logic ����
		product.setManuDate(product.getManuDate().replace("-", "")); //because of DB type or size...
		File file = new File(filePath+uploadFile.getOriginalFilename()); //���ο� ���ϰ�ο� �̸��� ����
		product.setFileName(uploadFile.getOriginalFilename()); // product��ü �̸� �����Ͽ� DB ���� ���� 
		uploadFile.transferTo(file);
		
		productService.updateProduct(product);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("menu", menu);
		modelAndView.setViewName("/product/getProduct");
		
		return modelAndView; 
	}
	
	
	@RequestMapping(value="listProduct")
	public ModelAndView listProduct( @ModelAttribute("search") Search search , 
														@ModelAttribute("product") Product product, 
														Model model , 
														HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		modelAndView.setViewName("/product/listProduct.jsp");
		
		return modelAndView;
	}
	
}