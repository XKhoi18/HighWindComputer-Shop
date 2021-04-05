/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.model;

/**
 *
 * @author Admin
 */
public class inventory {
    String brand_name;
    String producttype_name;
    int stock;

    public inventory() {
    }

    public inventory(String brand_name, String producttype_name, int stock) {
        this.brand_name = brand_name;
        this.producttype_name = producttype_name;
        this.stock = stock;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public String getProducttype_name() {
        return producttype_name;
    }

    public void setProducttype_name(String producttype_name) {
        this.producttype_name = producttype_name;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
}
