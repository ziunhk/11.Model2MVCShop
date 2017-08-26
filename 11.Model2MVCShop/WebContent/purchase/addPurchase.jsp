<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>구매완료</title>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
			
			//==>"확인" Event 처리 및 연결
			//==>DOM Object GET 3가지 방법 ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
			//==>1과 3 방법의 조합 : $("tagName.className:filter함수") 사용함.
			$("button.btn.btn-primary:contains('확인')").on("click", function(){
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
 	 
 	 <!-- 화면구성 div Start -->
 	 <div class="container">
 	 
 	 	<div class="page-header">
 	 		<h3 class="text-info">구매완료</h3>
 	 		<h5 class="text-muted">구매가 완료되었습니다.</h5>
 	 	</div>
 	 	
 	 	<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>구매자아이디</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
   			<c:if test="${purchase.paymentOption == '1' }">
	   			<div class="col-xs-8 col-md-4">현금구매</div>
   			</c:if>
   			<c:if test="${purchase.paymentOption == '2' }">
   				<div class="col-xs-8 col-md-4">신용구매</div>
   			</c:if>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>구매자이름</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.receiverName }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>구매자주소</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyAddr }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row">
   			<div class="col-xs-4 col-md-2"><strong>배송희망일자</strong></div>
   			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
   		</div>
   		
   		<hr/>
   		
   		<div class="row" align="center">
			<button type="button" class="btn btn-primary">확인</button>
   	   	</div>
 	 
 	 
 	 </div>
 	 <!-- 화면구성 div End -->
 
	<!-- </form> -->

</body>
</html>