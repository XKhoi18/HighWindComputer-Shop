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
public class brand {
    private String brand_id;
    private String brand_name;
    private String nation_id;

    public brand() {
    }

    public brand(String brand_id, String brand_name, String nation_id) {
        this.brand_id = brand_id;
        this.brand_name = brand_name;
        this.nation_id = nation_id;
    }

    public String getBrand_id() {
        return brand_id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public String getNation_id() {
        return nation_id;
    }

    public void setBrand_id(String brand_id) {
        this.brand_id = brand_id;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public void setNation_id(String nation_id) {
        this.nation_id = nation_id;
    }

}
