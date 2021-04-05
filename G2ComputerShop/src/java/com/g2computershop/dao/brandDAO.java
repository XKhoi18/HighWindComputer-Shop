/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.brand;
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
public class brandDAO {
    private UtilityConnection uc;

    public brandDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    public boolean addNew(brand brand) {      
        String query ="INSERT INTO brand(brand_name,nation_id) VALUES(?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query); 
            ps.setString(1, brand.getBrand_name());
            ps.setString(2, brand.getNation_id());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (SQLException ex) {

            JOptionPane.showMessageDialog(null, "Add New Error!!");
        }
        return false;
    }
    public boolean update(brand brand) {
        String query ="UPDATE brand SET brand_name=?,nation_id=? WHERE brand_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, brand.getBrand_name());
            ps.setString(2, brand.getNation_id());
            ps.setString(3, brand.getBrand_id());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    public boolean delete(brand brand) {
        String query ="DELETE FROM brand WHERE brand_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, brand.getBrand_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    public ArrayList<brand> findALL() {
        ArrayList<brand> arr=new ArrayList<brand>();
        String query ="SELECT * FROM brand";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                brand br = new brand();
                br.setBrand_id(rs.getString("brand_id"));
                br.setBrand_name(rs.getString("brand_name"));
                br.setNation_id(rs.getString("nation_id"));
                arr.add(br);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public ArrayList<brand> findByName(String name) {
        ArrayList<brand> arr=new ArrayList<brand>();
        String query ="SELECT * FROM brand WHERE brand_name like '%"+name+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                brand br = new brand();
                br.setBrand_id(rs.getString("brand_id"));
                br.setBrand_name(rs.getString("brand_name"));
                br.setNation_id(rs.getString("nation_id"));
                arr.add(br);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public brand findByID(String id) {
        brand br = new brand();
        String query ="SELECT * FROM brand WHERE brand_id like '%"+id+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                br.setBrand_id(rs.getString("brand_id"));
                br.setBrand_name(rs.getString("brand_name"));
                br.setNation_id(rs.getString("nation_id"));
                return br;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return null;
    }
}
