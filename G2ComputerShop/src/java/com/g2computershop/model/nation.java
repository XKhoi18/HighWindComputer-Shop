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
public class nation {
    private String nation_id;
    private String nation_name;

    public nation() {
    }

    public nation(String nation_id, String nation_name) {
        this.nation_id = nation_id;
        this.nation_name = nation_name;
    }

    public String getNation_id() {
        return nation_id;
    }

    public String getNation_name() {
        return nation_name;
    }

    public void setNation_id(String nation_id) {
        this.nation_id = nation_id;
    }

    public void setNation_name(String nation_name) {
        this.nation_name = nation_name;
    }

}
