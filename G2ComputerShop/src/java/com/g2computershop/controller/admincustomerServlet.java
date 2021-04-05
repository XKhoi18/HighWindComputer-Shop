/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.controller;

import com.g2computershop.dao.customerDAO;
import com.g2computershop.model.customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class admincustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            out.print("<a href=\"addcustomer.jsp\"><button class=\"button\" style='margin-left:450px;'>Add New Customer</button></a>");
            out.print("<table width='1100px';>");
            out.print("<tr>");
            out.print("<th>STT</th>");
            out.print("<th>ID</th>");
            out.print("<th style='text-align: center;'>Name</th>");
            out.print("<th>Gender</th>");
            out.print("<th width='100px;' style='text-align: center;'>DOB</th>");
            out.print("<th style='text-align: center;'>Email</th>");
            out.print("<th style='text-align: center;'>Phone</th>");
            out.print("<th style='text-align: center;'>Address</th>");
            out.print("<th style='text-align: center;'>UserName</th>");
            out.print("<th style='text-align: center;'>Password</th>");
            out.print("<th>Edit</th>");
            out.print("<th>Delete</th>");
            out.print("</tr>");
            
            customerDAO pdDAO = new customerDAO();
            ArrayList<customer> list=pdDAO.findALL();
            int i = 1;
            for(customer item: list) 
            {
                out.print("<tr>");
                out.print("<td style='text-align: center;'>" + i+" </td>");
                out.print("<td style=\"text-align: center;\">"+ item.getCustomer_id()+"</td>");
                out.print("<td> "+item.getCustomer_name()+" </td>");
                String gender;
                if(item.getCustomer_gender()==1){
                    gender = "Male";
                }
                else {
                    gender = "Female";}
                out.print("<td> "+ gender +" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getCustomer_DOB()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getCustomer_email()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getCustomer_phone()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getCustomer_address()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getCustomer_username()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getCustomer_pass()+" </td>");
                out.print("<td> <a href=editcustomer.jsp?id="+item.getCustomer_id()+">Edit</a></td>");
                out.print("<td> <a href=\\G2ComputerShop\\deletecustomerServlet?id="+item.getCustomer_id()+">Delete</a></td>");
                out.print("</tr>");
                i++;
            } 
            out.print("</table>");
            out.print("<br>");out.print("<br>");
        }catch (Exception ex) {}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
