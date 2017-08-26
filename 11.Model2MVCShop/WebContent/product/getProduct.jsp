<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- CDN 사용으로 필요없을듯한데...
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
	
	//Event 걸어주기
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			 self.location = "/product/listProduct?menu=manage"
		});
		
		 $( "button.btn.btn-primary:contains('수정')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
			self.location = "/product/updateProduct?prodNo=${product.prodNo}"
		});
		 
		 $( "button.btn.btn-primary:contains('구매')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('구매')" ).html() );
				self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}";
		});
		 
		 $( "button.btn.btn-primary:contains('이전')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('이전')" ).html() );
			history.go(-1);
		});
		 
	});
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!-- 화면구성 div Start -->
   	<div class="container">
   	
   		<div class="page-header">
   			<h3 class="text-info">상품정보 상세조회</h3>
   			<h5 class="text-muted">상품 정보를 <strong class="text-danger">항상 최신정보로 관리</strong>바랍니다.</h5>
   		</div>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodNo }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodName }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2" style="height:300px;text-align:left;line-height:300px;"><strong>상품이미지</strong></div>
   			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName }" width="300"></div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodDetail }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
   			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>가 격</strong></div>
   			<div class="col-xs-8 col-md-4">${product.price }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
   			<div class="col-xs-8 col-md-4">${product.regDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
	   		<c:if test="${param.menu == 'manage' }">
	   			<center><button type="button" class="btn btn-primary">확인</button></center>
	   		</c:if>
	   		
	   		<c:if test="${param.menu == 'search' }">
	   			<center>
		   			<button type="button" class="btn pull-center btn-primary">구매</button>
		   			<button type="button" class="btn pull-center btn-primary">이전</button>
	   			</center>
			</c:if>
   	   	</div>
   	   	
   	</div>
   	<!-- 화면구성 div End -->

</body>

</html>