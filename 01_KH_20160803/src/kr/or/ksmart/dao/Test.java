package kr.or.ksmart.dao;
import java.util.ArrayList;
import kr.or.ksmart.dto.Member;
public class Test {
	public ArrayList<Member> bbb(){
		System.out.println("01 bbb Test.java");
		ArrayList<Member> al = new ArrayList<Member>();
		System.out.println(al + "<-- al ");
//1�� member���� - 0�� index�� add(�߰�)		
		Member m1 = new Member();
		System.out.println(m1 + "<-- m1 ");
		m1.setM_id("id001");
		al.add(m1);	//0�� index�� add�޼���� �ּҰ� �߰�
//2�� member���� - 1�� index�� add(�߰�)		
		Member m2 = new Member();
		System.out.println(m2 + "<-- m2 ");
		m2.setM_id("id002");
		al.add(m2);

		return al;
	}
	
	
	
	
	
	
	
	
	
	
	
}
