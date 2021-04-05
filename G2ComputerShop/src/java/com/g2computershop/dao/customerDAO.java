/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.customer;
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
public class customerDAO {
    private UtilityConnection uc;

    public customerDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    
    public customer findcustomerByUserPass(String user, String pass) {
        String query = "SELECT * FROM customer WHERE customer_username='"+user+"' and customer_pass='"+pass+"'"; // truy vấn SQL
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                customer em = new customer();
                em.setCustomer_id       (rs.getInt("customer_id"));
                em.setCustomer_name     (rs.getString("customer_name"));
                em.setCustomer_gender   (rs.getInt("customer_gender"));
                em.setCustomer_DOB      (rs.getDate("customer_DOB"));
                em.setCustomer_email    (rs.getString("customer_email"));
                em.setCustomer_phone    (rs.getString("customer_phone"));
                em.setCustomer_address  (rs.getString("customer_address"));
                em.setCustomer_username (rs.getString("customer_username"));
                em.setCustomer_pass     (rs.getString("customer_pass"));
                return em;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Connection Error!!");
        }
    return null;           
    }
    
    public boolean addNew(customer customer) {      
        String query ="INSERT INTO customer(customer_name,customer_gender,customer_DOB,customer_email,customer_phone,customer_address,customer_username,customer_pass) "
                    + "VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query); 
            ps.setString(1, customer.getCustomer_name());
            ps.setInt   (2, customer.getCustomer_gender());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            ps.setString(3, sdf.format(customer.getCustomer_DOB()));
            ps.setString(4, customer.getCustomer_email());
            ps.setString(5, customer.getCustomer_phone());
            ps.setString(6, customer.getCustomer_address());
            ps.setString(7, customer.getCustomer_username());
            ps.setString(8, customer.getCustomer_pass());                       
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (SQLException ex) {
//            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Add New Error!!");
        }
        return false;
    }
    
    public boolean update(customer customer) {
        String query ="UPDATE customer SET customer_name=?, customer_gender=?,customer_DOB=?";
               query+=", customer_email=?, customer_phone=?, customer_address=?, customer_username=?, customer_pass=?";
               query+=" WHERE customer_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, customer.getCustomer_name());
            ps.setInt   (2, customer.getCustomer_gender());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            ps.setString(3, sdf.format(customer.getCustomer_DOB()));
            ps.setString(4, customer.getCustomer_email());
            ps.setString(5, customer.getCustomer_phone());
            ps.setString(6, customer.getCustomer_address());
            ps.setString(7, customer.getCustomer_username());
            ps.setString(8, customer.getCustomer_pass());    
            ps.setInt   (9, customer.getCustomer_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    
    public boolean delete(customer customer) {
        String query ="DELETE FROM customer WHERE customer_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt(1, customer.getCustomer_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    
    public ArrayList<customer> findALL() {
        ArrayList<customer> arr=new ArrayList<customer>();
        String query ="SELECT * FROM customer";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                customer em = new customer();
                em.setCustomer_id       (rs.getInt("customer_id"));
                em.setCustomer_name     (rs.getString("customer_name"));
                em.setCustomer_gender   (rs.getInt("customer_gender"));
                em.setCustomer_DOB      (rs.getDate("customer_DOB"));
                em.setCustomer_email    (rs.getString("customer_email"));
                em.setCustomer_phone    (rs.getString("customer_phone"));
                em.setCustomer_address  (rs.getString("customer_address"));
                em.setCustomer_username (rs.getString("customer_username"));
                em.setCustomer_pass     (rs.getString("customer_pass"));
                arr.add(em);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public ArrayList<customer> findByName(String name) {
        ArrayList<customer> arr=new ArrayList<customer>();
        String query ="SELECT * FROM customer WHERE fullname like '%"+name+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                customer em = new customer();
                em.setCustomer_id       (rs.getInt("customer_id"));
                em.setCustomer_name     (rs.getString("customer_name"));
                em.setCustomer_gender   (rs.getInt("customer_gender"));
                em.setCustomer_DOB      (rs.getDate("customer_DOB"));
                em.setCustomer_email    (rs.getString("customer_email"));
                em.setCustomer_phone    (rs.getString("customer_phone"));
                em.setCustomer_address  (rs.getString("customer_address"));
                em.setCustomer_username (rs.getString("customer_username"));
                em.setCustomer_pass     (rs.getString("customer_pass"));
                arr.add(em);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public customer findByID(int id) {
        customer em = new customer();
        String query ="SELECT * FROM customer WHERE customer_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                em.setCustomer_id       (rs.getInt("customer_id"));
                em.setCustomer_name     (rs.getString("customer_name"));
                em.setCustomer_gender   (rs.getInt("customer_gender"));
                em.setCustomer_DOB      (rs.getDate("customer_DOB"));
                em.setCustomer_email    (rs.getString("customer_email"));
                em.setCustomer_phone    (rs.getString("customer_phone"));
                em.setCustomer_address  (rs.getString("customer_address"));
                em.setCustomer_username (rs.getString("customer_username"));
                em.setCustomer_pass     (rs.getString("customer_pass"));
                return em;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Connection Error!!");
        }
        return null;
    }
    public ArrayList<customer> fillcb_customerid() {
        ArrayList<customer> arr=new ArrayList<customer>();
        String query ="SELECT customer_id FROM customer";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                customer em = new customer();
                em.setCustomer_id(rs.getInt("customer_id"));
                arr.add(em);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public int findCustomerID(String username) {
        customer em = new customer();
        String query ="SELECT customer_id FROM customer WHERE customer_username='"+username+"'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                int customerID=rs.getInt("customer_id");
                return customerID;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Connection Error!!");
        }
        return 0;
    }
}
