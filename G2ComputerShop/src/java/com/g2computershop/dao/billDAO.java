/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.bill;
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
public class billDAO {
    private UtilityConnection uc;

    public billDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    
    public boolean addNew(bill bill) {      
        String query ="INSERT INTO bill(bill_date,manager_id,customer_id,status) VALUES(?,?,?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            ps.setString    (1, sdf.format(bill.getBill_date()));
            ps.setInt       (2, bill.getManager_id());
            ps.setInt       (3, bill.getCustomer_id());
            ps.setString       (4, bill.getStatus());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (SQLException ex) {
//            Logger.getLogger(employee_listDAO.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Add New Error!!");
        }
        return false;
    }
    public boolean update(bill bill) {
        String query ="UPDATE bill SET bill_date=?,manager_id=?,customer_id=?,status=? WHERE bill_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            ps.setString    (1, sdf.format(bill.getBill_date()));
            ps.setInt       (2, bill.getManager_id());
            ps.setInt       (3, bill.getCustomer_id());
            ps.setString    (4, bill.getStatus());
            ps.setInt       (5, bill.getBill_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    public boolean delete(bill bill) {
        String query ="DELETE FROM bill WHERE bill_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt       (1, bill.getBill_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    public ArrayList<bill> findALL() {
        ArrayList<bill> arr=new ArrayList<bill>();
        String query ="SELECT * FROM bill";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                bill tk = new bill();
                tk.setBill_id(rs.getInt("bill_id"));               
                tk.setBill_date(rs.getDate("bill_date"));
                tk.setManager_id(rs.getInt("manager_id"));
                tk.setCustomer_id(rs.getInt("customer_id"));
                tk.setStatus(rs.getString("status"));
                arr.add(tk);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Search Error!!");
        }
        return arr;
    }
    public ArrayList<bill> findByManagerId(int id) {
        ArrayList<bill> arr=new ArrayList<bill>();
        String query ="SELECT * FROM bill WHERE manager_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                bill tk = new bill();
                tk.setBill_id(rs.getInt("bill_id"));               
                tk.setBill_date(rs.getDate("bill_date"));
                tk.setManager_id(rs.getInt("manager_id"));
                tk.setCustomer_id(rs.getInt("customer_id"));
                tk.setStatus(rs.getString("status"));
                arr.add(tk);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public bill findByBillID(int id) {
        bill tk = new bill();
        String query ="SELECT * FROM bill WHERE bill_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                tk.setBill_id(rs.getInt("bill_id"));               
                tk.setBill_date(rs.getDate("bill_date"));
                tk.setManager_id(rs.getInt("manager_id"));
                tk.setCustomer_id(rs.getInt("customer_id"));
                tk.setStatus(rs.getString("status"));
                return tk;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Search Error!!");
        }
        return null;
    }
    public int findMaxID() {
        String query ="SELECT max(bill_id) as bill_id FROM bill";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                int maxID = rs.getInt("bill_id");
                return maxID;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Search Error!!");
        }
        return 0;
    }
}
