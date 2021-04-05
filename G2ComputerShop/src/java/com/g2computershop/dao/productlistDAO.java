/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.dao;

import com.g2computershop.model.productlist;
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
public class productlistDAO {
    private UtilityConnection uc;

    public productlistDAO() {
        uc=new UtilityConnection();
        uc.connect();
    }
    
    public boolean addNew(productlist product) {      
        String query ="INSERT INTO productlist(product_name,product_detail,product_date,purchase_price,price,discount,stock,unit_sold,warrant,brand_id,producttype_id,images) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query); 
            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getProduct_detail());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String pdd=sdf.format(product.getProduct_date());
            ps.setString(3, pdd);
            ps.setInt(4, product.getPurchase_price());
            ps.setInt(5, product.getPrice());
            ps.setInt(6, product.getDiscount());
            ps.setInt(7, product.getStock());
            ps.setInt(8, product.getUnit_sold());
            ps.setInt(9, product.getWarrant());
            ps.setString(10, product.getBrand_id());
            ps.setString(11, product.getProducttype_id());
            ps.setString(12, product.getImages());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Add new
        } catch (Exception ex) {

            JOptionPane.showMessageDialog(null, "Add New Error!!"+ex);
        }
        return false;
    }
    
    public boolean update(productlist product) {
        String query ="UPDATE productlist SET product_name=?,product_detail=?,product_date=?,purchase_price=?,price=?,discount=?,stock=?,unit_sold=?,warrant=?,brand_id=?,producttype_id=?,images=? WHERE product_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getProduct_detail());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String pdd=sdf.format(product.getProduct_date());
            ps.setString(3, pdd);
            ps.setInt(4, product.getPurchase_price());
            ps.setInt(5, product.getPrice());
            ps.setInt(6, product.getDiscount());
            ps.setInt(7, product.getStock());
            ps.setInt(8, product.getUnit_sold());
            ps.setInt(9, product.getWarrant());
            ps.setString(10, product.getBrand_id());
            ps.setString(11, product.getProducttype_id());
            ps.setString(12, product.getImages());
            
            ps.setInt(13, product.getProduct_id());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    
    public boolean updateStock(productlist product) {
        String query ="UPDATE productlist SET stock=? WHERE product_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt(1, product.getStock());
            
            ps.setInt(2, product.getProduct_id());
            
            return ps.executeUpdate()>0; //thực thi câu lệnh query Update
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Update Error!!");
        }
        return false;
    }
    
    public boolean delete(productlist product) {
        String query ="DELETE FROM productlist WHERE product_id=?";
        try {
            PreparedStatement ps= uc.getConn().prepareStatement(query);  
            ps.setInt(1, product.getProduct_id());
            return ps.executeUpdate()>0; //thực thi câu lệnh query Delete
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Delete Error!!");
        }
        return false;
    }
    
    public ArrayList<productlist> findALL() {
        ArrayList<productlist> arr=new ArrayList<productlist>();
        String query ="SELECT * FROM productlist";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                productlist pdl = new productlist();                
                pdl.setProduct_id(rs.getInt("product_id"));
                pdl.setProduct_name(rs.getString("product_name"));
                pdl.setProduct_detail(rs.getString("product_detail"));
                pdl.setProduct_date(rs.getDate("product_date"));
                pdl.setPurchase_price(rs.getInt("purchase_price"));
                pdl.setPrice(rs.getInt("price"));
                pdl.setDiscount(rs.getInt("discount"));
                pdl.setStock(rs.getInt("stock"));
                pdl.setUnit_sold(rs.getInt("unit_sold"));
                pdl.setWarrant(rs.getInt("warrant"));
                pdl.setBrand_id(rs.getString("brand_id"));
                pdl.setProducttype_id(rs.getString("producttype_id"));
                pdl.setImages(rs.getString("images"));
                arr.add(pdl);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public ArrayList<productlist> findByName(String name) {
        ArrayList<productlist> arr=new ArrayList<productlist>();
        String query ="SELECT * FROM productlist WHERE product_name like '%"+name+"%'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                productlist pdl = new productlist();                
                pdl.setProduct_id(rs.getInt("product_id"));
                pdl.setProduct_name(rs.getString("product_name"));
                pdl.setProduct_detail(rs.getString("product_detail"));
                pdl.setProduct_date(rs.getDate("product_date"));
                pdl.setPurchase_price(rs.getInt("purchase_price"));
                pdl.setPrice(rs.getInt("price"));
                pdl.setDiscount(rs.getInt("discount"));
                pdl.setStock(rs.getInt("stock"));
                pdl.setUnit_sold(rs.getInt("unit_sold"));
                pdl.setWarrant(rs.getInt("warrant"));
                pdl.setBrand_id(rs.getString("brand_id"));
                pdl.setProducttype_id(rs.getString("producttype_id"));
                pdl.setImages(rs.getString("images"));
                arr.add(pdl);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public productlist findByID(int id) {
        String query ="SELECT * FROM productlist WHERE product_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs  
                productlist pdl = new productlist();
                pdl.setProduct_id(rs.getInt("product_id"));
                pdl.setProduct_name(rs.getString("product_name"));
                pdl.setProduct_detail(rs.getString("product_detail"));
                pdl.setProduct_date(rs.getDate("product_date"));
                pdl.setPurchase_price(rs.getInt("purchase_price"));
                pdl.setPrice(rs.getInt("price"));
                pdl.setDiscount(rs.getInt("discount"));
                pdl.setStock(rs.getInt("stock"));
                pdl.setUnit_sold(rs.getInt("unit_sold"));
                pdl.setWarrant(rs.getInt("warrant"));
                pdl.setBrand_id(rs.getString("brand_id"));
                pdl.setProducttype_id(rs.getString("producttype_id"));
                pdl.setImages(rs.getString("images"));
                return pdl;
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return null;
    }
    
    public ArrayList<productlist> findByTypeID(String id) {
        ArrayList<productlist> arr=new ArrayList<>();        
        String query ="SELECT * FROM productlist WHERE producttype_id="+id;
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs      
                productlist pdl = new productlist();
                pdl.setProduct_id(rs.getInt("product_id"));
                pdl.setProduct_name(rs.getString("product_name"));
                pdl.setProduct_detail(rs.getString("product_detail"));
                pdl.setProduct_date(rs.getDate("product_date"));
                pdl.setPurchase_price(rs.getInt("purchase_price"));
                pdl.setPrice(rs.getInt("price"));
                pdl.setDiscount(rs.getInt("discount"));
                pdl.setStock(rs.getInt("stock"));
                pdl.setUnit_sold(rs.getInt("unit_sold"));
                pdl.setWarrant(rs.getInt("warrant"));
                pdl.setBrand_id(rs.getString("brand_id"));
                pdl.setProducttype_id(rs.getString("producttype_id"));
                pdl.setImages(rs.getString("images"));
                arr.add(pdl);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    
    public ArrayList<productlist> findByBrandID(String brandid) {
        ArrayList<productlist> arr = new ArrayList<productlist>();
        String query = "SELECT * FROM productlist WHERE brand_id='" + brandid + "'";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                productlist pdl = new productlist();
                pdl.setProduct_id(rs.getInt("product_id"));
                pdl.setProduct_name(rs.getString("product_name"));
                pdl.setProduct_detail(rs.getString("product_detail"));
                pdl.setProduct_date(rs.getDate("product_date"));
                pdl.setPurchase_price(rs.getInt("purchase_price"));
                pdl.setPrice(rs.getInt("price"));
                pdl.setDiscount(rs.getInt("discount"));
                pdl.setStock(rs.getInt("stock"));
                pdl.setUnit_sold(rs.getInt("unit_sold"));
                pdl.setWarrant(rs.getInt("warrant"));
                pdl.setBrand_id(rs.getString("brand_id"));
                pdl.setProducttype_id(rs.getString("producttype_id"));
                pdl.setImages(rs.getString("images"));
                arr.add(pdl);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
    public ArrayList<productlist> findProductIDlist() {
        ArrayList<productlist> arr = new ArrayList<productlist>();
        String query = "SELECT product_id FROM productlist";
        try {
            Statement stm = uc.getConn().createStatement(); //thực thi câu lệnh query 
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) { // có kết quả rs
                productlist pdl = new productlist();
                pdl.setProduct_id(rs.getInt("product_id"));
                arr.add(pdl);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error!!");
        }
        return arr;
    }
}
