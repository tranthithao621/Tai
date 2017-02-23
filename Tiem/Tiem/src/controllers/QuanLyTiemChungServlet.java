package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.QuanLyTiemChung;
import model.bean.Vacxin;
import model.bo.QuanLyTiemChungBO;
import model.bo.VacxinBO;

/**
 * Servlet implementation class QuanLyTiemChungServlet
 */
public class QuanLyTiemChungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyTiemChungServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try{
			VacxinBO vx = new VacxinBO();
			QuanLyTiemChungBO kh= new QuanLyTiemChungBO();			
			List<QuanLyTiemChung> lstkh = kh.getKhachHang();
			List<Vacxin> lstvx = vx.getVacxin();
			if(request.getParameter("makh")!=null)
			{	String makh=request.getParameter("makh");
				QuanLyTiemChung nv1= kh.getKhachHangTheoMa(makh);
					request.setAttribute("kh",nv1);
				
			}else request.setAttribute("kh",null);
			request.setAttribute("lstkh", lstkh);
			request.setAttribute("lstvx", lstvx);
			
			RequestDispatcher rd = request.getRequestDispatcher("Quanlytiemchung.jsp");
			rd.forward(request, response);
		}catch (Exception tt){
			response.getWriter().println("<html><body>"+ tt.getMessage()+"</body></html>");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
