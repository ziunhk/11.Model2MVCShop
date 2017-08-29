<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<title>����Ȯ�ε��</title>
	
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
	
	//=====���� Code �ּ� ó�� �� jQuery ���� =====//
	function fncAddPurchase() {
		
		$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
		
	}
	
	
	$(function(){
		//==>"���" Event ó�� �� ����
		//==> DOM Object GET 3���� ��� ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1�� 3 ����� ���� : $("tagName.className:filter�Լ�") �����.
		$("button.btn.btn-primary:contains('����')").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('����')").html());
			fncAddPurchase();
		});
		
		//==>"���" Event ó�� �� ����
		//==>DOM Object GET 3���� ��� ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1�� 3 ����� ���� : $("tagName.className:filter�Լ�") �����.
		$("button.btn.btn-primary:contains('���')").on("click", function(){
			//Debug..
			//alert($("td.ct_btn01:contains('���')").html());
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

<!-- ////////// ȭ�鱸�� div Start ////////// -->
<div class="container">
	<h1 class="bg-primary text-center">���ž��</h1>
	
	
	<!-- ////////// form Start ////////// -->
	<form class="form-horizontal" method="post" name="detailForm">

		<div class="form-group">
		<!-- in the form group, should be there the hidden prodNo? -->
			<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" readonly="readonly">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" readonly="readonly"/>
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
			<div class="col-sm-4">
				${product.prodDetail }
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate }" readonly="readonly">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="price" name="price" value="${product.price }" readonly="readonly">
			</div>
			<div class="col-sm-1">
				��
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate }" readonly="readonly">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly="readonly">
				<input type="hidden" name="buyerId" value="${sessionScope.user.userId }"/>
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			<div class="col-sm-4">
				<select 	name="paymentOption"		class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
					<option value="1" selected="selected">���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</select>
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName }" placeholder="���������̸��� �Է����ּ���">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone }" placeholder="����������ȭ��ȣ�� �Է����ּ���">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">������ּ�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyAddr" name="divyAddr" value="" placeholder="������ּҸ� �Է����ּ���">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyRequest" name="divyRequest" value="" placeholder="���ſ�û������ �Է����ּ���">
			</div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="�����������Է�" readonly>
				<img 	src="../images/ct_icon_date.gif" width="20" height="20"	
						onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-4 text-center">
				<button type="button" class="btn btn-primary">����</button>
				<a class="btn btn-primary btn" href="#" role="button">���</a>
			</div>
		</div>
	
	
	</form>
	<!-- form End -->

</div>
<!-- ////////// ȭ�鱸�� div End ////////// -->

</body>
</html>