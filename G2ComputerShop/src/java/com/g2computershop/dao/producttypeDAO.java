/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.producttype;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Admin
 */
public class producttypeDAO 
{
    private UtilityConnection uc;

    public producttypeDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
      public boolean addNew(producttype productT) {      
        String query ="INSERT INTO producttype(producttype_name,producttype_images) VALUES(?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);
            ps.setString(1, productT.getProducttype_name());
            ps.setString(2, productT.getProducttype_images());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (SQLException ex) {

            JOptionPane.showMessageDialog(null, "Add New Error!!");
        }
        return false;
    }
    public boolean update(producttype productT) {
        String query ="UPDATE producttype SET producttype_name=?,producttype_images=? WHERE producttype_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, productT.getProducttype_name());
            ps.setString(2, productT.getProducttype_images());
            ps.setString(3, productT.getProducttype_id());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    public boolean delete(producttype productT) {
        String query ="DELETE FROM producttype WHERE producttype_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, productT.getProducttype_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    public ArrayList<producttype> findALL() {
        ArrayList<producttype> arr=new ArrayList<producttype>();
        String query ="SELECT * FROM producttype";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                producttype pdt = new producttype();                
                pdt.setProducttype_id(rs.getString("producttype_id"));
                pdt.setProducttype_name(rs.getString("producttype_name"));
                pdt.setProducttype_images(rs.getString("producttype_images"));
                arr.add(pdt);
            }
            return arr;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return null;
    }
    public ArrayList<producttype> findByName(String name) {
        ArrayList<producttype> arr=new ArrayList<producttype>();
        String query ="SELECT * FROM producttype WHERE producttype_name like '%"+name+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                producttype pdt = new producttype();                
                pdt.setProducttype_id(rs.getString("producttype_id"));
                pdt.setProducttype_name(rs.getString("producttype_name"));
                pdt.setProducttype_images(rs.getString("producttype_images"));
                arr.add(pdt);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public producttype findByID(String id) {
        producttype pdt = new producttype();
        String query ="SELECT * FROM producttype WHERE producttype_id like '%"+id+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                pdt.setProducttype_id(rs.getString("producttype_id"));
                pdt.setProducttype_name(rs.getString("producttype_name"));
                pdt.setProducttype_images(rs.getString("producttype_images"));
                return pdt;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return null;
    }
    

}
