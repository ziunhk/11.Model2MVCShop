<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- CDN 사용 
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	 -->

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

	function fncUpdatePurchase(){
		
		//document.detailForm.action='/purchase/updatePurchase';
		//document.detailForm.submit();
		$('form').attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
		
	}
	
	
	$(function(){
		//==>DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1과 3 방법 조합 : $("tagName.className : filter함수") 사용함.
		$("td.ct_btn01:contains('수정')").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('수정')").html());
			fncUpdatePurchase();
			//self.location=$('.hidden_link', $(this)).text();
			
		});
		
		$("td.ct_btn01:contains('취소')").on("click", function(){
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
			<h3 class="text-info">구매정보수정</h3>
			<h5 class="text-muted"><strong class="text-danger">배송전에만</strong>상품정보 수정이 가능합니다/</h5>
		</div>
	
		<!-- form Start -->
		<form class="form-horizontal" method="post" name="detailForm">
		<input type="hidden" name="prodNo" value="${product.prodNo }"/>
		<input type="hidden" name="menu" value="${param.menu }"/>
		
			<div class="form-group">
				<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId }" readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<select 	name="paymentOption" 	class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
						<option value="1" ${ ! empty purchase.paymentOption && purchase.paymentOption == "1" ? "selected" : ""  } >현금구매</option>
						<option value="2" ${ ! empty purchase.paymentOption && purchase.paymentOption == "2" ? "selected" : ""  } >신용구매</option>
					</select>
					<span id="helpBlock" class="help-block">
						<strong class="text-danger">다시 선택해주세요.</strong>
					</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyDate" name="divyDate" value="${purchase.divyDate }" readonly>
						<img src="../images/ct_icon_date.gif" width="20" height="20" 
									onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-primary">수정</button>
					<a class="btn btn-primary btn" href="#" role="button">취소</a>
				</div>
			</div>
		
		</form>
	
	
	</div>
	<!-- 화면구성 div End -->

</body>

</html>