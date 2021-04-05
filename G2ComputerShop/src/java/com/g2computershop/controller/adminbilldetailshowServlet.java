/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.controller;

import com.g2computershop.dao.billDAO;
import com.g2computershop.dao.bill_detailDAO;
import com.g2computershop.dao.customerDAO;
import com.g2computershop.dao.productlistDAO;
import com.g2computershop.model.bill;
import com.g2computershop.model.bill_detail;
import com.g2computershop.model.customer;
import com.g2computershop.model.productlist;
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
public class adminbilldetailshowServlet extends HttpServlet {

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
            int billID=Integer.parseInt(request.getParameter("billID"));
            billDAO biDAO = new billDAO();
            bill rs = biDAO.findByBillID(billID);
            customerDAO cusDAO= new customerDAO();
            customer rs_cus = cusDAO.findByID(rs.getCustomer_id());
            
            out.print("<br>");out.print("<br>");
            out.print("<table width='550px' >");
            out.print("<tr>");
            out.print("<th border=0 style=\"text-align: center;\">Bill ID</th>");
            out.print("<td width='400px' style=\"text-align: center;\">"+rs.getBill_id()+"</td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<th style=\"text-align: center;\">Bill Date</th>");
            out.print("<td style=\"text-align: center;\">"+rs.getBill_date()+"</td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<th style=\"text-align: center;\">Customer Name</th>");
            out.print("<td style=\"text-align: center;\">"+rs_cus.getCustomer_name()+"</td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<th style=\"text-align: center;\">Status</th>");
            out.print("<td style=\"text-align: center;\">"+rs.getStatus()+"</td>");
            out.print("</tr>");
            out.print("</table>");
            out.print("<br>");out.print("<br>");
            
            out.print("<table border=1 width='900px'>");
            out.print("<tr>");
            out.print("<th></th>");
            out.print("<th width='400px' style=\"text-align: center;\">Product</th>");
            out.print("<th style=\"text-align: center;\">Price</th>");
            out.print("<th style=\"text-align: center;\">Amount</th>");
            out.print("<th style=\"text-align: center;\">Sum</th>");
            out.print("</tr>");
            
            bill_detailDAO bidDAO = new bill_detailDAO();
            ArrayList<bill_detail> list=bidDAO.findByBillId(rs.getBill_id());
            productlistDAO proDAO = new productlistDAO();
            int i = 1;
            float total = 0;
            for(bill_detail item: list)
                {
                    productlist rs_pro = proDAO.findByID(item.getProduct_id());
                    out.print("<tr>");
                    out.print("<td style=\"text-align: center;\">"+i+"</td>");
                    out.print("<td style=\"text-align: center;\">"+rs_pro.getProduct_name()+"</td>");
                    out.print("<td style=\"text-align: center;\">$"+rs_pro.getPrice()*(100-rs_pro.getDiscount())/100+"</td>");
                    out.print("<td style=\"text-align: center;\">"+item.getAmount()+"</td>");
                    float sum = item.getAmount()*(rs_pro.getPrice()*(100-rs_pro.getDiscount())/100);
                    out.print("<td style=\"text-align: center;\">$"+sum+"</td>");
                    out.print("</tr>");
                    i++;
                    total = total+ (item.getAmount()*rs_pro.getPrice());
                }
                    out.print("<tr style=';font-size: 22px;'>");
                    out.print("<th colspan='4' style=\"text-align: right;\">Total</th>");
                    out.print("<th style=\"text-align: center\">$"+total+"</th>");
                    out.print("</tr>");
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
