/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.controller;

import com.g2computershop.dao.bill_detailDAO;
import com.g2computershop.dao.productlistDAO;
import com.g2computershop.model.bill_detail;
import com.g2computershop.model.productlist;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class editbilldetailServlet extends HttpServlet {

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
            bill_detailDAO bidDAO=new bill_detailDAO();
            int id=Integer.parseInt(request.getParameter("billdetail_id"));
            bill_detail bid=bidDAO.findBybillDetailID(id);
            int amount=bid.getAmount();
            
            bid.setBill_id(Integer.parseInt(request.getParameter("bill_id")));
            bid.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
            bid.setAmount(Integer.parseInt(request.getParameter("amount")));
            
            productlistDAO proDAO=new productlistDAO();
            int id2=Integer.parseInt(request.getParameter("product_id"));
            productlist pro=proDAO.findByID(id2);
            pro.setStock(pro.getStock()+amount-Integer.parseInt(request.getParameter("amount")));
            
            if(proDAO.updateStock(pro))             
            if(bidDAO.update(bid)){
                response.sendRedirect("Admin/adminbilldetail.jsp");
            }
        }
        catch(Exception ex)
        {
        }
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
