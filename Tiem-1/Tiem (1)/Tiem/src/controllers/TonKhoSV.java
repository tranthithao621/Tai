package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.tonkhobean;
import model.bo.thongkebo;

/**
 * Servlet implementation class TonKhoSV
 */
public class TonKhoSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TonKhoSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			thongkebo a = new thongkebo();
			
				ArrayList<tonkhobean> k= a.getthongke3();
				request.setAttribute("lk",k);	
				int total_page = (int) Math.ceil(k.size()/2.0);
				request.setAttribute("total_page", total_page);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("tonkho.jsp");
			requestDispatcher.forward(request, response);
//			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().println("<html><body>"+e.getMessage()+"</body></html>");	
		}
		request.setCharacterEncoding("utf-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
