package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DataAccessLayer;

public class DangKiDAO {
	Connection conn = DataAccessLayer.getConnection();
	
	public int datLichTiem(String ngayDat, int maKH, int maVacxin) throws SQLException{
		String query = "INSERT INTO DangKi VALUES(?,?,?,?)";
		PreparedStatement ps  = conn.prepareStatement(query);
		ps.setObject(3, ngayDat);
		ps.setInt(1, maKH);
		ps.setInt(2, maVacxin);
		ps.setInt(4, 0);
		return ps.executeUpdate();
	}
	public int getSoLuongVacXin(int maVacxin) throws SQLException{
		String query = "select  COUNT(MaVacxin) AS SoLuong from DangKi where MaVacxin = ? AND TrangThai = 0 Group by MaVacxin";
		int soLuong = 0;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1,maVacxin);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			soLuong = rs.getInt("SoLuong");
			return soLuong;
		}
		return soLuong;
	}

}
