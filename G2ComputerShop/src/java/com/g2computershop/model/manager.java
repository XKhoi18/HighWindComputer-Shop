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
public class manager {
    private int manager_id;
    private String fullname;
    private int gender;
    private Date dOB;
    private String email;
    private String phone;
    private int salary;
    private String position;
    private String username;
    private String pass;

    public manager() {
    }

    public manager(int manager_id, String fullname, int gender, Date dOB, String email, String phone, int salary, String position, String username, String pass) {
        this.manager_id = manager_id;
        this.fullname = fullname;
        this.gender = gender;
        this.dOB = dOB;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
        this.position = position;
        this.username = username;
        this.pass = pass;
    }

    public int getManager_id() {
        return manager_id;
    }

    public String getFullname() {
        return fullname;
    }

    public int getGender() {
        return gender;
    }

    public Date getdOB() {
        return dOB;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getSalary() {
        return salary;
    }

    public String getPosition() {
        return position;
    }

    public String getUsername() {
        return username;
    }

    public String getPass() {
        return pass;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public void setdOB(Date dOB) {
        this.dOB = dOB;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
