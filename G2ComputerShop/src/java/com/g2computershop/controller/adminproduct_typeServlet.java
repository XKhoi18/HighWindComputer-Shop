/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.controller;

import com.g2computershop.dao.producttypeDAO;
import com.g2computershop.model.producttype;
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
public class adminproduct_typeServlet extends HttpServlet {

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
        try  {
            PrintWriter out = response.getWriter();
            out.print("<a href=\"addproducttype.jsp\"><button class=\"button\" style='margin-left:430px;'>Add New Product Type</button></a>");
            out.print("<table border=1 width='900px'>");
            out.print("<tr>");
            out.print("<th style='text-align: center;'>STT</th>");
            out.print("<th style='text-align: center;'>ID</th>");
            out.print("<th style='text-align: center;'>Product Type</th>");
            out.print("<th style='text-align: center;'>Icon</th>");
            out.print("<th>Edit</th>");
            out.print("<th>Delete</th>");
            out.print("</tr>");
            
            
            producttypeDAO pdtDAO = new producttypeDAO();
            ArrayList<producttype> list=pdtDAO.findALL();
            int i = 1;
            for(producttype item: list){
                    out.print("<tr>");
                    out.print("<td style='text-align: center;'>" + i+" </td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getProducttype_id()+"</td>");
                    out.print("<td style='text-align: center;'> "+item.getProducttype_name()+" </td>");
                    out.print("<td style=\"text-align: center;\"> <img width='50px'; src='../img/nav_items/"+item.getProducttype_images()+"'></td>");
                    out.print("<td> <a href=editproducttype.jsp?id="+item.getProducttype_id()+">Edit</a></td>");
                    out.print("<td> <a href=\\G2ComputerShop\\deleteproducttypeServlet?id="+item.getProducttype_id()+">Delete</a></td>");
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
