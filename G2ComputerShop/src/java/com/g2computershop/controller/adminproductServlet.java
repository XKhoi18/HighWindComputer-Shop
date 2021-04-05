/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.controller;

import com.g2computershop.dao.productlistDAO;
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
public class adminproductServlet extends HttpServlet {

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
            out.print("<a href=\"addproduct.jsp\"><button class=\"button\" style='margin-left:450px;'>Add New Product</button></a>");
            out.print("<table border=1 width='1200px' style='margin-left: 50px;'>");
            out.print("<tr>");
            out.print("<th>STT</th>");
            out.print("<th>ID</th>");
            out.print("<th style='text-align: center;'>Name</th>");
            out.print("<th style='text-align: center;'>Product_Description</th>");
            out.print("<th>Product_Date</th>");
            out.print("<th>Purchase Price</th>");
            out.print("<th>Price</th>");
            out.print("<th>Discount</th>");
            out.print("<th>Stock</th>");
            out.print("<th>Unit Sold</th>");
            out.print("<th>Warrant</th>");
            out.print("<th>Type_ID</th>");
            out.print("<th>Brand_ID</th>");
            out.print("<th style=\"text-align: center;\">Images</th>");
            out.print("<th>Edit</th>");
            out.print("<th>Delete</th>");
            out.print("</tr>");          
            out.print("<tr>");
            out.print("</tr>");

            productlistDAO pdDAO = new productlistDAO();
            ArrayList<productlist> list=pdDAO.findALL();
            int i = 1;
            for(productlist item: list) 
            {   
                out.print("<tr>");
                out.print("<td style=\"text-align: center;\">" + i+" </td>");
                out.print("<td style=\"text-align: center;\">"+ item.getProduct_id()+"</td>");
                out.print("<td style=\"text-align: center;font-size:10px;\"> "+item.getProduct_name()+" </td>");
                out.print("<td style=\"text-align: center;font-size:10px;\"> "+item.getProduct_detail()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getProduct_date()+" </td>");
                out.print("<td style=\"text-align: center;\"> $"+item.getPurchase_price()+" </td>");
                out.print("<td style=\"text-align: center;\"> $"+item.getPrice()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getDiscount()+"% </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getStock()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getUnit_sold()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getWarrant()+" year </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getProducttype_id()+" </td>");
                out.print("<td style=\"text-align: center;\"> "+item.getBrand_id()+" </td>");     
                out.print("<td style=\"text-align: center;\"> <img width='100px'; src='../images/product/"+item.getImages()+"'></td>");
                out.print("<td> <a href=editproduct.jsp?id="+item.getProduct_id()+">Edit</a></td>");
                out.print("<td> <a href=\\G2ComputerShop\\deleteproductServlet?id="+item.getProduct_id()+">Delete</a></td>");
                out.print("</tr>");
                
                i++;
            }
        out.print("</table>");
        out.print("<br>");out.print("<br>");
    } catch (Exception ex) {}
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
