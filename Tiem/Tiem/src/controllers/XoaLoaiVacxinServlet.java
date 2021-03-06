package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.LoaiVacxin;
import model.bo.LoaiVacxinBO;

/**
 * Servlet implementation class XoaLoaiVacxinServlet
 */
public class XoaLoaiVacxinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaLoaiVacxinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String maLoaiVacxin = request.getParameter("id");
		LoaiVacxinBO loaiVacxinBO = new LoaiVacxinBO();
		if(request.getParameter("xoa") != null){
			try {
				loaiVacxinBO.xoaLoaiVacxin(Integer.parseInt(maLoaiVacxin));
				RequestDispatcher rd = request.getRequestDispatcher("ThemLoaiVacxinServlet");
				rd.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(request.getParameter("quaylai") != null){
			RequestDispatcher rd=request.getRequestDispatcher("ThemLoaiVacxinServlet");
			rd.forward(request, response);
		}else{
			LoaiVacxin loaiVacxin;
			try {
				loaiVacxin = loaiVacxinBO.getLoaiVacxin(Integer.parseInt(maLoaiVacxin));
				request.setAttribute("loaiVacxin", loaiVacxin);
				RequestDispatcher rd=request.getRequestDispatcher("XoaLoaiVacxin.jsp");
				rd.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
