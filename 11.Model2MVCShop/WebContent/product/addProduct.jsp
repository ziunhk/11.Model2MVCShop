<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
			
			//==> DOM Object GET 3가지방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3의 방법 조합 : $("tagName.className:filter함수") 사용
			$("button.btn.btn-primary:contains('확인')").on("click", function(){
				//Debug..
				//alert( $( "td.ct_btn01:contains('확인')").html());
				self.location="/product/listProduct?menu=manage";
			});
			
			//==> DOM Object GET 3가지방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3의 방법 조합 : $("tagName.className:filter함수") 사용
			$("button.btn.btn-primary:contains('추가등록')").on("click", function(){
				//Debug..
				//alert( $( "td.ct_btn01:contains('추가등록')").html());
				self.location="../product/addProductView.jsp";
			});
		});
	
	</script>

</head>


<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
   	<div class="container">
   	
   		<div class="page-header text-center">
   			<h3 class="text-info">상품등록완료</h3>
   			<h5 class="text-muted">상품등록이 완료되었습니다.</h5>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
   			<div class="col-xs-8 col-md-4">${product.prodName }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>상품상세</strong></div>
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
   			<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
   			<div class="col-xs-8 col-md-4">
   				<img src="${product.fileName }"/>
   			</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<button type="button" class="btn pull-right btn-primary">확인</button>
   			<button type="button" class="btn pull-right btn-primary">추가등록</button>
   		</div>
   		
   	</div>
	<!--  화면구성 div End /////////////////////////////////////-->

</body>

</html>
