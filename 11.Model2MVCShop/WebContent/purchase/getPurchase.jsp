<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

<head>
	
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	 -->
	 
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
	 
	 <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			$( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				//self.location = "/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
				self.location=$('.hidden_link', $(this)).text();
				
			});
			
			$( "button.btn.btn-primary:contains('Ȯ��')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
				self.location = "/purchase/listPurchase";
			});
		});
		
	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!-- ȭ�鱸�� div Start -->
   	<div class="container">
   	
   		<div class="page-header">
   			<h3 class="text-info">�������� ����ȸ</h3>
   			<h5 class="text-muted">�������������� <strong class="text-danger">���������</strong> �����մϴ�.</h5>
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
   			<div class="col-xs-8 col-md-4">
   				<c:if test="${purchase.paymentOption == '1  '}">
   					���ݱ���
   				</c:if>
   				<c:if test="${purchase.paymentOption == '2  '}">
   					�ſ뱸��
   				</c:if>
   			</div>
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
   			<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�ֹ���</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.orderDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
	   		<button type="button" class="btn pull-center btn-primary">
	   			����
	   			<span style="display: none" class="hidden_link">/purchase/updatePurchaseView?tranNo=${purchase.tranNo}</span>
	   		</button>
		   	<button type="button" class="btn pull-center btn-primary">
		   		Ȯ��
		   	</button>
   	   	</div>
   	
   	</div>
	<!-- ȭ�鱸�� div End -->
</body>

</html>