<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>���ſϷ�</title>
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN(Content Delivery Network) ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		$(function(){
			
			//==>"Ȯ��" Event ó�� �� ����
			//==>DOM Object GET 3���� ��� ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
			//==>1�� 3 ����� ���� : $("tagName.className:filter�Լ�") �����.
			$("button.btn.btn-primary:contains('Ȯ��')").on("click", function(){
				//Debug..
				//alert($("a[href='#']").html());
				self.location = "/product/listProduct?menu=search"
			});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!-- 
	<form name="addPurchase" action="/purchase/addPurchaseView?tranNo=${purchase.tranNo}" method="post">
 	 -->
 	 
 	 <!-- ȭ�鱸�� div Start -->
 	 <div class="container">
 	 
 	 	<div class="page-header">
 	 		<h3 class="text-info">���ſϷ�</h3>
 	 		<h5 class="text-muted">���Ű� �Ϸ�Ǿ����ϴ�.</h5>
 	 	</div>
 	 	
 	 	<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
   			<c:if test="${purchase.paymentOption == '1' }">
	   			<div class="col-xs-8 col-md-4">���ݱ���</div>
   			</c:if>
   			<c:if test="${purchase.paymentOption == '2' }">
   				<div class="col-xs-8 col-md-4">�ſ뱸��</div>
   			</c:if>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.receiverName }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyAddr }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row" align="center">
			<button type="button" class="btn btn-primary">Ȯ��</button>
   	   	</div>
 	 
 	 
 	 </div>
 	 <!-- ȭ�鱸�� div End -->
 
	<!-- </form> -->

</body>
</html>