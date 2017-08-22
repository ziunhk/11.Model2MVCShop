<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>���� �����ȸ</title>
<meta charset="EUC-KR">

<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetUserList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	//====================================//
	//==> �߰��� �κ� : "�˻�", prodName link Event ���� �� ó��
	$(function(){
		
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2. $(#id) : 3.$(.className)
		//==> 1�� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.
		$("td.ct_btn01:contains('�˻�')").on("click", function(){
			
			//Debug..
			//alert($("td.ct_btn01:contains('�˻�')")).html();
			fncGetUserList(1);
		});
		
		
		//==> userId LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> tranNo LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:contains(${i})" ).on("click" , function() {
			
			//Debug..
			//alert(  $("input:hidden[name='prodNo']",$(this)).val() );
			//self.location ="/product/getProduct?prodNo="+prodNo; //$(this).text().trim()
			//alert($('.hidden_link', $(this)).text());
			self.location=$('.hidden_link', $(this)).text();
		
		});
		
		
		//==> UI ���� �߰��κ�  :  prodName LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		
		//==> �Ʒ��� ���� ������ ������ ??
		//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
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

	<div style="width: 98%; margin-left: 10px;">
		
		<!-- <form name="detailForm" action="/purchase/listPurchase" method="post"> -->
		<form name="detailForm">
		<input type="hidden" name=menu value=${param.menu }/>
		<!-- <form name="menu" value=${param.menu } type="hidden"/> -->
			<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage} ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ��ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ȭ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>


				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">
							<!-- ///////////////////////////////////////////////////////////////////
							<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${i }</a>
							///////////////////////////////////////////////////////////////////// -->
							<!-- ${purchase.tranNo } -->
							${i }
							
							<span style="display: none" class="hidden_link">/purchase/getPurchase?tranNo=${purchase.tranNo }</span>
						</td>
						<td></td>
						<td align="left">
							<!-- ///////////////////////////////////////////////////////////////////
							<a	href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
							///////////////////////////////////////////////////////////////////// -->
							${purchase.buyer.userId}
							<span style="display: none" class="hidden_link">/user/getUser?userId=${purchase.buyer.userId }&menu=${param.menu }</span>
						</td>
						<td></td>
						<td align="left">${purchase.receiverName}</td>
						<td></td>
						<td align="left">${purchase.receiverPhone}</td>
						<td></td>
						<c:if test="${purchase.tranCode == '1  '}">
						<td align="left">���ſϷ�Ǿ����ϴ�.(�ԷµǾ����� �̰� default)</td>
						</c:if>
						<c:if test="${purchase.tranCode == '2  '}">
						<td align="left">��ۿϷ�Ǿ����ϴ�.</td>
						</c:if>
						<td></td>
					</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:forEach>

			</table>

		<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td align="center">
						<input type="hidden" id="currentPage" name="currentPage" value=""/> 
						<jsp:include page="../common/pageNavigator.jsp" /></td>
				</tr>
			</table>
			<!--  ������ Navigator �� -->
		</form>

	</div>

</body>
</html>