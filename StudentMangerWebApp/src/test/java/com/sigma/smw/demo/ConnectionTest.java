package com.sigma.smw.demo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionTest {

	public static void main(String[] args) {
		String jdbcUrl1 = "jdbc:mysql://localhost:3306/spring_security?useSSL=false";
		String jdbcUrl2 = "jdbc:mysql://localhost:3306/student_details?useSSL=false";
		
		String user = "root";
		String pass = "root";
		
		try {
			System.out.println("Connecting to database: "+ jdbcUrl1);
			System.out.println("Connecting to database: "+ jdbcUrl2);
			
			
			Connection myConn1 =
					DriverManager.getConnection(jdbcUrl1,user,pass);
			Connection myConn2 =
					DriverManager.getConnection(jdbcUrl2,user,pass);
			
			System.out.println("Connection Succesfull!"+ myConn1);
			System.out.println("Connection Succesfull!"+ myConn2);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
