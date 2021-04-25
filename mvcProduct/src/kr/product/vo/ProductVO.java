package kr.product.vo;

import java.sql.Date;

public class ProductVO {
	// 프로퍼티
	private int num; // 글번호
	private String name; // 이름
	private int price; // 가격
	private int stock; // 수량
	private String origin; // 원산지
	private String content; // 내용
	private Date reg_date; // 등록날짜(데이터베이스용 날짜로 java.util이 아닌 sql date)

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
