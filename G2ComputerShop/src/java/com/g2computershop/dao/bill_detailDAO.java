/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.bill_detail;
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
public class bill_detailDAO {
    private UtilityConnection uc;

    public bill_detailDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    
    public boolean addNew(bill_detail bill) {      
        String query ="INSERT INTO bill_detail(bill_id,product_id,amount) VALUES(?,?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);
            ps.setInt       (1, bill.getBill_id());
            ps.setInt       (2, bill.getProduct_id());
            ps.setInt       (3, bill.getAmount());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (SQLException ex) {
//            Logger.getLogger(employee_listDAO.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Add New Error!!");
        }
        return false;
    }
    public boolean update(bill_detail bill) {
        String query ="UPDATE bill_detail SET bill_id=?,product_id=?,amount=? WHERE billdetail_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt       (1, bill.getBill_id());
            ps.setInt       (2, bill.getProduct_id());
            ps.setInt       (3, bill.getAmount());
            ps.setInt       (4, bill.getBilldetail_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    public boolean delete(bill_detail bill) {
        String query ="DELETE FROM bill_detail WHERE billdetail_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt       (1, bill.getBilldetail_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    public ArrayList<bill_detail> findALL() {
        ArrayList<bill_detail> arr=new ArrayList<bill_detail>();
        String query ="SELECT * FROM bill_detail";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                bill_detail tk = new bill_detail();
                tk.setBilldetail_id(rs.getInt("billdetail_id"));               
                tk.setBill_id      (rs.getInt("bill_id"));
                tk.setProduct_id   (rs.getInt("product_id"));
                tk.setAmount       (rs.getInt("amount"));
                arr.add(tk);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Search Error!!");
        }
        return arr;
    }
    public ArrayList<bill_detail> findByBillId(int id) {
        ArrayList<bill_detail> arr=new ArrayList<bill_detail>();
        String query ="SELECT * FROM bill_detail WHERE bill_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                bill_detail tk = new bill_detail();
                tk.setBilldetail_id(rs.getInt("billdetail_id"));               
                tk.setBill_id      (rs.getInt("bill_id"));
                tk.setProduct_id   (rs.getInt("product_id"));
                tk.setAmount       (rs.getInt("amount"));
                arr.add(tk);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public bill_detail findBybillDetailID(int id) {
        bill_detail tk = new bill_detail();
        String query ="SELECT * FROM bill_detail WHERE billdetail_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs                
                tk.setBilldetail_id(rs.getInt("billdetail_id"));               
                tk.setBill_id      (rs.getInt("bill_id"));
                tk.setProduct_id   (rs.getInt("product_id"));
                tk.setAmount       (rs.getInt("amount"));
                return tk;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Search Error!!");
        }
        return null;
    }
}
