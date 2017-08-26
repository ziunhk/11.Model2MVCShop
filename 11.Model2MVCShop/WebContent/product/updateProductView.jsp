<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.model2.mvc.service.domain.*" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
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
	
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	function fncUpdateProduct(){
		
		//Form ��ȿ�� ����
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		var prodName=$("input[name='prodName']").val();
		var prodDetail=$("input[name='prodDetail']").val();
		var manuDate=$("input[name='manuDate']").val();
		var price=$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert(prodName);
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(prodDetail == null || prodDetail.length<1){
			alert(prodDetail);
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
			
		//document.detailForm.action='/product/updateProduct';
		//document.detailForm.submit();
		$('form').attr("method", "POST").attr("action", "/product/updateProduct").submit();
	}
	//====================================//
	
	//==> �߰��� �κ� : "����" Event ����??
	$(function(){
		//==>DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1�� 3 ��� ���� : $("tagName.className : filter�Լ�") �����.
		$("button.btn.btn-primary").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('����')").html());
			fncUpdateProduct();
		});
		
		$("a[href='#']").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('���')").html());
			javascript:history.go(-1);
		});
		
	});
	
	</script>


</head>

<body>

	<!-- ToolBar Start ////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!-- ȭ�鱸�� div Start -->
	<div class="container">
	
		<div class="page-header text-center">
			<h3 class="text-info">��ǰ��������</h3>
			<h5 class="text-muted">��ǰ ������ <strong class="text-danger">�ֽ������� ���� </strong>�� �ּ���.</h5>
		</div>
		
		<!-- form Start -->
		<form class="form-horizontal" method="post" name="detailForm" enctype="multipart/form-data">
		<input type="hidden" name="prodNo" value="${product.prodNo }"/>
		<input type="hidden" name="menu" value="${param.menu }"/>
			
			<div class="form-group">
				<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" placeholder="�ߺ�Ȯ��?" readonly>
						<span id="helpBlock" class="help-block">
							<strong class="text-danger">�����Ұ�, ���⸸�Ϸ�</strong>
						</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" placeholder="�����ǰ��">
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" placeholder="�����ǰ��">
				</div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" placeholder="������������">
						<img src="../images/ct_icon_date.gif" width="20" height="20" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" value="${product.price }" placeholder="�����Ұ���">
				</div>
			</div>
			
			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="toUploadFileName" name="toUploadFileName">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-primary">����</button>
					<a class="btn btn-primary btn" href="#" role="button">���</a>
				</div>
			</div>
			
		</form>
		<!-- form End -->
		
	</div>
	<!-- ȭ�鱸�� div End -->


</body>

</html>