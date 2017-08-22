<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<title>��ǰ���</title>

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
	
	//=====���� Code �ּ� ó�� �� jQuery ����=====//
	function fncAddProduct(){
		//Form ��ȿ�� ����
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
	
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
	
		$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
		
	}
	
	
	$(function(){
		//==>"���" Event ó�� �� ����
		//==> DOM Object GET 3���� ��� ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1�� 3 ����� ���� : $("tagName.className:filter�Լ�") �����.
		$("button.btn.btn-primary").on("click", function(){
			//Debug..
			alert($("button.btn.btn-primary").html());
			fncAddProduct();
		});
		
		//==>"���" Event ó�� �� ����
		//==>DOM Object GET 3���� ��� ==> 1.$(tagName) : 2.(#id) : 3.$(.className)
		//==>1�� 3 ����� ���� : $("tagName.className:filter�Լ�") �����.
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

<!-- ////////// ȭ�鱸�� div Start ////////// -->
<div class="container">
	<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
</div>

<!-- ////////// form Start ////////// -->
<form class="form-horizontal" method="post" name="detailForm" enctype="multipart/form-data">
	
	<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodName" name="prodName" placeholder="����� ��ǰ���� �Է��ϼ���">
				<span id="helpBlock" class="help-block">
					<strong class="text-danger">��ǰ���� Ȯ�����ּ���(���... �ʿ� ����)</strong>
				</span>
		</div>
	</div>
	
	<div class="form-group">
		<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ�������Է�">
		</div>
	</div>
	
	<div class="form-group">
		<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="���������Է�">
			&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="price" name="price" placeholder="�����Է�">
		</div>
		<div class="col-sm-1">
			��
		</div>
	</div>
	
	<div class="form-group">
		<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		<div class="col-sm-4">
			<input type="file" class="form-control" id="toUploadFileName" name="toUploadFileName">
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-4 text-center">
			<button type="button" class="btn btn-primary">�� &nbsp; ��</button>
			<a class="btn btn-primary btn" href="#" role="button">�� &nbsp; ��</a>
		</div>
	</div>
	
</form>

</body>
</html>