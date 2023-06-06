package com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjspjava.bean.User;

public class UserDAO {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java-jdbc", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return conn;
	}
	
	public static List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstm = conn.prepareStatement("SELECT * FROM users");
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				User user = new User();

				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setCountry(rs.getString("country"));
				
				list.add(user);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public static List<User> getUserPaginated(int start, int total) {
		List<User> list = new ArrayList<User>();
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstm = conn.prepareStatement("SELECT * FROM users LIMIT ?,?");
			pstm.setInt(1, start);
			pstm.setInt(2, total);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setCountry(rs.getString("country"));
				
				list.add(user);
			}
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	
	public static User getUser(int userId) {
		User user = null;
		
		try {
			Connection conn = getConnection();

			PreparedStatement pstm = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
			pstm.setInt(1, userId);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setCountry(rs.getString("country"));
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return user;
	}
	
	public static int updateUser(User u) {
		int status = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstm = conn.prepareStatement("UPDATE users SET "
					+ "name=?, "
					+ "password=?, "
					+ "email=?, "
					+ "gender=?, "
					+ "country=? "
					+ "WHERE id=?");
			
			pstm.setString(1, u.getName());
			pstm.setString(2, u.getPassword());
			pstm.setString(3, u.getEmail());
			pstm.setString(4, u.getGender());
			pstm.setString(5, u.getCountry());
			pstm.setInt(6, u.getId());
			
			status = pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int addUser(User u) {
		int status = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstm = conn.prepareStatement("INSERT INTO users "
					+ "(name, password, email, gender, country) "
					+ "VALUES (?,?,?,?,?)");
			
			pstm.setString(1, u.getName());
			pstm.setString(2, u.getPassword());
			pstm.setString(3, u.getEmail());
			pstm.setString(4, u.getGender());
			pstm.setString(5, u.getCountry());
			
			status = pstm.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int removeUser(User u) {
		int status = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstm = conn.prepareStatement("DELETE FROM users WHERE id=?");
			pstm.setInt(1, u.getId());
			
			status = pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
			
		}

		return status;
	}
	
	public static int removeUserById(int userId) {
		int status = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstm = conn.prepareStatement("DELETE FROM users WHERE id=?");
			pstm.setInt(1, userId);
			
			status = pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
			
		}

		return status;
	}
}
