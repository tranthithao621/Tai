package model.bo;

import java.util.ArrayList;

import model.bean.thongkebean;
import model.bean.tonkhobean;
import model.dao.thongkedao;

public class thongkebo {
	thongkedao k= new thongkedao();
	public ArrayList<thongkebean> getthongke(String n1,String n2) throws Exception
	{
		return k.getthongke(n1, n2);
	}
	public  ArrayList<thongkebean> getthongke() throws Exception
	{
		return thongkedao.getthongke();
	}
	public ArrayList<thongkebean > getthongke1(String n1,String n2) throws Exception
	{
		return k.getthongke1(n1, n2);
	}
	public ArrayList<thongkebean > getthongkehh() throws Exception
	{
		return k.getthongkehh();
	}
	public ArrayList<thongkebean > getthongke2() throws Exception
	{
		return k.getthongke2();
	}
	public ArrayList<tonkhobean > getthongke3() throws Exception
	{
		return k.getthongke3();
	}

}
