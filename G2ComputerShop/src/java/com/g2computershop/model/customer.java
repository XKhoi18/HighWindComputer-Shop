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
public class customer {
    private int customer_id;
    private String customer_name;
    private int customer_gender;
    private Date customer_DOB;
    private String customer_email;
    private String customer_phone;
    private String customer_address;
    private String customer_username;
    private String customer_pass;

    public customer() {
    }

    public customer(int customer_id, String customer_name, int customer_gender, Date customer_DOB, String customer_email, String customer_phone, String customer_address, String customer_username, String customer_pass) {
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.customer_gender = customer_gender;
        this.customer_DOB = customer_DOB;
        this.customer_email = customer_email;
        this.customer_phone = customer_phone;
        this.customer_address = customer_address;
        this.customer_username = customer_username;
        this.customer_pass = customer_pass;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public int getCustomer_gender() {
        return customer_gender;
    }

    public Date getCustomer_DOB() {
        return customer_DOB;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public String getCustomer_username() {
        return customer_username;
    }

    public String getCustomer_pass() {
        return customer_pass;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public void setCustomer_gender(int customer_gender) {
        this.customer_gender = customer_gender;
    }

    public void setCustomer_DOB(Date customer_DOB) {
        this.customer_DOB = customer_DOB;
    }

    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public void setCustomer_username(String customer_username) {
        this.customer_username = customer_username;
    }

    public void setCustomer_pass(String customer_pass) {
        this.customer_pass = customer_pass;
    }
    
}
