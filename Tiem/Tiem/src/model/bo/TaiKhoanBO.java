package model.bo;

import java.sql.SQLException;

import model.bean.TaiKhoan;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {
	TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();
	public TaiKhoan checkLogin(String tenDangNhap, String matKhau) throws SQLException{
		return taiKhoanDAO.checkLogin(tenDangNhap, matKhau);
	}
}
