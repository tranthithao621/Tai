package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.LoaiVacxin;
import model.dao.LoaiVacxinDAO;

public class LoaiVacxinBO {
	LoaiVacxinDAO loaiVacxinDAO = new LoaiVacxinDAO();
	
	
	public ArrayList<LoaiVacxin> getAll(){
		return loaiVacxinDAO.getAll();
	}
	public int themLoaiVacxin(String tenLoaiVacxin) throws SQLException {
		return loaiVacxinDAO.themLoaiVacxin(tenLoaiVacxin);
	}
	
	public int suaLoaiVacxin(String tenLoaiVacxin, int maLoaiVacxin) throws SQLException{
		return loaiVacxinDAO.suaLoaiVacxin(tenLoaiVacxin, maLoaiVacxin);
	}
	
	public int xoaLoaiVacxin(int maLoaiVacxin) throws SQLException{
		return loaiVacxinDAO.xoaLoaiVacxin(maLoaiVacxin);
	}
	public LoaiVacxin getLoaiVacxin(int maLoaiVacxin) throws SQLException {
		return loaiVacxinDAO.getLoaiVacxin(maLoaiVacxin);
	}
	public ArrayList<LoaiVacxin> timKiemLoaiVacxin(String tuKhoa) throws SQLException{
		return loaiVacxinDAO.timKiemLoaiVacxin(tuKhoa);
	}
}
