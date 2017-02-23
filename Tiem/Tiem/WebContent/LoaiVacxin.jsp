<%@page import="model.bean.LoaiVacxin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Quản lý tiêm chủng</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
	<div class="container-fluid">
		<!-- header -->
		<!-- nav -->
		<div>
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Trang chủ</a></li>
				      <li><a href="#">Loại Vacxin</a></li>
				      </li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Vacxin<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">Page 1-1</a></li>
				          <li><a href="#">Page 1-2</a></li>
				          <li><a href="#">Page 1-3</a></li>
				        </ul>
				      </li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý khách hàng<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">Page 1-1</a></li>
				          <li><a href="#">Page 1-2</a></li>
				          <li><a href="#">Page 1-3</a></li>
				        </ul>
				      </li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý tiêm chủng<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">Page 1-1</a></li>
				          <li><a href="#">Page 1-2</a></li>
				          <li><a href="#">Page 1-3</a></li>
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
				      <li><a href="#" data-toggle="modal" data-target="#dangnhap"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				    </ul>
				  </div>
				</nav>

		</div>
		<!-- content -->
		<div class="container-fluid" style="margin-left:10px;min-height:100%">
			<div class="row" style="margin-top:100px">
				<div class="col-sm-1"></div>
				<div class="col-sm-4">
					<form style="margin-top:26px;" action="ThemLoaiVacxinServlet" method="post">
					  <div class="form-group">
					    <label for="pwd">Tên loại Vacxin:</label>
					    <input type="text" class="form-control" id="pwd" name="tenLoaiVacxin">
					  </div>
					  <button type="submit" class="btn btn-primary" name="them">Thêm</button>
					</form>
				</div>
				<div class="col-sm-6"  style="padding-right:5px">
					<form class="navbar-form navbar-right" action="ThemLoaiVacxinServlet" method="get">
					  <div class="input-group">
					    <input type="text" class="form-control" placeholder="Search" name="s">
					    <div class="input-group-btn">
					      <button class="btn btn-primary" type="submit" style="height:34px">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
					  </div>
					</form>
					<table class="table table-bordered">
					    <thead>
					      <tr class="success">
					        <th>Tên loại Vacxin</th>
					        <th></th>
					        <th></th>
					      </tr>
					    </thead>
					    <tbody>
					    <%
					    	ArrayList<LoaiVacxin> listLoaiVacxin = (ArrayList<LoaiVacxin>)request.getAttribute("listLoaiVacxin");
					   
					    	for(int i = 0;i < listLoaiVacxin.size(); i++){
					    		%>
					    			<tr class="warning">
								        <td><%=listLoaiVacxin.get(i).getTenLoaiVacxin() %></td>
								        <td>
								        	<a href="SuaLoaiVacxinServlet?id=<%= listLoaiVacxin.get(i).getMaLoai()%>"><button class="btn btn-primary">Sửa</button></a>
								        	
								        	
								        </td>
								        <td>
								        <a href="XoaLoaiVacxinServlet?id=<%= listLoaiVacxin.get(i).getMaLoai()%>"><button class="btn btn-danger">Xóa</button></a>

								        	
								        </td>
								      </tr>
					    		<%
					    	}
					    	
					   	%>

					    </tbody>
					  </table>
				</div>
			</div>
		</div>
		<!-- footer -->
	

					

					</div>
	</div>
</body>
</html>