package model.bo;

import java.util.ArrayList;

import model.bean.CTVacxin;
import model.dao.CTVacxinDAO;

public class CTVacxinBO {
	
	CTVacxinDAO ct = new CTVacxinDAO();
	public ArrayList<CTVacxin> getCTVacxin(int mavacxin)throws Exception{
		return ct.getCTVacxin(mavacxin);
	}
}
