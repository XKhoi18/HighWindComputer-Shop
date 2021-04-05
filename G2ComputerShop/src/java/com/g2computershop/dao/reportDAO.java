/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.report;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;

/**
 *
 * @author Admin
 */
public class reportDAO {
    private UtilityConnection uc;

    public reportDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    
    public ArrayList<report> findALL() {
        ArrayList<report> arr=new ArrayList<report>();
        String query ="Select bill.bill_id,bill.bill_date,bill_detail.amount,productlist.product_id,productlist.purchase_price,productlist.price,productlist.discount,((productlist.price*(100-productlist.discount)/100)-productlist.purchase_price)*bill_detail.amount as profit from bill join bill_detail on bill.bill_id = bill_detail.bill_id join productlist on bill_detail.product_id = productlist.product_id";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                report rp = new report();
                rp.setBill_id(rs.getInt("bill_id"));
                rp.setBill_date(rs.getDate("bill_date"));
                rp.setAmount(rs.getInt("amount"));
                rp.setProduct_id(rs.getInt("product_id"));
                rp.setPurchase_price(rs.getInt("purchase_price"));
                rp.setPrice(rs.getInt("price"));
                rp.setDiscount(rs.getInt("discount"));
                rp.setProfit(rs.getFloat("profit"));
                arr.add(rp);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public ArrayList<report> findByDate(String day1, String day2) {
        ArrayList<report> arr=new ArrayList<report>();
        String query = "Select bill.bill_id,bill.bill_date,bill_detail.amount,productlist.product_id,productlist.purchase_price,productlist.price,productlist.discount,((productlist.price*(100-productlist.discount)/100)-productlist.purchase_price)*bill_detail.amount as profit from bill join bill_detail on bill.bill_id = bill_detail.bill_id join productlist on bill_detail.product_id = productlist.product_id where bill.bill_date BETWEEN '"+day1+"' AND '"+day2+"'";

        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                report rp = new report();                
                rp.setBill_id(rs.getInt("bill_id"));
                rp.setBill_date(rs.getDate("bill_date"));
                rp.setAmount(rs.getInt("amount"));
                rp.setProduct_id(rs.getInt("product_id"));
                rp.setPurchase_price(rs.getInt("purchase_price"));
                rp.setPrice(rs.getInt("price"));
                rp.setDiscount(rs.getInt("discount"));
                rp.setProfit(rs.getFloat("profit"));
                arr.add(rp);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error2!!");
        }
        return arr;
    }
}
