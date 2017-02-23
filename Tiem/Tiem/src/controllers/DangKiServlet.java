package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.LichDatTiem;
import model.bean.LoaiVacxin;
import model.bean.Vacxin;
import model.bo.DangKiBO;
import model.bo.LichDatTiemBO;
import model.bo.LoaiVacxinBO;
import model.bo.VacxinBO;

/**
 * Servlet implementation class DangKiServlet
 */
public class DangKiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("nguoidung") == null){
			response.sendRedirect("Home.jsp");
			return;
		}
		int maKH = Integer.parseInt(session.getAttribute("maKH").toString());
		LichDatTiemBO lichDatTiemBO = new LichDatTiemBO();
		try {
			ArrayList<LichDatTiem> listLichDatTiem = lichDatTiemBO.getLichTiem(maKH);
			request.setAttribute("listLichDatTiem",listLichDatTiem );
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		VacxinBO vacxinBO = new VacxinBO();
		LoaiVacxinBO loaiVacxinBO = new LoaiVacxinBO();
		
		String tuoi = request.getParameter("t");
		String maLoaiVacxin = request.getParameter("l");
		ArrayList<Vacxin> listVacxin;
		ArrayList<LoaiVacxin> listLoaiVacxin = loaiVacxinBO.getAll();
		
		try {
			if(tuoi == "" && maLoaiVacxin !=  null ){
				listVacxin = vacxinBO.timKiemVacxin1(-1, Integer.parseInt(maLoaiVacxin),null);
			}else if(tuoi != "" && maLoaiVacxin != null){
				listVacxin = vacxinBO.timKiemVacxin1(Integer.parseInt(tuoi), Integer.parseInt(maLoaiVacxin),null);
			}
			else{
				listVacxin = vacxinBO.getVacxin();
			}
			
			DangKiBO dangKiBO = new DangKiBO();
			if(request.getParameter("dangki") != null){
				String ngayDat = request.getParameter("ngayDat");
				String maVacxin = request.getParameter("maVacxin");
				try {
					dangKiBO.datLichTiem(ngayDat, maKH, Integer.parseInt(maVacxin));
					request.setAttribute("thongbao", "Bạn đã đăng ký thành công tiêm Vacxin vào ngày " + ngayDat);
					RequestDispatcher rd=request.getRequestDispatcher("LichDatTiemKHServlet");
					rd.forward(request, response);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					request.setAttribute("error", "Vacxin này bạn đã đăng ký.");
					RequestDispatcher rd=request.getRequestDispatcher("LichDatTiemKHServlet");
					rd.forward(request, response);
				}
			}else{
		
				for(int i = 0;i< listVacxin.size();i++){
					try {
						int sl = dangKiBO.getSoLuongVacXin(listVacxin.get(i).getMaVacxin());
						listVacxin.get(i).setSoLuongConLai(sl);
					} catch (SQLException e) {
					
						e.printStackTrace();
					}
				}
				request.setAttribute("listLoaiVacxin", listLoaiVacxin);
				request.setAttribute("listVacxin", listVacxin);
				RequestDispatcher rd=request.getRequestDispatcher("DangKi.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			
		}
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
