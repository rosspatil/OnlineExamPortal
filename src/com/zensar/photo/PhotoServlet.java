package com.zensar.photo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PhotoServlet
 */
public class PhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhotoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    final String DB_URL = "jdbc:mysql://localhost:3306/online_exam";
	    final String User = "roshan";
	    final String Password = "hibuddy";
	    String userId=request.getParameter("userId");
	    System.out.println(userId);
	    try {
	        Class.forName(JDBC_DRIVER);
	        Connection conn = DriverManager.getConnection(DB_URL, User, Password);
	        response.setContentType("image/gif");
	        PreparedStatement stmt = conn.prepareStatement("select photo from images where userid=?");
	        stmt.setString(1, userId);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            response.getOutputStream().write(rs.getBytes("photo"));
	        }
	        conn.close();
	       
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
