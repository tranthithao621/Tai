package controllers;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.bean.LichDatTiem;
import model.bo.LichDatTiemBO;

/**
 * Servlet implementation class LichDatTiemServlet
 */

public class LichDatTiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LichDatTiemServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			LichDatTiemBO tk = new LichDatTiemBO();
			
			ArrayList<LichDatTiem> dstk = null;
			
			String tuKhoa = request.getParameter("s");
			if( tuKhoa != null){
				dstk = tk.timKiemTheoTenKH(tuKhoa);
			}else{
				dstk = tk.getDatLich();
			}
			int total_page = (int) Math.ceil(dstk.size()/2.0);
			request.setAttribute("total_page", total_page);
			request.setAttribute("dstk", dstk);
			RequestDispatcher rd = request.getRequestDispatcher("Lichdattiem.jsp");
			rd.forward(request, response);
		}catch(Exception tt){
			response.getWriter().println("<html><body>"+ tt.getMessage()+"</body></html>");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
