/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class productlist {
    private int product_id;
    private String product_name;
    private String product_detail;
    private Date product_date;
    private int purchase_price;
    private int price;
    private int discount;
    private int stock;
    private int unit_sold;
    private int warrant;
    private String brand_id;
    private String producttype_id;
    private String images;

    public productlist() {
    }

    public productlist(int product_id, String product_name, String product_detail, Date product_date, int purchase_price, int price, int discount, int stock, int unit_sold, int warrant, String brand_id, String producttype_id, String images) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_detail = product_detail;
        this.product_date = product_date;
        this.purchase_price = purchase_price;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
        this.unit_sold = unit_sold;
        this.warrant = warrant;
        this.brand_id = brand_id;
        this.producttype_id = producttype_id;
        this.images = images;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_detail() {
        return product_detail;
    }

    public void setProduct_detail(String product_detail) {
        this.product_detail = product_detail;
    }

    public Date getProduct_date() {
        return product_date;
    }

    public void setProduct_date(Date product_date) {
        this.product_date = product_date;
    }

    public int getPurchase_price() {
        return purchase_price;
    }

    public void setPurchase_price(int purchase_price) {
        this.purchase_price = purchase_price;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getUnit_sold() {
        return unit_sold;
    }

    public void setUnit_sold(int unit_sold) {
        this.unit_sold = unit_sold;
    }

    public int getWarrant() {
        return warrant;
    }

    public void setWarrant(int warrant) {
        this.warrant = warrant;
    }

    public String getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(String brand_id) {
        this.brand_id = brand_id;
    }

    public String getProducttype_id() {
        return producttype_id;
    }

    public void setProducttype_id(String producttype_id) {
        this.producttype_id = producttype_id;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
