package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dungchung.CDungChung;
import model.bean.QuanLyTiemChung;


public class QuanLyTiemChungDAO {
	Connection cn;
	public void KetNoi()throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn= DriverManager.getConnection(CDungChung.url,CDungChung.userName,CDungChung.password);
	}
	public ArrayList<QuanLyTiemChung> getKhachHang() throws Exception{
		
		KetNoi();
		String sql= "SELECT * FROM KhachHang ";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<QuanLyTiemChung>ds= new ArrayList<QuanLyTiemChung>();
		while(r.next()){
			int maKH=r.getInt("MaKH"); 
			String tenKH=r.getString("TenKH");
			int tuoi =r.getInt("Tuoi");
			int gioiTinh=r.getInt("GioiTinh");
			String diaChi=r.getString("DiaChi");
			String sodt=r.getString("Sodt");
			String email=r.getString("Email");
			 QuanLyTiemChung qltc = new QuanLyTiemChung(maKH, tenKH, tuoi, gioiTinh, diaChi, sodt, email);
			 ds.add(qltc);	
	}
		r.close();
		cn.close();
		return ds;

}
	public QuanLyTiemChung getKhachHangTheoMa(String tuKhoa) throws Exception{
		//Ket noi
		KetNoi();
		String sql= "SELECT * FROM KhachHang WHERE MaKH LIKE '"+tuKhoa+"'";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		r.next();
		int maKH=r.getInt("MaKH"); 
		String tenKH=r.getString("TenKH");
		int tuoi =r.getInt("Tuoi");
		int gioiTinh=r.getInt("GioiTinh");
		String diaChi=r.getString("DiaChi");
		String sodt=r.getString("Sodt");
		String email=r.getString("Email");
		QuanLyTiemChung qltc = new QuanLyTiemChung(maKH, tenKH, tuoi, gioiTinh, diaChi, sodt, email);
		r.close();
		cn.close();
		return qltc;
		
}
}
