package kr.member.vo;

import java.sql.Date;

public class MemberVO {
	private int num; // 회원번호
	private String id; // 회원 아이디
	private String name; // 이름
	private String passwd; // 비밀번호
	private String phone; // 전화번호
	private String email; // 이메일
	private String address; // 주소
	private Date reg_date; // 회원가입 날짜

	// 비밀번호 일치 여부 체크 메소드
	public boolean isCheckedPassword(String userPasswd) {
		if (passwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
