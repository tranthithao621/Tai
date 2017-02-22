package model.bo;

import java.util.ArrayList;

import model.bean.LichDatTiem;
import model.dao.LichDatTiemDAO;



public class LichDatTiemBO {
	LichDatTiemDAO s = new LichDatTiemDAO();
	public ArrayList<LichDatTiem> getDatLich() throws Exception{
		return s.getDatLich();
	}
	public ArrayList<LichDatTiem> getTheoMaKH(int maKH)  throws Exception{
		return s.getTheoMaKH(maKH);

	}
	public ArrayList<LichDatTiem> timKiemTheoTenKH(String tenKH) throws Exception{
		return s.timKiemTheoTenKH(tenKH);
	}
	public ArrayList<LichDatTiem> timKiemTheoNgay(String date) throws Exception{
		return s.timKiemTheoNgay(date);
	}
}
