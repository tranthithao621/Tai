package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.LoaiVacxin;

import common.DataAccessLayer;

public class LoaiVacxinDAO {
	Connection conn = DataAccessLayer.getConnection();
	public ArrayList<LoaiVacxin> getAll(){
		ArrayList<LoaiVacxin> listLoaiVacxin = new ArrayList<LoaiVacxin>();
		String query = "SELECT * FROM LoaiVacxin";
		
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int maLoai = rs.getInt("MaLoaiVacxin");
				String tenLoai = rs.getString("TenLoaiVacxin");
				LoaiVacxin loaiVacxin = new LoaiVacxin();
				loaiVacxin.setMaLoai(maLoai);
				loaiVacxin.setTenLoaiVacxin(tenLoai);
				listLoaiVacxin.add(loaiVacxin);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listLoaiVacxin;
	}
	
	public int themLoaiVacxin(String tenLoaiVacxin) throws SQLException{
		String query = "INSERT INTO LoaiVacxin(TenLoaiVacxin) VALUES(?)";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setString(1, tenLoaiVacxin);
		
		return ps.executeUpdate();
		
	}
	
	public int suaLoaiVacxin(String tenLoaiVacxin, int maLoaiVacxin) throws SQLException{
		String query = "UPDATE LoaiVacxin SET TenLoaiVacxin = ? WHERE MaLoaiVacxin = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setString(1,tenLoaiVacxin);
		ps.setInt(2, maLoaiVacxin);
		
		return ps.executeUpdate();
	}
	
	public int xoaLoaiVacxin(int maLoaiVacxin) throws SQLException{
		String query = "DELETE FROM LoaiVacxin WHERE MaLoaiVacxin = ?";
		
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setInt(1,maLoaiVacxin);
		
		return ps.executeUpdate();
	}
	
	public LoaiVacxin getLoaiVacxin(int maLoaiVacxin) throws SQLException{
		String query = "SELECT * FROM LoaiVacxin WHERE MaLoaiVacxin = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setInt(1,maLoaiVacxin);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String tenLoaiVacxin = rs.getString("TenLoaiVacxin");
			LoaiVacxin loaiVacxin = new LoaiVacxin();
			loaiVacxin.setMaLoai(maLoaiVacxin);
			loaiVacxin.setTenLoaiVacxin(tenLoaiVacxin);
			return loaiVacxin;
		}
		return null;
	}
	
	public ArrayList<LoaiVacxin> timKiemLoaiVacxin(String tuKhoa) throws SQLException{
		String query = "SELECT * FROM LoaiVacxin WHERE TenLoaiVacxin LIKE ?";
		ArrayList<LoaiVacxin> listLoaiVacxin = new ArrayList<LoaiVacxin>();
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setNString(1,"%" + tuKhoa + "%");
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String tenLoaiVacxin = rs.getString("TenLoaiVacxin");
			int maLoaiVacxin = rs.getInt("MaLoaiVacxin");
			LoaiVacxin loaiVacxin = new LoaiVacxin();
			loaiVacxin.setMaLoai(maLoaiVacxin);
			loaiVacxin.setTenLoaiVacxin(tenLoaiVacxin);
			
			listLoaiVacxin.add(loaiVacxin);
		}
		return listLoaiVacxin;
		
	}
}
