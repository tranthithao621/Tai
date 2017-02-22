package model.bo;

import java.util.ArrayList;

import model.bean.QuanLyTiemChung;
import model.dao.QuanLyTiemChungDAO;



public class QuanLyTiemChungBO {
	QuanLyTiemChungDAO s = new QuanLyTiemChungDAO();
	public ArrayList<QuanLyTiemChung> getKhachHang() throws Exception{
		return s.getKhachHang();
	}
	public QuanLyTiemChung getKhachHangTheoMa(String tenKH) throws Exception{
		return s.getKhachHangTheoMa(tenKH);

}
}
