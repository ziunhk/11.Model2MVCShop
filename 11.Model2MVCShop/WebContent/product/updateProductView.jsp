<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.model2.mvc.service.domain.*" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	function fncUpdateProduct(){
		
		//Form 유효성 검증
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
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(prodDetail == null || prodDetail.length<1){
			alert(prodDetail);
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
			
		//document.detailForm.action='/product/updateProduct';
		//document.detailForm.submit();
		$('form').attr("method", "POST").attr("action", "/product/updateProduct").submit();
	}
	//====================================//
	
	//==> 추가된 부분 : "수정" Event 연결??
	$(function(){
		//==>DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1과 3 방법 조합 : $("tagName.className : filter함수") 사용함.
		$("button.btn.btn-primary").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('수정')").html());
			fncUpdateProduct();
		});
		
		$("a[href='#']").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('취소')").html());
			javascript:history.go(-1);
		});
		
	});
	
	</script>


</head>

<body>

	<!-- ToolBar Start ////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!-- 화면구성 div Start -->
	<div class="container">
	
		<div class="page-header text-center">
			<h3 class="text-info">상품정보수정</h3>
			<h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리 </strong>해 주세요.</h5>
		</div>
		
		<!-- form Start -->
		<form class="form-horizontal" method="post" name="detailForm" enctype="multipart/form-data">
		<input type="hidden" name="prodNo" value="${product.prodNo }"/>
		<input type="hidden" name="menu" value="${param.menu }"/>
			
			<div class="form-group">
				<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" placeholder="중복확인?" readonly>
						<span id="helpBlock" class="help-block">
							<strong class="text-danger">수정불가, 보기만하렴</strong>
						</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" placeholder="변경상품명">
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" placeholder="변경상품상세">
				</div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" placeholder="변경제조일자">
						<img src="../images/ct_icon_date.gif" width="20" height="20" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" value="${product.price }" placeholder="변경할가격">
				</div>
			</div>
			
			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="toUploadFileName" name="toUploadFileName">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-primary">수정</button>
					<a class="btn btn-primary btn" href="#" role="button">취소</a>
				</div>
			</div>
			
		</form>
		<!-- form End -->
		
	</div>
	<!-- 화면구성 div End -->


</body>

</html>