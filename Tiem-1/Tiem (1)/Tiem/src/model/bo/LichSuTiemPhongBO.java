package model.bo;

import java.util.ArrayList;

import model.bean.LichSuTiemPhong;
import model.dao.LichSuTiemPhongDAO;




public class LichSuTiemPhongBO {
	LichSuTiemPhongDAO s = new LichSuTiemPhongDAO();
	public ArrayList<LichSuTiemPhong> getLichSu() throws Exception{
		return s.getLichSu();
	}
	
	public ArrayList<LichSuTiemPhong> timKiemTheoTenKH(String tuKhoa) throws Exception{
		return s.timKiemTheoTenKH(tuKhoa);
	}
	public ArrayList<LichSuTiemPhong> timKiemTheoNgay(String n1, String n2) throws Exception{
		return s.timKiemTheoNgay(n1, n2);
	}
}
