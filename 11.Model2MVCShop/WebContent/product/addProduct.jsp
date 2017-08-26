<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!--  ///////////////////////// Bootstrap, jQuery CDN(Content Delivery Network) ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>	
    
    <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//==========//
		$(function(){
			
			//==> DOM Object GET 3������� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3�� ��� ���� : $("tagName.className:filter�Լ�") ���
			$("button.btn.btn-primary:contains('Ȯ��')").on("click", function(){
				//Debug..
				//alert( $( "td.ct_btn01:contains('Ȯ��')").html());
				self.location="/product/listProduct?menu=manage";
			});
			
			//==> DOM Object GET 3������� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3�� ��� ���� : $("tagName.className:filter�Լ�") ���
			$("button.btn.btn-primary:contains('�߰����')").on("click", function(){
				//Debug..
				//alert( $( "td.ct_btn01:contains('�߰����')").html());
				self.location="../product/addProductView.jsp";
			});
		});
	
	</script>

</head>


<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
   	<div class="container">
   	
   		<div class="page-header text-center">
   			<h3 class="text-info">��ǰ��ϿϷ�</h3>
   			<h5 class="text-muted">��ǰ����� �Ϸ�Ǿ����ϴ�.</h5>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodName }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
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
   			<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
   			<div class="col-xs-8 col-md-4">
   				<img src="${product.fileName }"/>
   			</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<button type="button" class="btn pull-right btn-primary">Ȯ��</button>
   			<button type="button" class="btn pull-right btn-primary">�߰����</button>
   		</div>
   		
   	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

</body>

</html>
