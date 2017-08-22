<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<title>상품등록</title>

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
	
	//=====기존 Code 주석 처리 후 jQuery 변경=====//
	function fncAddProduct(){
		//Form 유효성 검증
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
	
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
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
	
		$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
		
	}
	
	
	$(function(){
		//==>"등록" Event 처리 및 연결
		//==> DOM Object GET 3가지 방법 ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1과 3 방법의 조합 : $("tagName.className:filter함수") 사용함.
		$("button.btn.btn-primary").on("click", function(){
			//Debug..
			alert($("button.btn.btn-primary").html());
			fncAddProduct();
		});
		
		//==>"취소" Event 처리 및 연결
		//==>DOM Object GET 3가지 방법 ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1과 3 방법의 조합 : $("tagName.className:filter함수") 사용함.
		$("a[href='#']").on("click", function(){
			//Debug..
			alert($("a[href='#']").html());
			$("form")[0].reset();
		});
	});
	
</script>

</head>

<!-- <body bgcolor="#ffffff" text="#000000"> -->

<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> -->

<!-- ////////// ToolBar Start ////////// -->
<div class="navbar navbar-default">
	<div class="container">
		<a class="navbar-brand" href="/index.jsp"><strong>Medel2 MVC Shop</strong></a>
	</div>
</div>
<!-- ////////// ToolBar End ////////// -->

<!-- ////////// 화면구성 div Start ////////// -->
<div class="container">
	<h1 class="bg-primary text-center">상 품 등 록</h1>
</div>

<!-- ////////// form Start ////////// -->
<form class="form-horizontal" method="post" name="detailForm" enctype="multipart/form-data">
	
	<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodName" name="prodName" placeholder="등록할 상품명을 입력하세요">
				<span id="helpBlock" class="help-block">
					<strong class="text-danger">상품명을 확인해주세요(사실... 필요 없으)</strong>
				</span>
		</div>
	</div>
	
	<div class="form-group">
		<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보입력">
		</div>
	</div>
	
	<div class="form-group">
		<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자입력">
			&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="price" name="price" placeholder="가격입력">
		</div>
		<div class="col-sm-1">
			원
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
			<button type="button" class="btn btn-primary">등 &nbsp; 록</button>
			<a class="btn btn-primary btn" href="#" role="button">취 &nbsp; 소</a>
		</div>
	</div>
	
</form>

</body>
</html>