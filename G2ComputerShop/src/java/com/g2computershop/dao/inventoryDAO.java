/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.inventory;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Admin
 */
public class inventoryDAO {
    private UtilityConnection uc;

    public inventoryDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    
    public ArrayList<inventory> findALL() {
        ArrayList<inventory> arr=new ArrayList<inventory>();
        String query ="select brand.brand_name,producttype.producttype_name,sum(productlist.stock) as stock from producttype join productlist on producttype.producttype_id=productlist.producttype_id join brand on brand.brand_id=productlist.brand_id group by brand.brand_name , producttype.producttype_name order by brand.brand_name";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                inventory iv = new inventory();
                iv.setBrand_name(rs.getString("brand_name"));
                iv.setProducttype_name(rs.getString("producttype_name"));
                iv.setStock(rs.getInt("stock"));
                
                arr.add(iv);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public ArrayList<inventory> findbySearch(String name) {
        ArrayList<inventory> arr=new ArrayList<inventory>();
        String query ="select brand.brand_name,producttype.producttype_name,sum(productlist.stock) as stock from producttype join productlist on producttype.producttype_id=productlist.producttype_id join brand on brand.brand_id=productlist.brand_id where producttype.producttype_name like '%"+name+"%' group by brand.brand_name , producttype.producttype_name order by brand.brand_name";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                inventory iv = new inventory();
                iv.setBrand_name(rs.getString("brand_name"));
                iv.setProducttype_name(rs.getString("producttype_name"));
                iv.setStock(rs.getInt("stock"));
                
                arr.add(iv);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
}
