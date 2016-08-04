package kr.or.ksmart.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Goods;
import kr.or.ksmart.dto.Member;

//회원관리위한 클래스
//재능관리위한 클래스 
public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt_select = null;
	ResultSet rs = null;
	Member m = null;
	Goods g = null;
	ArrayList<Member> alm = new ArrayList<Member>();
	ArrayList<Goods> alg = new ArrayList<Goods>();
	
	//08 아이디를 입력받아 이름과 권한을 리턴하는 메서드 선언
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
	
	//07 아이디와비번 입력받아 DB아이디와 비번 확인 후 리턴하는 메서드 선언
	//리턴상황 : 01아이디불일치 02로그인성공 03비번불일치
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
				re = "02로그인성공";
				//session영역에 셋팅 <-- 하지만 지금안한다
			}else{
				re = "03비번불일치";
			}
		}else{
			re = "01아이디불일치";
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	//06_G 상품검색 메서드 선언
	public ArrayList<Goods> gSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		System.out.println("06 mSearch Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		if(sk == null & sv == null){
			System.out.println("01 sk 널 sv 널인 조건");
			pstmt = conn.prepareStatement("select * from tb_goods");
		}else if(sk != null & sv.equals("")){
			System.out.println("02 sk 값있고 sv 공백 조건");
			pstmt = conn.prepareStatement("select * from tb_goods");
		}else if(sk != null & sv != null){
			System.out.println("03 sk sv 둘다 있는 조건");
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
	
	//06 회원검색 메서드 선언
	public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		System.out.println("06 mSearch Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		
		if(sk == null & sv == null){
			System.out.println("01 sk 널 sv 널인 조건");
			pstmt = conn.prepareStatement("select * from tb_member");
		}else if(sk != null & sv.equals("")){
			System.out.println("02 sk 값있고 sv 공백 조건");
			pstmt = conn.prepareStatement("select * from tb_member");
		}else if(sk != null & sv != null){
			System.out.println("03 sk sv 둘다 있는 조건");
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
	
	//05_G 전체재능조회 메서드 선언
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
	
	//05 전체회원조회 메서드 선언
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
	
	//04_G 하나재능정보조회 메서드 선언(수정화면 또는 상세보기 등)
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
	
	
	//04 한명회원정보조회 메서드 선언(수정화면 또는 상세보기 등)
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
	
	//03_G 삭제처리 메서드 선언
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
	
	//03 삭제처리 메서드 선언
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
	
	
	//02_G 재능 수정처리 메서드 선언
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
	
	//02 수정처리 메서드 선언
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
	
	//01_02_G 재능등록 메서드 선언
	public void gInsert(Goods g) throws SQLException, ClassNotFoundException{
		System.out.println("01_02 gInsert Mdao.java");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
// 재설정 시작 
		pstmt_select = conn.prepareStatement(
				"select MAX(substring(g_code,7)) from tb_goods");
		
		rs = pstmt_select.executeQuery();
		
		String temp = "gcode_";
		
		int result = 0;
		
		if(rs.next()){
			result = rs.getInt(1);	//최대값 예를 들어 2
			System.out.println(result + "<-- result goods_insert_pro.jsp");
			result = result + 1;	//최대값 2 더하기 1은 3
		}
		
		String g_code = temp + result;	
		
		System.out.println(g_code + "<-- g_code goods_insert_pro.jsp");
	
/*선생님*/g.setG_code(g_code);//패턴은 똑같다. set하고 get 한다.아니면 그대로 받은값 그대로 연결해준다. 
		
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
// 재설정 종료
	
	//01_02 회원등록 메서드 선언
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
	
	//01_01_G 회원등록(드라이버로딩과 DB연결 후) 메서드 선언
	public void gInsert(Goods g, Connection conn) throws SQLException{
		//3단계 쿼리실행준비부터 시작
		System.out.println("01_01 gInsert Mdao.java");
		
		pstmt_select = conn.prepareStatement(
				"select MAX(substring(g_code,7)) from tb_goods");
		
		rs = pstmt_select.executeQuery();
		
		String temp = "gcode_";
		
		int result = 0;
		
		if(rs.next()){
			result = rs.getInt(1);	//최대값 예를 들어 2
			System.out.println(result + "<-- result goods_insert_pro.jsp");
			result = result + 1;	//최대값 2 더하기 1은 3
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
	//01_01 회원등록(드라이버로딩과 DB연결 후) 메서드 선언
	public void mInsert(Member m, Connection conn) throws SQLException{
		//3단계 쿼리실행준비부터 시작
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
