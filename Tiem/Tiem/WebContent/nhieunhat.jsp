
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
		<!-- header -->

		
		<!-- nav -->
		<div >
				<nav class="navbar navbar-inverse">
				
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="trangchu.jsp">Trang chủ</a></li>
				      <li><a href="#">Loại Vacxin</a></li>
				      </li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Vacxin<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">Page 1-1</a></li>
				          <li><a href="#">Page 1-2</a></li>
				          <li><a href="#">Page 1-3</a></li>
				        </ul>
				      </li>
				       <li><a href="#">Quản Lí Khách Hàng</a></li>
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
				          <li><a href="thongkeSV">Thống Kê số lượng Vacxin đã tiêm </a></li>
				          <li><a href="TonKhoSV">Thống Kê số lượng Vacxin tồn kho </a></li>
				          <li><a href="hethanSV">Thống Kê số lượng Vacxin hết hạn</a></li>
				          <li><a href="nhieunhatSV">Thống số lượng Kê Vacxin tiêm nhiều nhất, ít nhất</a></li>
				 
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
		
	<form method="get" action="nhieunhatSV">
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
		<td colspan="9"><h2 align="center"><span style="color: green" >Danh Sách Vacxin đã sử dụng nhiều nhất, ít nhất </span></h2></td>
		
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
			<li><a href="nhieunhatSV?page=1<%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>">  << </a></li>
				<%
					for(int i = 0;i<total_page;i++){
						%>
							
						    <li class="<%= curent_page == (i + 1)?"active":"" %>" ><a  href="nhieunhatSV?page=<%=i+1 %><%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>"><%= i + 1 %></a></li>
						    
						<%
					}
				%>
				<li><a href="nhieunhatSV?page=<%=total_page %>">  >> </a></li>
			</ul>
			<%
		}
	%>
			
  
    </center>
  
		
  
    

	<!-- footer -->

					</div>
					</div>

</body>
</html>