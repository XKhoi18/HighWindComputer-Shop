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
public class bill {
    private int bill_id;
    private Date bill_date;
    private int manager_id;
    private int customer_id;
    private String status;

    public bill() {
    }

    public bill(int bill_id, Date bill_date, int manager_id, int customer_id, String status) {
        this.bill_id = bill_id;
        this.bill_date = bill_date;
        this.manager_id = manager_id;
        this.customer_id = customer_id;
        this.status = status;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public Date getBill_date() {
        return bill_date;
    }

    public void setBill_date(Date bill_date) {
        this.bill_date = bill_date;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
}
