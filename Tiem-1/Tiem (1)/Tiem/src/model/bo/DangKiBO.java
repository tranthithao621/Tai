package model.bo;

import java.sql.SQLException;

import model.dao.DangKiDAO;

public class DangKiBO {
	DangKiDAO dangKiDAO = new DangKiDAO();
	public int datLichTiem(String ngay, int maKH, int maVacxin) throws SQLException{
		return dangKiDAO.datLichTiem(ngay, maKH, maVacxin);
	}
	public int getSoLuongVacXin(int maVacxin) throws SQLException{
		return dangKiDAO.getSoLuongVacXin(maVacxin);
	}
}
