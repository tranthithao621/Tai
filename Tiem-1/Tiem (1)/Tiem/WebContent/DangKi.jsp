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
		<header class="container-fluid" style="height:200px;border-bottom:1px solid rgb(242, 242, 242)">
			<center><img src="images/logo4.jpg" style="margin-top:10px" width="350px" height="200px" /></center>
			
		</header> 
		<!-- nav -->
		<div >
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Trang chủ</a></li>
				      <li><a href="DangKiServlet">Đặt lịch tiêm chủng</a> </li>
				      <li><a href="LichSuTiemPhongServlet">Lịch sử tiêm phòng</a> </li>
				      <li><a href="LichSuTiemPhongServlet">Danh sách đặt tiêm phòng</a> </li>
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

				<!-- Modal -->
				 <!-- Modal dang ky-->
				  <div class="modal fade" id="dangKy" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Đăng ký</h4>
				        </div>
				        <div class="modal-body">
				         	<form>
							  <div class="input-group">
							    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							    <input id="email" type="text" class="form-control" name="email" placeholder="Email">
							  </div>
							  <div class="input-group" style="margin-top:10px">
							    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
							  </div>
							  <div style="margin-top:10px" class="center">
							  		<center>
							  			<button type="submit" class="btn btn-primary">Đăng ký</button>
							  		</center>
							  		
							  </div>	
							</form>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				  <!-- Modal dang nhap-->
				  <div class="modal fade" id="dangnhap" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Đăng nhập</h4>
				        </div>
				        <div class="modal-body">
				         	<form>
							  <div class="input-group">
							    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							    <input id="email" type="text" class="form-control" name="email" placeholder="Email">
							  </div>
							  <div class="input-group" style="margin-top:10px">
							    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
							  </div>
							  <div style="margin-top:10px" class="center">
							  		<center>
							  			<button type="submit" class="btn btn-primary">Đăng nhập</button>
							  		</center>
							  		
							  </div>	
							</form>
				        </div>
				      </div>
				      
				    </div>
				  </div>
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
		<!-- 
			<footer class="container-fluid text-center">
			  <a href="#myPage" title="To Top">
			    <span class="glyphicon glyphicon-chevron-up"></span>
			  </a>
			  <p>Bác sĩ tư vấn:  Trần Thanh Tài <a href="http://www.w3schools.com" title="Visit w3schools">www.facebook.com/taibong</a></p>
			</footer> -->
			<div class="w3-container w3-grey">
			  			<h1>Trung Tâm Y Tế Dự Phòng</h1> 
			  
					</div>

					<div class="w3-row-padding">

					<div class="w3-third">
					  <h2>About us</h2>
					  <p>Address: Fpt city Đà Nẵng</p>
					  <p>Email: preventivehealthcenter@gmail.com.</p>
					  <p>SĐT: 0511.382.0471</p>
					  <p>Fax: 0511.382.0471</p>
					</div>

					<div class="w3-third">
					  <h2>Bác sĩ Tư Vấn</h2>
					  <p>Trần Thanh Tài - SĐT 0120.624.2344.</p> 
					  
					</div>

					

					</div>
	</div>
</body>
</html>