package net.webtoon.db;

import java.sql.Timestamp;
import java.text.FieldPosition;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) {
		Date d = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyMMddHHmmss");

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		System.out.println(date.format(d).toString());
		
		//String str = "181207Test_1";
		//long val = Long.parseLong(str,36);
		//int val2 = Integer.parseInt(str);
		//System.out.println(val);
		/**
		 * 회원가입 a
네이버 b
다음 c
		 */
	}

}
