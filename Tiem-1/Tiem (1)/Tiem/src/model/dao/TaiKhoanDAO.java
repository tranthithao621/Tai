package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.TaiKhoan;

import common.DataAccessLayer;

public class TaiKhoanDAO {
	Connection conn = DataAccessLayer.getConnection();
	public TaiKhoan checkLogin(String tenDangNhap, String matKhau) throws SQLException{
		String query = "SELECT TaiKhoan.*,KhachHang.TenKH,KhachHang.MaKH FROM TaiKhoan,KhachHang WHERE TenDangNhap = ? AND MatKhau = ? AND TaiKhoan.MaTaiKhoan = KhachHang.MaTaiKhoan";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, tenDangNhap);
		ps.setString(2, matKhau);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			int maTaiKhoan = rs.getInt("MaTaiKhoan");
			String _tenDangNhap = rs.getString("TenDangNhap");
			String _matKhau = rs.getString("MatKhau");
			boolean quyen = rs.getBoolean("Quyen");
			String tenKH = rs.getString("TenKH");
			int maKH = rs.getInt("MaKH");
			
			TaiKhoan taiKhoan = new TaiKhoan();
			
			taiKhoan.setMaTaiKhoan(maTaiKhoan);
			taiKhoan.setTenTaiKhoan(_tenDangNhap);
			taiKhoan.setMatKhau(_matKhau);
			taiKhoan.setQuyen(quyen);
			taiKhoan.setTenKH(tenKH);
			taiKhoan.setMaKH(maKH);
			return taiKhoan;
		}
		return null;
	}
}
