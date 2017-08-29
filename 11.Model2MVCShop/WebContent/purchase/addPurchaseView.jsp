<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<title>구매확인등록</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN(Content Delivery Network) ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//=====기존 Code 주석 처리 후 jQuery 변경 =====//
	function fncAddPurchase() {
		
		$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
		
	}
	
	
	$(function(){
		//==>"등록" Event 처리 및 연결
		//==> DOM Object GET 3가지 방법 ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1과 3 방법의 조합 : $("tagName.className:filter함수") 사용함.
		$("button.btn.btn-primary:contains('구매')").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('구매')").html());
			fncAddPurchase();
		});
		
		//==>"취소" Event 처리 및 연결
		//==>DOM Object GET 3가지 방법 ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1과 3 방법의 조합 : $("tagName.className:filter함수") 사용함.
		$("button.btn.btn-primary:contains('취소')").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('취소')").html());
			javascript:history.go(-1);
		});
	});

	
	</script>
	
</head>

<body>

<!-- ////////// ToolBar Start ////////// -->
<div class="navbar navbar-default">
	<div class="container">
		<a class="navbar-brand" href="/index.jsp"><strong>Medel2 MVC Shop</strong></a>
	</div>
</div>
<!-- ////////// ToolBar End ////////// -->

<!-- ////////// 화면구성 div Start ////////// -->
<div class="container">
	<h1 class="bg-primary text-center">구매양식</h1>
	
	
	<!-- ////////// form Start ////////// -->
	<form class="form-horizontal" method="post" name="detailForm">

		<div class="form-group">
		<!-- in the form group, should be there the hidden prodNo? -->
			<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" readonly="readonly">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" readonly="readonly"/>
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
			<div class="col-sm-4">
				${product.prodDetail }
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly="readonly">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 격</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="price" name="price" value="${product.price }" readonly="readonly">
			</div>
			<div class="col-sm-1">
				원
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate }" readonly="readonly">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly="readonly">
				<input type="hidden" name="buyerId" value="${sessionScope.user.userId }"/>
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
			<div class="col-sm-4">
				<select 	name="paymentOption"		class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
					<option value="1" selected="selected">현금구매</option>
					<option value="2">신용구매</option>
				</select>
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName }" placeholder="구매자의이름을 입력해주세요">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone }" placeholder="구매자의전화번호를 입력해주세요">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송지주소</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyAddr" name="divyAddr" value="" placeholder="배송지주소를 입력해주세요">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyRequest" name="divyRequest" value="" placeholder="구매요청사항을 입력해주세요">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="배송희망일자입력" readonly>
				<img 	src="../images/ct_icon_date.gif" width="20" height="20"	
						onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-4 text-center">
				<button type="button" class="btn btn-primary">구매</button>
				<a class="btn btn-primary btn" href="#" role="button">취소</a>
			</div>
		</div>
	
	
	</form>
	<!-- form End -->

</div>
<!-- ////////// 화면구성 div End ////////// -->

</body>
</html>