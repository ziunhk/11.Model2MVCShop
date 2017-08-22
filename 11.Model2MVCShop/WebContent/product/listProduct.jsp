<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	 
	<title>상품 목록조회</title>

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	<!--  // 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScript 이용 --> 
	function fncGetUserList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
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
		
		
		//==> prodName LINK : ToolTip Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( ".ct_list_pop td:nth-child(3)" ).on("mouseover", function(){
			
			var prodNo = $("input:hidden[name='prodNo']",$(this)).val();
			
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData.fileName : \n"+JSONData);
							
							var displayValue = "<h3>"
														+"상품번호 : "+JSONData.prodNo+"<br/>"
														+"<div style='width: 200px; height: 200px; overflow: hidden'>"
														+"<img src='../images/uploadFiles/"+JSONData.fileName+"' style='max-width: 100%; height: auto'><br/>"
														+"</div>"
														+"</h3>";
							//Debug...	
							//alert(displayValue);
							$("h3").remove();
							$( "#"+prodNo+"" ).html(displayValue);
							
						}			
				});
		});
		
		
		//==> prodName LINK : Click Event 연결처리
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> updateTranCode LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( ".ct_list_pop td:contains('배송하기')" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> UI 수정 추가부분  :  prodName LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
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

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
<form name="detailForm" action="/product/listProduct" method="post">
/////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm">

<input name="menu" value="${param.menu}" type="hidden"/>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<c:if test = "${param.menu == 'manage'}">
						<td width="93%" class="ct_ttl01">상품 관리</td>
					</c:if>
					<c:if test = "${param.menu == 'search' }">
						<td width="93%" class="ct_ttl01">상품 목록조회</td>
					</c:if>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	
		<c:if test = "${search.searchCondition != null}">
	
			<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<c:if test = "${search.searchCondition eq '0'}">
						<option value="0" selected>상품NO</option>
						<option value="1">상품명</option>
					</c:if>
					<c:if test = "${search.searchCondition eq '1' }">				
						<option value="0">상품NO</option>
						<option value="1" selected>상품명</option>
					</c:if>
					
				</select>
				<input 	type="text" name="searchKeyword"  value="${search.searchKeyword}" 
								class="ct_input_g" style="width:200px; height:19px" >
			</td>
		</c:if>
		<c:if test = "${search.searchCondition == null }">	
			<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option value="0">상품NO</option>
					<option value="1">상품명</option>
				</select>
				<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
			</td>
		</c:if>

		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
						<a href="javascript:fncGetProductList();">검색</a>
						//////////////////////////////////////////////////////////////////////////// -->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			상품명<br>
			<c:if test = "${param.menu == 'manage' }">
				<h7>(prodName click:상품수정)</h7>
			</c:if>
			<c:if test = "${param.menu != 'manage' }">
				<h7>(prodName click:상세정보)</h7>
			</c:if>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="500">등록일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list }">
		<c:set var="i" value="${i+1 }" />
			<tr class="ct_list_pop">
				<td align="center">${i }</td>
				<td></td>
				<c:if test = "${param.menu == 'manage'}">
					<td align="left">	
						<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
						<a href="/product/updateProductView?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
						///////////////////////////////////////////////////////////////////////// -->
						${product.prodName}
						<input type="hidden" name="prodNo" value=${product.prodNo }>
						<span style="display: none" class="hidden_link">/product/updateProductView?prodNo=${product.prodNo }&menu=${param.menu }</span>
					</td>
				</c:if>
				<c:if test = "${param.menu != 'manage'}">
					<td align="left">	
						<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
						<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
						///////////////////////////////////////////////////////////////////////// -->
						${product.prodName}
						<input type="hidden" name="prodNo" value=${product.prodNo }>
						<span style="display: none" class="hidden_link">/product/getProduct?prodNo=${product.prodNo }&menu=${param.menu }</span>
					</td>
				</c:if>
				<td></td>
				<td align="left">${product.price}</td>
				<td></td>
				<td align="left">${product.regDate}</td>
				<td></td>
				<c:if test="${product.proTranCode  == null}">
				<td align="left">
					판매중
				</td>
				</c:if>
				<c:if test="${product.proTranCode  == '1  '}">
				<td align="left">
					구매완료
					<c:if test="${param.menu=='manage' }">
						<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
						<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&tranCode=2">배송하기</a>
						///////////////////////////////////////////////////////////////////////// -->
						배송하기
						<span style="display: none" class="hidden_link">/purchase/updateTranCode?prodNo=${product.prodNo }&tranCode=2</span>
					</c:if>
				</td>
				</c:if>
				<c:if test="${product.proTranCode == '2  '}">
				<td align="left">
					배송중입니다.
				</td>
				</c:if>
				<c:if test="${product.proTranCode == '3  '}">
				<td align="left">
					배송이 완료되었습니다.
				</td>
				</c:if>
			</tr>
		<tr>
			<!-- 
			<td colspan="11" bgcolor="D6D7D6" height="1"/>
			 -->
			 <td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1">
			 </td>
		</tr>
	</c:forEach>
</table>


<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->
</form>
</div>

</body>
</html>