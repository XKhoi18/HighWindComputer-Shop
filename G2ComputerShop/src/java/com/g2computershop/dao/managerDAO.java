/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.manager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Admin
 */
public class managerDAO {
    private UtilityConnection uc;

    public managerDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    public manager findmanagerByUserPass(String user, String pass) {
        String query = "SELECT * FROM manager WHERE username='"+user+"' and pass='"+pass+"'"; // truy vấn SQL
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                manager ma = new manager();
                ma.setManager_id(rs.getInt("manager_id"));
                ma.setFullname(rs.getString("fullname"));
                ma.setGender(rs.getInt("gender"));
                ma.setdOB(rs.getDate("dOB"));
                ma.setEmail(rs.getString("email"));
                ma.setPhone(rs.getString("phone"));
                ma.setSalary(rs.getInt("salary"));
                ma.setPosition(rs.getString("position"));
                ma.setUsername(rs.getString("username"));
                ma.setPass(rs.getString("pass"));
                return ma;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Connection Error!!");
        }
    return null;           
    }
    public boolean addNew(manager manager) {      
        String query ="INSERT INTO manager(fullname,gender,dOB,email,phone,salary,position,username,pass) VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query); 
            
            ps.setString(1, manager.getFullname());
            ps.setInt(2, manager.getGender());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String dOB=sdf.format(manager.getdOB());
            ps.setString(3, dOB);
            ps.setString(4, manager.getEmail());
            ps.setString(5, manager.getPhone());
            ps.setInt(6, manager.getSalary());
            ps.setString(7, manager.getPosition());
            ps.setString(8, manager.getUsername());
            ps.setString(9, manager.getPass());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (SQLException ex) {

            JOptionPane.showMessageDialog(null, "Add New Error!!");
        }
        return false;
    }
    public boolean update(manager manager) {
        String query ="UPDATE manager SET fullname=?,gender=?,dOB=?,email=?,phone=?,salary=?,position=?,username=?,pass=? WHERE manager_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, manager.getFullname());
            ps.setInt(2, manager.getGender());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String dOB=sdf.format(manager.getdOB());
            ps.setString(3, dOB);
            ps.setString(4, manager.getEmail());
            ps.setString(5, manager.getPhone());
            ps.setInt(6, manager.getSalary());
            ps.setString(7, manager.getPosition());
            ps.setString(8, manager.getUsername());
            ps.setString(9, manager.getPass());
            ps.setInt(10, manager.getManager_id());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    public boolean delete(manager manager) {
        String query ="DELETE FROM manager WHERE manager_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt(1, manager.getManager_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    public ArrayList<manager> findALL() {
        ArrayList<manager> arr=new ArrayList<manager>();
        String query ="SELECT * FROM manager";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                manager ma = new manager();
                ma.setManager_id(rs.getInt("manager_id"));
                ma.setFullname(rs.getString("fullname"));
                ma.setGender(rs.getInt("gender"));
                ma.setdOB(rs.getDate("dOB"));
                ma.setEmail(rs.getString("email"));
                ma.setPhone(rs.getString("phone"));
                ma.setSalary(rs.getInt("salary"));
                ma.setPosition(rs.getString("position"));
                ma.setUsername(rs.getString("username"));
                ma.setPass(rs.getString("pass"));
                arr.add(ma);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public ArrayList<manager> findByName(String name) {
        ArrayList<manager> arr=new ArrayList<manager>();
        String query ="SELECT * FROM manager WHERE fullname like '%"+name+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                manager ma = new manager();
                ma.setManager_id(rs.getInt("manager_id"));
                ma.setFullname(rs.getString("fullname"));
                ma.setGender(rs.getInt("gender"));
                ma.setdOB(rs.getDate("dOB"));
                ma.setEmail(rs.getString("email"));
                ma.setPhone(rs.getString("phone"));
                ma.setSalary(rs.getInt("salary"));
                ma.setPosition(rs.getString("position"));
                ma.setUsername(rs.getString("username"));
                ma.setPass(rs.getString("pass"));
                arr.add(ma);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public manager findByID(int id) {
        manager ma = new manager();
        String query ="SELECT * FROM manager WHERE manager_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                ma.setManager_id(rs.getInt("manager_id"));
                ma.setFullname(rs.getString("fullname"));
                ma.setGender(rs.getInt("gender"));
                ma.setdOB(rs.getDate("dOB"));
                ma.setEmail(rs.getString("email"));
                ma.setPhone(rs.getString("phone"));
                ma.setSalary(rs.getInt("salary"));
                ma.setPosition(rs.getString("position"));
                ma.setUsername(rs.getString("username"));
                ma.setPass(rs.getString("pass"));
                return ma;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return null;
    }
}
