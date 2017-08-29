<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<title>구매 목록조회</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	
	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetUserList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	//====================================//
	//==> 추가된 부분 : "검색", prodName link Event 연결 및 처리
	$(function(){
		
		//==> 검색 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2. $(#id) : 3.$(.className)
		//==> 1과 3 방법 조합 : $("tagName.className:filter함수") 사용함.
		$("td.ct_btn01:contains('검색')").on("click", function(){
			
			//Debug..
			//alert($("td.ct_btn01:contains('검색')")).html();
			fncGetUserList(1);
		});
		
		
		//==> userId LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> tranNo LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( ".ct_list_pop td:contains(${i})" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> UI 수정 추가부분  :  prodName LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$( ".ct_list_pop td:nth-child(4)" ).css("color" , "blue");
		$( ".ct_list_pop td:nth-child(5)" ).css("color" , "green");
		$("h7").css("color" , "red");
		
		
		//==> 아래와 같이 정의한 이유는 ??
		//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
		$("td.ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		
	});

	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!-- 화면구성 div Start -->
	<div class="container">
		
		<div class="page-header text-info">
			<h3>판매완료상품</h3>
		</div>
		
		<!--  table 위쪽 검색 Start -->
   		<div class="row">
   		
   			<div class="col-md-6 text-left">
   				<p class="text-primary">
   					전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
   				</p>
   			</div>
   			
   			<div class="col-md-6 text-right">
   				<form class="form-inline" name="detailForm">
   					<input name="menu" value="${param.menu }" type="hidden"/>
   					<div class="form-group">
   						<select class="form-control" name="searchCondition">
   							<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품NO</option>
   							<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
   						</select>
   					</div>
   					
   					<div class="form-group">
   						<label class="sr-only" for="searchKeyword">검색어</label>
   						<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어" 
   								value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
   					</div>
   					
   					<button type="button" class="btn btn-default">검색</button>
   					
   					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
   					<input type="hidden" id="currentPage" name="currentPage" value=""/>
   				
   				</form>
   			</div>
   		
   		</div>
   		<!--  table 위쪽 검색 End -->
		
		<!-- table Start -->
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th align="center">NO</th>
					<th align="left">구매번호</th>
					<th align="left">상품명</th>
					<th align="left">회원ID</th>
					<th align="left">구매자명</th>
					<th align="left">전화번호</th>
					<th align="left">배송현황</th>
				</tr>
			</thead>
		
		
			<tbody>
		
				<c:set var="i" value="0"/>
				<c:forEach var="purchase" items="${list }">
					<c:set var="i" value="${i+1 }"/>
					<tr class="ct_list_pop">
							<td align="center">
								${i }
								<span style="display: none" class="hidden_link">/purchase/getPurchase?tranNo=${purchase.tranNo }</span>
							</td>
							<td align="left">
								${purchase.tranNo }
							</td>
							<td align="left">
								${purchase.purchaseProd.prodName }
							</td>
							<td align="left">
								${purchase.buyer.userId}
								<span style="display: none" class="hidden_link">/user/getUser?userId=${purchase.buyer.userId }&menu=${param.menu }</span>
							</td>
							<td align="left">
								${purchase.receiverName}
							</td>
							<td align="left">
								${purchase.receiverPhone}
							</td>
							<c:if test="${purchase.tranCode == '1  '}">
								<td align="left">구매완료되었습니다.(배송전)</td>
							</c:if>
							<c:if test="${purchase.tranCode == '2  '}">
								<td align="left">배송중입니다.</td>
							</c:if>
							<c:if test="${purchase.tranCode == '3  '}">
								<td align="left">배송완료되었습니다.</td>
							</c:if>
					</tr>
				</c:forEach>
		
			</tbody>
		
		</table>
	
	</div>
	<!-- 화면구성 div End -->
	
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->


</body>

</html>