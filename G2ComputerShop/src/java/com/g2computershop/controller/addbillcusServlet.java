/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2computershop.controller;

import com.g2computershop.dao.billDAO;
import com.g2computershop.dao.bill_detailDAO;
import com.g2computershop.dao.productlistDAO;
import com.g2computershop.model.bill;
import com.g2computershop.model.bill_detail;
import com.g2computershop.model.productlist;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class addbillcusServlet extends HttpServlet {

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
            bill bi = new bill();
            bill_detail bid= new bill_detail();
            billDAO biDAO= new billDAO();
            bill_detailDAO bidDAO = new bill_detailDAO();
            productlistDAO proDAO=new productlistDAO();
            
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            LocalDate date = LocalDate.now();
            String now = String.valueOf(date);
            bi.setBill_date(sdf.parse(now));
            bi.setManager_id(7);
            bi.setCustomer_id(Integer.parseInt(request.getParameter("customer_id")));
            bi.setStatus("Waiting Confirm");
            if(biDAO.addNew(bi)){
                ArrayList<productlist> list = proDAO.findProductIDlist();
                for(productlist item: list){
                    if(request.getParameter("cartproduct_id"+item.getProduct_id())!=null){
                            bid.setBill_id(biDAO.findMaxID());
                            bid.setProduct_id(Integer.parseInt(request.getParameter("cartproduct_id"+item.getProduct_id())));
                            bid.setAmount(Integer.parseInt(request.getParameter("cartproduct_amount"+item.getProduct_id())));
                            productlist pro=proDAO.findByID(Integer.parseInt(request.getParameter("cartproduct_id"+item.getProduct_id()))); 
                            pro.setStock(pro.getStock()-Integer.parseInt(request.getParameter("cartproduct_amount"+item.getProduct_id())));
            
                            if(proDAO.updateStock(pro))
                            if(bidDAO.addNew(bid)){
                                HttpSession session = request.getSession();
                                session.removeAttribute("cart"+item.getProduct_id());
                            }
                        }
                    }
                }
                int billId=biDAO.findMaxID();
                HttpSession session = request.getSession();
                session.setAttribute("billId", billId);
                response.sendRedirect("ordersucess.jsp"); 
            } 
            catch (Exception ex) {}
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
