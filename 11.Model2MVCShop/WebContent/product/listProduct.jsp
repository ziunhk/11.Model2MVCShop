<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- �̰� �ʿ������...CDN ���....
	<link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	
	<!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	 
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	<!--  // �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScript �̿� --> 
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
	   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	
	//=====> "�˻�", prodName link Event ���� �� ó��
	$(function(){
		
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2. $(#id) : 3.$(.className)
		//==> 1�� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.
		$("button.btn.btn-default").on("click", function(){
			//Debug..
			//alert($("button.btn.btn-default")).html();
			fncGetUserList(1);
		});
		
		
		//==> prodName LINK : mouserover Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( "td:nth-child(2)" ).on("mouseover", function(){
			
			var prodNo = $("input:hidden[name='prodNo']", $(this)).val();
			//alert("prodNo :: "+prodNo);
			
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData.fileName : \n"+JSONData);
							
							var displayValue = "<h5>"
														+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
														+"<div style='width: 200px; height: 200px; overflow: hidden'>"
														+"<img src='../images/uploadFiles/"+JSONData.fileName+"' style='max-width: 100%; height: auto'><br/>"
														+"</div>"
														+"</h5>";
							//Debug...	
							//alert(displayValue);
							$("h5").remove();
							$( "#"+prodNo+"" ).html(displayValue);
							
						}			
				});
		});
		
		
		//==> prodName LINK : Click Event ����ó��
		$( "td:nth-child(2)" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		});
		
		
		//==> updateTranCode LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( "td:contains('����ϱ�')" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> UI ���� �߰��κ�  :  prodName LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
		$("h7").css("color" , "red");
		$( ".ct_list_pop td:nth-child(7)" ).css("color" , "blue");
		
		//==> �Ʒ��� ���� ������ ������ ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		
	});
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!-- ȭ�鱸�� div Start -->
   	<div class="container">
   	
   		
   		
   		<div class="page-header text-info">
   			<h3>��ǰ�����ȸ</h3>
   		</div>
   		
   		<!--  table ���� �˻� Start -->
   		<div class="row">
   		
   			<div class="col-md-6 text-left">
   				<p class="text-primary">
   					��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
   				</p>
   			</div>
   			
   			<div class="col-md-6 text-right">
   				<form class="form-inline" name="detailForm">
   					<input name="menu" value="${param.menu }" type="hidden"/>
   					<div class="form-group">
   						<select class="form-control" name="searchCondition">
   							<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰNO</option>
   							<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
   						</select>
   					</div>
   					
   					<div class="form-group">
   						<label class="sr-only" for="searchKeyword">�˻���</label>
   						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���" 
   								value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
   					</div>
   					
   					<button type="button" class="btn btn-default">�˻�</button>
   					
   					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
   					<input type="hidden" id="currentPage" name="currentPage" value=""/>
   				
   				</form>
   			</div>
   		
   		</div>
   		<!--  table ���� �˻� End -->
   		
   		
   		<!-- table Start -->
   		<table class="table table-hover table-striped">
   		
   			<thead>
   				<tr>
   					<th align="center">NO</th>
   					<th align="left">
   						��ǰ��
   						<c:if test="${param.menu=='manage' }">
   							<h7>(prodName click:��ǰ����)</h7>
   						</c:if>
   						<c:if test="${param.menu=='search' }">
   							<h7>(prodName click:��ǰ��)</h7>
   						</c:if>
   					</th>
   					<th align="left">����</th>
   					<th align="left">�����</th>
   					<th align="left">�������(�����)</th>
   				</tr>
   			</thead>
   			
   			<tbody>
   			
   				<c:set var="i" value="0"/>
   				<c:forEach var="product" items="${list }">
   					<c:set var="i" value="${i+1 }"/>
   					<tr class="ct_list_pop">
   						<td align="center">${i }</td>
   							<td align="left">
	   							${product.prodName }
								<input type="hidden" name="prodNo" value=${product.prodNo }>
		   						<c:if test="${param.menu=='manage' }">
   									<span style="display: none" class="hidden_link">/product/updateProductView?prodNo=${product.prodNo }&menu=${param.menu }</span>
   								</c:if>
		   						<c:if test="${param.menu=='search' }">
		   							<span style="display: none" class="hidden_link">/product/getProduct?prodNo=${product.prodNo }&menu=${param.menu }</span>
		   						</c:if>
	   						</td>
   						<td align="left">${product.price }</td>
   						<td align="left">${product.regDate }</td>
   						<td></td>
   						<c:if test="${product.proTranCode == null}">
	   						<td align="left">
	   							�Ǹ���
	   						</td>
	   					</c:if>
	   					<c:if test="${product.proTranCode == '1  '}">
	   						<td align="left">
	   							���ſϷ�
	   							<c:if test="${param.menu=='manage' }">
	   								����ϱ�
	   								<span style="display: none" class="hidden_link">/purchase/updateTranCode?prodNo=${product.prodNo }&tranCode=2</span>
	   							</c:if>
	   						</td>
	   					</c:if>
	   					<c:if test="${product.proTranCode == '2  '}">
	   						<td align="left">
	   							�����
	   						</td>
	   					</c:if>
	   					<c:if test="${product.proTranCode == '3  '}">
	   						<td align="left">
	   							��ۿϷ�
	   						</td>
	   					</c:if>
	   					<td align="left">
							<div id= "${product.prodNo}">�̸�����</div>
							<input type="hidden" value="${product.prodNo}">
						</td>
	   				</tr>
   				</c:forEach>
   			
   			</tbody>
   			
   		</table>
   		<!-- table End -->
   	
   	</div>
   	<!-- ȭ�鱸�� div End -->
   	
   	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>

</html>