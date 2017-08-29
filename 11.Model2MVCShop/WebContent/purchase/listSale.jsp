<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<title>���� �����ȸ</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetUserList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	//====================================//
	//==> �߰��� �κ� : "�˻�", prodName link Event ���� �� ó��
	$(function(){
		
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2. $(#id) : 3.$(.className)
		//==> 1�� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.
		$("td.ct_btn01:contains('�˻�')").on("click", function(){
			
			//Debug..
			//alert($("td.ct_btn01:contains('�˻�')")).html();
			fncGetUserList(1);
		});
		
		
		//==> userId LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> tranNo LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:contains(${i})" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> UI ���� �߰��κ�  :  prodName LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$( ".ct_list_pop td:nth-child(4)" ).css("color" , "blue");
		$( ".ct_list_pop td:nth-child(5)" ).css("color" , "green");
		$("h7").css("color" , "red");
		
		
		//==> �Ʒ��� ���� ������ ������ ??
		//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
		$("td.ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		
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
			<h3>�ǸſϷ��ǰ</h3>
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
					<th align="left">���Ź�ȣ</th>
					<th align="left">��ǰ��</th>
					<th align="left">ȸ��ID</th>
					<th align="left">�����ڸ�</th>
					<th align="left">��ȭ��ȣ</th>
					<th align="left">�����Ȳ</th>
				</tr>
			</thead>
		
		
			<tbody>
		
				<c:set var="i" value="0"/>
				<c:forEach var="purchase" items="${list }">
					<c:set var="i" value="${i+1 }"/>
					<tr class="ct_list_pop">
							<td align="center">
								${i }
								<span style="display: none" class="hidden_link">/purchase/getPurchase?tranNo=${purchase.tranNo }</span>
							</td>
							<td align="left">
								${purchase.tranNo }
							</td>
							<td align="left">
								${purchase.purchaseProd.prodName }
							</td>
							<td align="left">
								${purchase.buyer.userId}
								<span style="display: none" class="hidden_link">/user/getUser?userId=${purchase.buyer.userId }&menu=${param.menu }</span>
							</td>
							<td align="left">
								${purchase.receiverName}
							</td>
							<td align="left">
								${purchase.receiverPhone}
							</td>
							<c:if test="${purchase.tranCode == '1  '}">
								<td align="left">���ſϷ�Ǿ����ϴ�.(�����)</td>
							</c:if>
							<c:if test="${purchase.tranCode == '2  '}">
								<td align="left">������Դϴ�.</td>
							</c:if>
							<c:if test="${purchase.tranCode == '3  '}">
								<td align="left">��ۿϷ�Ǿ����ϴ�.</td>
							</c:if>
					</tr>
				</c:forEach>
		
			</tbody>
		
		</table>
	
	</div>
	<!-- ȭ�鱸�� div End -->
	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->


</body>

</html>