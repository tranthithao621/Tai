package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.LoaiVacxin;
import model.bo.LoaiVacxinBO;

/**
 * Servlet implementation class ThemLoaiVacxinServlet
 */
public class ThemLoaiVacxinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemLoaiVacxinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		LoaiVacxinBO loaiVacxinBO = new LoaiVacxinBO();
		
		if(request.getParameter("them") != null){
			String tenLoaiVacxin = request.getParameter("tenLoaiVacxin");
			try {
				loaiVacxinBO.themLoaiVacxin(tenLoaiVacxin);
				//RequestDispatcher rd=request.getRequestDispatcher("ThemLoaiVacxinServlet");
				//rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(request.getParameter("s") != null){
			ArrayList<LoaiVacxin> listLoaiVacxin;
			try {
				listLoaiVacxin = loaiVacxinBO.timKiemLoaiVacxin(request.getParameter("s"));
				request.setAttribute("listLoaiVacxin", listLoaiVacxin);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}else{
			ArrayList<LoaiVacxin> listLoaiVacxin = loaiVacxinBO.getAll();
			request.setAttribute("listLoaiVacxin", listLoaiVacxin);
			//RequestDispatcher rd=request.getRequestDispatcher("LoaiVacxin.jsp");
			//rd.forward(request, response);
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("LoaiVacxin.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
