
<%@page import="model.bean.thongkebean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<title>Bootstrap Case</title>
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

		
		<!-- nav -->
		<div >
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Trang chủ</a></li>
				      <li><a href="ThemLoaiVacxinServlet">Loại Vacxin</a> </li>
				      <li><a href="LichSuTiemPhongKHServlet">Vacxin</a> </li>
				      <li><a href="LichDatTiemKHServlet">Quản lý khách hàng</a> </li>
				      <li><a href="LichDatTiemKHServlet">Quản lý tiêm chủng</a> </li>
				       <li class="dropdown">
					        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Thống kê - Báo cáo
					        <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					          <li><a href="#">Tồn kho</a></li>
					          <li><a href="#">Vacxin đã tiêm</a></li>
					          <li><a href="#">Vacxin nhiều</a></li>
					          <li><a href="#">Vacxin ít nhất</a></li>
					        </ul>
					      </li>
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
		
	<form method="get" action="thongkeSV">
	<div class="container">
	    <div class="col-sm-6" style="height:130px;">
	        <div class="form-group">
	            <div class='input-group date' id='datetimepicker11'/>
	                <span class="input-group-addon">
	                <td colspan="9"><h2 align="center"><span style="color: green" >Từ Ngày <input type='date' class="form-control" name="txtn1" >
	                    <span class="glyphicon glyphicon-calendar">
	                    </span>
	                </span>
            </div>
        </div>
    </div>
    <div class="col-sm-6" style="height:130px;">
        <div class="form-group">
            <div class='input-group date' id='datetimepicker11'/>
                <span class="input-group-addon">
               <td colspan="9"><h2 align="center"><span style="color: green" >Đến Ngày <input type='date' class="form-control" name="txtn2"  >
                    <span class="glyphicon glyphicon-calendar">
                    </span>
                </span>
       </div>
   </div>
   <center>
   		<span style="color: green" >
   			<input type='submit' name="btntk" >
   		</span>
   </center>
</form>
</div>

		<!--<tr>
		<td colspan="9"><h2 align="center"><span style="color: green" >Thống kê vacxin đã tiêm </span></h2></td>
		
	</tr>-->

	
	<tr>
		<td colspan="9"><h2 align="center"><span style="color: green" >Danh Sách Vacxin đã tiêm </span></h2></td>
		
	</tr>
	
	<table class="table" border="1" align="center">
	<%ArrayList<thongkebean> dslk =(ArrayList<thongkebean>) request.getAttribute("lk");%>
			<tr>
			<th>Số lượng</th>
			<th>Mã vacxin</th>
			<th>Tên Vacxin</th>
			<th>Ngày tiêm</th>
		
			
			</tr>
		<% int total_page = Integer.parseInt(request.getAttribute("total_page").toString()); 
    	int curent_page;
    	int limit = 2;
    	int start ;
    	if(request.getParameter("page") != null){
    		curent_page = Integer.parseInt(request.getParameter("page").toString());
    		start = (curent_page - 1 ) * limit ;
    	}else{
    		curent_page = 0;
    		start = 0;
    	}
   
    	int max = start + limit;
    	
    	
    	
    	
    	ArrayList<thongkebean> list =(ArrayList<thongkebean>) request.getAttribute("lk");
    	
    	if(max > list.size()){
    		max = list.size();
    	}
    	for(int i = start ;i< max;i++)
    	{%>
		<tr>
			<th><%=list.get(i).getSoluong() %></th>
			<th><%=list.get(i).getMavacxin()%></th>
			<th><%=list.get(i).getTenVacxin() %></th>
			<th><%=list.get(i).getNgayTiem() %></th>
		</tr>
		
		
		<%} %>
	</table>
		 <center>
		 <%
		 	if(total_page > 0){
		 		%>
		 			<ul class="pagination">
					<li><a href="thongkeSV?page=1<%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>">  << </a></li>
						<%
							for(int i = 0;i<total_page;i++){
								%>
									
								    <li class="<%= curent_page == (i + 1)?"active":"" %>" ><a  href="thongkeSV?page=<%=i+1 %><%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>"><%= i + 1 %></a></li>
								    
								<%
							}
						%>
						<li><a href="thongkeSV?page=<%=total_page %><%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>">  >> </a></li>
					</ul>
		 		<%
		 	}
		 %>
			
  
    </center>


					</div>
					</div>

</body>
</html>