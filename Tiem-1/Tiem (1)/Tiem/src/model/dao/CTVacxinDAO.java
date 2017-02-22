package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import model.bean.CTVacxin;


public class CTVacxinDAO {

	String url = "jdbc:sqlserver://localhost:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}

	ArrayList<CTVacxin> ds = new ArrayList<CTVacxin>();
	PreparedStatement cmd;
	
	public ArrayList<CTVacxin> getCTVacxin(int mavacxin) throws Exception {
		KetNoi();
		String sql = "select * from CTVacxin where Mavacxin ='"+mavacxin+"'";
		 cmd = cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();

		while (rs.next()) {

			int maVacxin = rs.getInt("MaVacxin");
			Date hanSuDung = rs.getDate("HanSuDung");
			int giaBan = rs.getInt("GiaBan");
			int maLoNhap = rs.getInt("MaLoNhap");
			int soLuong = rs.getInt("SoLuong");
			String xuatXu = rs.getString("XuatXu");
			CTVacxin ctv = new CTVacxin(maLoNhap, xuatXu, hanSuDung, giaBan, soLuong, maVacxin);
			ds.add(ctv);

		}
		rs.close();
		cmd.close();
		return ds;
	}
}
