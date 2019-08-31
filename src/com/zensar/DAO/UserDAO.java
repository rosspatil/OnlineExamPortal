package com.zensar.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import com.zensar.bean.User;
import com.zensar.util.db.ConnectionFactory;

public class UserDAO {
	
	public byte[] getImage(String userId){
		byte[] photo=new byte[100000];
		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement pst=connection.prepareStatement("Select photo From images where userid=?");
			pst.setString(1, userId);
			ResultSet rs=pst.executeQuery();
			InputStream in=rs.getBinaryStream(1);
			in.read(photo);
			System.out.println(userId);
			pst.close(); 
			connection.close(); 
		} 
		catch (SQLException e) {
			
		System.err.println(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return photo;
	}
	

	public User getUser(String userName){

		String sql = "SELECT * FROM user_details where email=?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userName);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString("phoneno"), rs.getString(6), rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	

	public boolean checkLogin(String userName, String password) {
		String sql = "SELECT email,password FROM user_details where email=? and password=?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userName);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public int getUserId(String userName) {
		String sql = "SELECT userid FROM user_details WHERE email =?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userName);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int getCount() {
		String sql = "SELECT count(userid) FROM user_details";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			return rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public void register(User user,InputStream inputStream) {
		String sql = "INSERT INTO user_details(userid,firstname,lastname,email,phoneno,password) VALUES(?,?,?,?,?,?)";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, user.getUserId());
			stmt.setString(2, user.getFirstName());
			stmt.setString(3, user.getLastName());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPhone());
			stmt.setString(6, user.getPassword());
			stmt.executeUpdate();
			PreparedStatement pst=con.prepareStatement("INSERT INTO images(userid,photo) VALUES(?,?)");
			pst.setString(1,String.valueOf(user.getUserId()));
			pst.setBlob(2, inputStream);
			pst.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	

}
