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
public class producttype {
    private String producttype_id;
    private String producttype_name;
    private String producttype_images;

    public producttype() {
    }

    public producttype(String producttype_id, String producttype_name, String producttype_images) {
        this.producttype_id = producttype_id;
        this.producttype_name = producttype_name;
        this.producttype_images = producttype_images;
    }

    public String getProducttype_id() {
        return producttype_id;
    }

    public void setProducttype_id(String producttype_id) {
        this.producttype_id = producttype_id;
    }

    public String getProducttype_name() {
        return producttype_name;
    }

    public void setProducttype_name(String producttype_name) {
        this.producttype_name = producttype_name;
    }

    public String getProducttype_images() {
        return producttype_images;
    }

    public void setProducttype_images(String producttype_images) {
        this.producttype_images = producttype_images;
    }

    
    
}
