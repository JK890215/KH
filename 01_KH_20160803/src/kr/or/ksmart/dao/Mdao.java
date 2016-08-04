package kr.or.ksmart.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Goods;
import kr.or.ksmart.dto.Member;

//ȸ���������� Ŭ����
//��ɰ������� Ŭ���� 
public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt_select = null;
	ResultSet rs = null;
	Member m = null;
	Goods g = null;
	ArrayList<Member> alm = new ArrayList<Member>();
	ArrayList<Goods> alg = new ArrayList<Goods>();
	
	//08 ���̵� �Է¹޾� �̸��� ������ �����ϴ� �޼��� ����
	public Member mGetForSession(String in_id) throws ClassNotFoundException, SQLException{
		System.out.println("04 mSelectforUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"select m_name,m_level from tb_member where m_id=?");
		pstmt.setString(1, in_id);
		rs = pstmt.executeQuery();	
		if(rs.next()){
			m = new Member();
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
		}
		rs.close();
		pstmt.close();
		conn.close();		
		return m;
	}
	
	//07 ���̵�ͺ�� �Է¹޾� DB���̵�� ��� Ȯ�� �� �����ϴ� �޼��� ����
	//���ϻ�Ȳ : 01���̵����ġ 02�α��μ��� 03�������ġ
	public String mLoginCheck(String in_id,String in_pw) throws ClassNotFoundException, SQLException{
		System.out.println("07 mLoginCheck Mdao.java");
		String re = null;
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member where m_id=?");
		pstmt.setString(1, in_id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			if(in_pw.equals(rs.getString("m_pw"))){
				re = "02�α��μ���";
				//session������ ���� <-- ������ ���ݾ��Ѵ�
			}else{
				re = "03�������ġ";
			}
		}else{
			re = "01���̵����ġ";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	//06_G ��ǰ�˻� �޼��� ����
	public ArrayList<Goods> gSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		System.out.println("06 mSearch Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		if(sk == null & sv == null){
			System.out.println("01 sk �� sv ���� ����");
			pstmt = conn.prepareStatement("select * from tb_goods");
		}else if(sk != null & sv.equals("")){
			System.out.println("02 sk ���ְ� sv ���� ����");
			pstmt = conn.prepareStatement("select * from tb_goods");
		}else if(sk != null & sv != null){
			System.out.println("03 sk sv �Ѵ� �ִ� ����");
			pstmt = conn.prepareStatement("select * from tb_goods where "+sk+"=?");
			pstmt.setString(1, sv);
		}
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			g = new Goods();
			System.out.println(g+"<-- g gAllSelect Mdao.java");
			g.setG_code(rs.getString("G_code"));
			g.setG_name(rs.getString("G_name"));
			g.setG_cate(rs.getString("G_cate"));
			g.setG_price(rs.getString("G_price"));
			g.setG_desc(rs.getString("G_desc"));
			
			alg.add(g);
			System.out.println(alg+"<-- alg gAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return alg;
	
	}
	
	//06 ȸ���˻� �޼��� ����
	public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		System.out.println("06 mSearch Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		
		if(sk == null & sv == null){
			System.out.println("01 sk �� sv ���� ����");
			pstmt = conn.prepareStatement("select * from tb_member");
		}else if(sk != null & sv.equals("")){
			System.out.println("02 sk ���ְ� sv ���� ����");
			pstmt = conn.prepareStatement("select * from tb_member");
		}else if(sk != null & sv != null){
			System.out.println("03 sk sv �Ѵ� �ִ� ����");
			pstmt = conn.prepareStatement("select * from tb_member where "+sk+"=?");
			pstmt.setString(1, sv);
		}		
		
		
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			m = new Member();
			System.out.println(m+"<-- m mAllSelect Mdao.java");
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			
			alm.add(m);
			System.out.println(alm+"<-- alm mAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
		
	}
	
	//05_G ��ü�����ȸ �޼��� ����
	public ArrayList<Goods> gAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("05_01 gAllSelect Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_goods");
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			g = new Goods();
			
			System.out.println(g+"<-- g gAllSelect Mdao.java");
			
			g.setG_code(rs.getString("g_code"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_desc(rs.getString("g_desc"));
			
			alg.add(g);
			System.out.println(alg+"<-- alg mAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return alg;
	}
	
	//05 ��üȸ����ȸ �޼��� ����
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("05 mAllSelect Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member");
		rs = pstmt.executeQuery();
		while(rs.next()){
			m = new Member();
			System.out.println(m+"<-- m mAllSelect Mdao.java");
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			
			alm.add(m);
			System.out.println(alm+"<-- alm mAllSelect Mdao.java");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
	}
	
	//04_G �ϳ����������ȸ �޼��� ����(����ȭ�� �Ǵ� �󼼺��� ��)
	public Goods gSelectforUpdate(String gid) throws ClassNotFoundException, SQLException{
		System.out.println("04.1 gSelectforUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_goods where g_name=?");
		pstmt.setString(1, gid);
		rs = pstmt.executeQuery();	
		if(rs.next()){
			g = new Goods();
			g.setG_code(rs.getString("G_code"));
			g.setG_name(rs.getString("G_name"));
			g.setG_cate(rs.getString("G_cate"));
			g.setG_price(rs.getString("G_price"));
			g.setG_desc(rs.getString("G_desc"));
		}
		rs.close();
		pstmt.close();
		conn.close();	
		return g;
		
	}
	
	
	//04 �Ѹ�ȸ��������ȸ �޼��� ����(����ȭ�� �Ǵ� �󼼺��� ��)
	public Member mSelectforUpdate(String mid) throws ClassNotFoundException, SQLException{
		System.out.println("04 mSelectforUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member where m_id=?");
		pstmt.setString(1, mid);
		rs = pstmt.executeQuery();	
		if(rs.next()){
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
		}
		rs.close();
		pstmt.close();
		conn.close();		
		return m;
	}
	
	//03_G ����ó�� �޼��� ����
	public void gDelete(String gid) throws SQLException, ClassNotFoundException{
		System.out.println("03 gDelete Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"DELETE FROM tb_goods WHERE g_name=?");
		pstmt.setString(1, gid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//03 ����ó�� �޼��� ����
	public void mDelete(String mid) throws SQLException, ClassNotFoundException{
		System.out.println("03 mDelete Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"DELETE FROM tb_member WHERE m_id=?");
		pstmt.setString(1, mid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	
	//02_G ��� ����ó�� �޼��� ����
	public void gUpdate(Goods g) throws SQLException, ClassNotFoundException{
		System.out.println("02 gUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_Goods SET G_cate=?,G_price=?,G_desc=? WHERE G_name=?");
		System.out.println(pstmt + "<-- pstmt 1");
		
		pstmt.setString(1, g.getG_cate());
		pstmt.setString(2, g.getG_price());
		pstmt.setString(3, g.getG_desc());
		pstmt.setString(4, g.getG_name());
		pstmt.setString(5, g.getG_code());
		
		System.out.println(pstmt + "<-- pstmt 2");
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	//02 ����ó�� �޼��� ����
	public void mUpdate(Member m) throws SQLException, ClassNotFoundException{
		System.out.println("02 mUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, m.getM_pw());
		pstmt.setString(2, m.getM_level());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_email());
		pstmt.setString(5, m.getM_id());
		
		System.out.println(pstmt + "<-- pstmt 2");
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	//01_02_G ��ɵ�� �޼��� ����
	public void gInsert(Goods g) throws SQLException, ClassNotFoundException{
		System.out.println("01_02 gInsert Mdao.java");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
// �缳�� ���� 
		pstmt_select = conn.prepareStatement(
				"select MAX(substring(g_code,7)) from tb_goods");
		
		rs = pstmt_select.executeQuery();
		
		String temp = "gcode_";
		
		int result = 0;
		
		if(rs.next()){
			result = rs.getInt(1);	//�ִ밪 ���� ��� 2
			System.out.println(result + "<-- result goods_insert_pro.jsp");
			result = result + 1;	//�ִ밪 2 ���ϱ� 1�� 3
		}
		
		String g_code = temp + result;	
		
		System.out.println(g_code + "<-- g_code goods_insert_pro.jsp");
	
/*������*/g.setG_code(g_code);//������ �Ȱ���. set�ϰ� get �Ѵ�.�ƴϸ� �״�� ������ �״�� �������ش�. 
		
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?)");
		
		//pstmt.setString(1, g_code);
		
		pstmt.setString(1, g.getG_code());
		pstmt.setString(2, g.getG_name());	
		pstmt.setString(3, g.getG_cate());
		pstmt.setString(4, g.getG_price());
		pstmt.setString(5, g.getG_desc());
		
		System.out.println(pstmt + "<-- pstmt gInsert Mdao.java");
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
// �缳�� ����
	
	//01_02 ȸ����� �޼��� ����
	public void mInsert(Member m) throws SQLException, ClassNotFoundException{
		System.out.println("01_02 mInsert Mdao.java");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, m.getM_id());	
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt mInsert Mdao.java");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//01_01_G ȸ�����(����̹��ε��� DB���� ��) �޼��� ����
	public void gInsert(Goods g, Connection conn) throws SQLException{
		//3�ܰ� ���������غ���� ����
		System.out.println("01_01 gInsert Mdao.java");
		
		pstmt_select = conn.prepareStatement(
				"select MAX(substring(g_code,7)) from tb_goods");
		
		rs = pstmt_select.executeQuery();
		
		String temp = "gcode_";
		
		int result = 0;
		
		if(rs.next()){
			result = rs.getInt(1);	//�ִ밪 ���� ��� 2
			System.out.println(result + "<-- result goods_insert_pro.jsp");
			result = result + 1;	//�ִ밪 2 ���ϱ� 1�� 3
		}
		
		String g_code = temp + result;	
		
		System.out.println(g_code + "<-- g_code goods_insert_pro.jsp");
		
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?)");
		
		pstmt.setString(1, g.getG_code());	
		pstmt.setString(2, g.getG_name());	
		pstmt.setString(3, g.getG_cate());
		pstmt.setString(4, g.getG_price());
		pstmt.setString(5, g.getG_desc());
		
		System.out.println(pstmt + "<-- pstmt gInsert Mdao.java");
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	//01_01 ȸ�����(����̹��ε��� DB���� ��) �޼��� ����
	public void mInsert(Member m, Connection conn) throws SQLException{
		//3�ܰ� ���������غ���� ����
		System.out.println("01_01 mInsert Mdao.java");
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, m.getM_id());	
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt + "<-- pstmt mInsert Mdao.java");
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
}
