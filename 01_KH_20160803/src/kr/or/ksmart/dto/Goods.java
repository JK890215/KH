package kr.or.ksmart.dto;

public class Goods {
	//전역변수 = 맴버 = 필드 = 맴버필드 = 프로퍼티
	private String g_name = null;
	private String g_cate = null;
	private String g_price = null;
	private String g_desc = null;
	
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		System.out.println(g_name + "<-- g_name setG_name Member.java");
		this.g_name = g_name;
	}
	public String getG_cate() {
		return g_cate;
	}
	public void setG_cate(String g_cate) {
		System.out.println(g_cate + "<-- g_cate setG_cate Member.java");
		this.g_cate = g_cate;
	}
	public String getG_price() {
		return g_price;
	}
	public void setG_price(String g_price) {
		System.out.println(g_price + "<-- g_price setG_price Member.java");
		this.g_price = g_price;
	}
	public String getG_desc() {
		return g_desc;
	}
	public void setG_desc(String g_desc) {
		System.out.println(g_desc + "<-- g_desc setG_desc Member.java");
		this.g_desc = g_desc;
	}
	
}
