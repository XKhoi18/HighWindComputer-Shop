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
public class bill_detail {
    private int billdetail_id;
    private int bill_id;
    private int product_id;
    private int amount;

    public bill_detail() {
    }

    public bill_detail(int billdetail_id, int bill_id, int product_id, int amount) {
        this.billdetail_id = billdetail_id;
        this.bill_id = bill_id;
        this.product_id = product_id;
        this.amount = amount;
    }

    public int getBilldetail_id() {
        return billdetail_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setBilldetail_id(int billdetail_id) {
        this.billdetail_id = billdetail_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
}
