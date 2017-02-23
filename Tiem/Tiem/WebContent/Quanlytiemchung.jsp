<%@page import="model.bean.Vacxin"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.QuanLyTiemChung"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Quản lý Tiêm Chủng</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

  
</head>
<body  background ="images/log.jpg">
	<div class="container-fluid">


		<div >
				<nav class="navbar navbar-inverse" >
				  <div class="container-fluid">
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Trang chủ</a></li>
				      <li class="active"><a href="#">Loại Vacxin</a></li>
				      </li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Vacxin<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">Page 1-1</a></li>
				          <li><a href="#">Page 1-2</a></li>
				          <li><a href="#">Page 1-3</a></li>
				        </ul>
				      </li>
				      <li class="active"><a href="#">Quản lý khách hàng </a></li>
				      
				     				    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý tiêm chủng<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="QuanLyTiemChungServlet">Đặt Tiêm</a></li>
				          <li><a href="LichSuTiemPhongServlet">Lịch sử tiêm phòng</a></li>
				          <li><a href="LichDatTiemServlet">Lịch Đặt Tiêm</a></li>
				        </ul>
				      </li>
				      
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Thống kê - Báo cáo<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">Page 1-1</a></li>
				          <li><a href="#">Page 1-2</a></li>
				          <li><a href="#">Page 1-3</a></li>
				        </ul>
				      </li>
				    </ul>
				    <ul class="nav navbar-nav navbar-right">
				      <li><a href="#" data-toggle="modal" data-target="#dangKy"><span class="glyphicon glyphicon-user"></span> Admin</a></li>
				      <li><a href="#" data-toggle="modal" data-target="#dangnhap"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
				    </ul>
				  </div>
				</nav>


		</div>
		<!-- content -->
		<div class="container" style=" height:100%">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="form-group" style="margin-top:25px ">
		    				
		    				<input type="search" class="form-control" id="search" placeholder="Tìm Kiếm" >
		    				
		 				 </div>
					
			</div>
			<div class="col-sm-4">
				<div style="margin-top:25px" >
						<button type="submit" class="btn btn-primary" style="margin-right:10px width:300px">Tìm Kiếm</button>
					
						
					</div>
			</div>
			<% QuanLyTiemChung nv1 = (QuanLyTiemChung)request.getAttribute("kh");
				Vacxin vx1 = (Vacxin)request.getAttribute("vx");%>
			
			<div class="row">
				<form>
				<div class="col-sm-1"></div>
				<div class="col-sm-5" style="margin-left:100px">
		  				<div class="form-group">
		    				<label for="name">Họ tên khách hàng :</label>
		    				<input type="text" class="form-control" id="name"  value="<%=(nv1!=null)?nv1.getTenKH():""%>" readonly>
		  				</div>
		  				
		 				 <div class="form-group">
		  					<label for="address">Tên vacxin :</label>
		  					 	<form action="">
						  		<select name="maVX" class="form-control" >
								
								  <% List<Vacxin> tv = (List<Vacxin>)request.getAttribute("lstvx");
								  	for(Vacxin x:tv){ 
								  	if(vx1!=null && vx1.getMaVacxin()==(x.getMaVacxin())){%>
								    	<option value="<%=x.getMaVacxin() %>" selected><%=x.getTenVacxin()%></option>
								    <% }else { %> 
								    	<option value="<%=x.getMaVacxin() %>"><%=x.getTenVacxin()%></option>
								     	
								  	<% }} %>
								  </select>
						</div>
						
		  				<div class="form-group" style="margin-top:15px">
						<label for="gia"> Giá:</label>
						<input type="gia" class="form-control" id="gia" readonly>
					</div>
							 
				</div>

				<div class="col-sm-5">
	  				<!-- <div class="form-group">
	    				<label for="address">Địa chỉ :</label>
	    				<input type="address" class="form-control" id="address">
	  				</div>
	  				<div>
	  					<label for="address">Giới tính :</label>
	  					<div class="dropdown">
						    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Nam
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Nữ</a></li>
						      
						    </ul>
						</div>

					</div> -->
					
					<div class="form-group">
						<label for="address"> Ngày tái tiêm :</label>
						<input type="date" class="form-control" id="address">
					</div>
					<div class="form-group">
		    				<label for="name">Lần Tiêm:</label>
		    				<input type="name" class="form-control" id="name" >
		  				</div>
					<div class="form-group">
		    				<label for="sdt">Ghi chú:</label>
		    				<input type="text" class="form-control" id="sdt">
		 				</div>		
					<div style="margin-top:10px padding-bot:10px" >
						<button type="submit" class="btn btn-primary" style="margin-right:10px">Thêm</button>
						
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>

			<div class="row" style="margin-left:10px;margin-right:10px">

					<div class="col-sm-1"></div>
					<div class="col-sm-10">

									<table width="1000" align="center" class='table'>
										<tr>
											<th width="70">Mã KH</th>
											<th width="200">Tên Khách Hàng</th>
											<th width="90">Tuổi</th>
											<th width="70">Giới Tính</th>
											<th width="150">Địa Chỉ</th>
											<th width="120">SĐT</th>
											<th width="180">Email</th>
											<th width="100">Đăng ký</th>
										</tr>
	<% List<QuanLyTiemChung> nv = (List<QuanLyTiemChung>)request.getAttribute("lstkh");
	
	for(QuanLyTiemChung x : nv){ %>
				<tr>
					<td><%=x.getMaKH() %></td>
					<td><%=x.getTenKH() %></td>
					<td><%=x.getTuoi()	%></td>
					<td><%=(x.getGioiTinh()==1)?"Nam":"Nữ" %></td>
					<td><%=x.getDiaChi()%></td>
					<td><%=x.getSodt() %></td>
					<td><%=x.getEmail()%></td>
					<td>
			<a href="QuanLyTiemChungServlet?makh=<%=x.getMaKH() %>"><img src="images/iconedit.ico"width=20 height=20></a>
		</td>
				</tr>
					<%}%>
						</table>
					</div>
					<div class="col-sm-1"></div>
					
							
			</div>
			
		</div>
		<!-- footer -->
		

					

					</div>
	</div>
</body>
</html>