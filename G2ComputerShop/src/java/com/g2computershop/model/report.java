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
public class report {
    private int bill_id;
    private Date bill_date;
    private int amount;
    private int product_id;
    private int purchase_price;
    private int price;
    private int discount;
    private float profit;

    public report() {
    }

    public report(int bill_id, Date bill_date, int amount, int product_id, int purchase_price, int price, int discount, float profit) {
        this.bill_id = bill_id;
        this.bill_date = bill_date;
        this.amount = amount;
        this.product_id = product_id;
        this.purchase_price = purchase_price;
        this.price = price;
        this.discount = discount;
        this.profit = profit;
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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    public float getProfit() {
        return profit;
    }

    public void setProfit(float profit) {
        this.profit = profit;
    }
}
