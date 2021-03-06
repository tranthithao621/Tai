package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import dungchung.CDungChung;
import model.bean.LichDatTiem;



public class LichDatTiemDAO {
	Connection cn;
	public void KetNoi()throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn= DriverManager.getConnection(CDungChung.url,CDungChung.userName,CDungChung.password);
	}
	public ArrayList<LichDatTiem> getDatLich() throws Exception{
		
		KetNoi();
		String sql= "SELECT dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin ";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<LichDatTiem>ds= new ArrayList<LichDatTiem>();
		while(r.next()){
			 String tenKH=r.getString("TenKH");
			 String tenVacxin=r.getString("TenVacxin");
			 
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 int maKH = r.getInt("MaKH");

			 LichDatTiem ldt = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			 ds.add(ldt);	
		}
		r.close();
		cn.close();
		return ds;
	}
	public ArrayList<LichDatTiem> getTheoMaKH(int maKH) throws Exception{
		KetNoi();
		ArrayList<LichDatTiem>ds= new ArrayList<LichDatTiem>();
		String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin where DangKi.MaKH = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		
		cmd.setInt(1, maKH);
		
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 String tenKH = r.getString("TenKH");
			 LichDatTiem ldt = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			 
			 ds.add(ldt);
			
		}
		r.close();
		cn.close();
		return ds;
	}
	public ArrayList<LichDatTiem> timKiemTheoTenKH(String tuKhoa) throws Exception{
		KetNoi();
		ArrayList<LichDatTiem> list = new ArrayList<LichDatTiem>();
		String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin where dbo.KhachHang.TenKH LIKE ? or dbo.DangKi.NgayDat = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		if (tuKhoa.matches("\\d{4}-\\d{2}-\\d{2}")) {
			cmd.setString(1,"%"+ tuKhoa +"%");
			cmd.setObject(2, tuKhoa);
		}else{
			cmd.setString(1,"%"+ tuKhoa +"%");
			cmd.setObject(2, null);
		}

		
		
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 String tenKH = r.getString("TenKH");
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 
			 int maKH = r.getInt("MaKH");
			 LichDatTiem user = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			
			 list.add(user);
			
		}
		r.close();
		cn.close();
		return list;
	}
	
	public ArrayList<LichDatTiem> timKiemTheoNgay(String date) throws Exception{
		KetNoi();
		
		ArrayList<LichDatTiem> list = new ArrayList<LichDatTiem>();
		String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin where dbo.DangKi.NgayDat = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		cmd.setObject(1, date);
		
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 String tenKH = r.getString("TenKH");
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 int maKH = r.getInt("MaKH");
			 LichDatTiem user = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			
			 list.add(user);
			
		}
		r.close();
		cn.close();
		return list;
	
	}

}
