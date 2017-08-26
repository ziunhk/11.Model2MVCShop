<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- CDN ������� �ʿ�������ѵ�...
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//Event �ɾ��ֱ�
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "button.btn.btn-primary:contains('Ȯ��')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
			 self.location = "/product/listProduct?menu=manage"
		});
		
		 $( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			self.location = "/product/updateProduct?prodNo=${product.prodNo}"
		});
		 
		 $( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}";
		});
		 
		 $( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			history.go(-1);
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
   			<h3 class="text-info">��ǰ���� ����ȸ</h3>
   			<h5 class="text-muted">��ǰ ������ <strong class="text-danger">�׻� �ֽ������� ����</strong>�ٶ��ϴ�.</h5>
   		</div>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodNo }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodName }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2" style="height:300px;text-align:left;line-height:300px;"><strong>��ǰ�̹���</strong></div>
   			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName }" width="300"></div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodDetail }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
   			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�� ��</strong></div>
   			<div class="col-xs-8 col-md-4">${product.price }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
   			<div class="col-xs-8 col-md-4">${product.regDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
	   		<c:if test="${param.menu == 'manage' }">
	   			<center><button type="button" class="btn btn-primary">Ȯ��</button></center>
	   		</c:if>
	   		
	   		<c:if test="${param.menu == 'search' }">
	   			<center>
		   			<button type="button" class="btn pull-center btn-primary">����</button>
		   			<button type="button" class="btn pull-center btn-primary">����</button>
	   			</center>
			</c:if>
   	   	</div>
   	   	
   	</div>
   	<!-- ȭ�鱸�� div End -->

</body>

</html>