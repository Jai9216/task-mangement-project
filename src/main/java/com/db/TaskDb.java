package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDb {
	
	public static Connection getConnection() throws SQLException {
	Connection conn= null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanagement","root","");
	return conn;
	}
	
	public static int save(Task t) throws ClassNotFoundException, SQLException {
		int status= 0;
		Connection conn= getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into tm(taskname,simlink,startdate,enddate)values(?,?,?,?)");
			ps.setString(1,t.getTaskname());
			ps.setString(2, t.getSimlink());
			ps.setString(3, t.getStartdate());
			ps.setString(4, t.getEnddate());
			status= ps.executeUpdate();
		return status;
	}
	
	public static List<Task> getAllRecordsP(){
		List <Task> list = new ArrayList<Task>();
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from tm where status in ('pending','wip') ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Task t = new Task();
				t.setId(rs.getInt("id"));
				t.setTaskname(rs.getString("taskname"));
				t.setSimlink(rs.getString("simlink"));
				t.setStatus(rs.getString("status"));
				t.setStartdate(rs.getString("startdate"));
				t.setEnddate(rs.getString("enddate"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Task> getAllRecordsC(){
		List <Task> list = new ArrayList<Task>();
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from tm  where status in ('completed','parked')");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Task t = new Task();
				t.setId(rs.getInt("id"));
				t.setTaskname(rs.getString("taskname"));
				t.setStatus(rs.getString("status"));
				t.setStartdate(rs.getString("startdate"));
				t.setEnddate(rs.getString("enddate"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public static Task getRecordById(int i) {
		Task t = null;
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("Select * from tm where id = ?");
			ps.setInt(1, i);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setId(rs.getInt("id"));
				t.setTaskname(rs.getString("taskname"));
				t.setStatus(rs.getString("status"));
				t.setSimlink(rs.getString("simlink"));
				t.setStartdate(rs.getString("startdate"));
				t.setEnddate(rs.getString("enddate"));
				t.setReasonforparking(rs.getString("reasonforparking"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t;
	}
	
	public static int update(Task t) {
		int status =0;
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE tm SET status=?,simlink=?,startdate=?,enddate=?,reasonforparking=? WHERE id=?");
			ps.setString(1, t.getStatus());
			ps.setString(2, t.getSimlink());
			ps.setString(3, t.getStartdate());
			ps.setString(4, t.getEnddate());
			ps.setString(5, t.getReasonforparking());
			ps.setInt(6, t.getId());
			status= ps.executeUpdate();
			System.out.println(status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	public static int delete(Task t) {
		int status =0;
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE tm SET deletemessage=?,status=? WHERE id=?");
			ps.setString(1, t.getDeletemessage());
			ps.setString(2, "delete");
			ps.setInt(3, t.getId());
			status= ps.executeUpdate();
			System.out.println(t.getDeletemessage());
			System.out.println(t.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
}
