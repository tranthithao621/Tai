<%@page import="model.bean.LichDatTiem"%>
<%@page import="model.bean.LoaiVacxin"%>
<%@page import="model.bean.Vacxin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <style type="text/css">
  .w3-signal-grey
{color:#fff;background-color:#9b9b9b}
  </style>
</head>
<body>
	<div class="container-fluid">
		<!-- header -->
		<!--<header class="container-fluid" style="height:200px;border-bottom:1px solid rgb(242, 242, 242)">
			<center><img src="images/logo4.jpg" style="margin-top:10px" width="350px" height="200px" /></center>
			
		</header> 
		--><!-- nav -->
		<div >
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Trang chủ</a></li>
				      <li><a href="DangKiServlet">Đặt lịch tiêm chủng</a> </li>
				      <li><a href="LichSuTiemPhongKHServlet">Lịch sử tiêm phòng</a> </li>
				      <li><a href="LichDatTiemKHServlet">Danh sách đặt tiêm phòng</a> </li>
				    </ul>
				    <ul class="nav navbar-nav navbar-right">
				      <li><a href="#" ><span class="glyphicon glyphicon-user"></span>
				       <%
				    	  	if(session.getAttribute("nguoidung") != null){
				    	  		%>
				    	  			<%=session.getAttribute("nguoidung") %>
				    	  		<%
				    	  	}
				    	%>
				      </a></li>
				      <li><a href="LogoutServlet" ><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				    </ul>
				  </div>
				</nav>
		</div>
		<!-- content -->
		<div class="container-fluid" style="margin-left:10px;min-height:100%">
			<div style="margin:20px">
				<center><h2>Đặt lịch tiêm chủng</h2></center>
				
			</div>
			<div class="row" style="margin:20px">
				<!-- <div class="col-sm-2"></div>
				<div class="col-sm-8"> -->
					<form class="" action="DangKiServlet" method="get">
						<div class="col-sm-2"></div>
						<div class="col-sm-3">

							<div class="input-group">
								<label for="sel1">Độ tuổi:</label>
							    <input type="number" class="form-control" placeholder="Độ tuổi" name="t">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							  <label for="sel1">Tên Loại Vacxin:</label>
							  <select class="form-control" id="sel1" name="l">
							  <%
							  	ArrayList<LoaiVacxin> listLoaiVacxin = (ArrayList<LoaiVacxin>) request.getAttribute("listLoaiVacxin");
							  	for(int i = 0;i<listLoaiVacxin.size();i++){
							  		%>
							  			<option value="<%= listLoaiVacxin.get(i).getMaLoai()%>"><%=listLoaiVacxin.get(i).getTenLoaiVacxin() %></option>
							  		<%
							  	}
							  
							  %>
							  </select>
							</div>
						</div>
						<div class="col-sm-3">
							<button class="btn btn-info" style="margin-top:26px" type="submit">Xem</button>
						</div>
						 
					
					</form>
					<div style="clear:both"></div>
					<%
					ArrayList<LichDatTiem> listLichDatTiem = (ArrayList<LichDatTiem> )request.getAttribute("listLichDatTiem");
					for(int i = 0; i< listLichDatTiem.size();i++){
						%>
						<div class="alert alert-danger">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						  <strong>Nhắc nhở!</strong>
						  Ngày <%=listLichDatTiem.get(i).getNgayDat() %>  bạn có lịch hẹn tiêm Vacxin <%= listLichDatTiem.get(i).getTenVacxin() %>
						</div>
													
						<%
					}
				%>
					<table class="table table-bordered">
					    <thead>
					      <tr class="w3-signal-grey">
					      	<th>Mã Vacxin</th>
					        <th>Tên Vacxin</th>
					        <th>Tên Loại Vacxin</th>
					        <th>Số lượng(mũi)</th>
					        <th>Ngày</th>
					      </tr>
					    </thead>
					    <tbody>
					      <% ArrayList<Vacxin> listVacxin =(ArrayList<Vacxin>) request.getAttribute("listVacxin");
					    	if(listVacxin != null){
					    		for(int i = 0; i< listVacxin.size(); i++){
					    			%>
					    				<tr class="warning">
					    				
					    				
					    				
					    					<td><%=listVacxin.get(i).getMaVacxin() %></td>
					    					
									      	<td><%=listVacxin.get(i).getTenVacxin() %></td>
									      
									        <td><a href=""><%=listVacxin.get(i).getTenLoaiVacxin() %></a></td>
									        <td><%=listVacxin.get(i).getSoLuongConLai() %></td>
					    					<td>
					    						<form action="DangKiServlet" method="post">
					    							<input type="hidden" value="<%=listVacxin.get(i).getMaVacxin() %>" name="maVacxin"/>
					    							<input type="date" name="ngayDat">
					    							<input class="btn btn-info"  type="submit" value="Đăng kí" name="dangki"/>
					    						</form>
					    					
					    					</td>
					    					
					    					
					    					
									      	
									      </tr>
					    			<%
					    		}
					    	}
					    
					    %>
					    </tbody>
					  </table>
				<!-- </div>
				<div class="col-sm-2"></div> -->
			</div>
		</div>
		<!-- footer -->
</div>
</body>
</html>