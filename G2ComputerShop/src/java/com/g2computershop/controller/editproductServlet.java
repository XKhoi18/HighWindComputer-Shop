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
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class editproductServlet extends HttpServlet {

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
            productlistDAO proDAO=new productlistDAO();
            int id=Integer.parseInt(request.getParameter("product_id"));
            productlist pro=proDAO.findByID(id);
            pro.setProduct_name(request.getParameter("product_name"));
            pro.setProduct_detail(request.getParameter("product_detail"));
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            pro.setProduct_date(sdf.parse(request.getParameter("product_date")));
            pro.setPurchase_price(Integer.parseInt(request.getParameter("purchase_price")));
            pro.setPrice(Integer.parseInt(request.getParameter("price")));
            pro.setDiscount(Integer.parseInt(request.getParameter("discount")));
            pro.setStock(Integer.parseInt(request.getParameter("stock")));
            pro.setUnit_sold(Integer.parseInt(request.getParameter("unit_sold")));
            pro.setWarrant(Integer.parseInt(request.getParameter("warrant")));
            pro.setBrand_id(request.getParameter("brand_id") );
            pro.setProducttype_id(request.getParameter("producttype_id") );
                        
            Part part=request.getPart("images");
            String image=part.getSubmittedFileName();
            
            if(image.length()!=0)
            {
                pro.setImages(part.getSubmittedFileName());
            }
      
            if(proDAO.update(pro))
                response.sendRedirect("Admin/adminproduct.jsp"); 
            out.print("<h1> Chúc mừng"+image+" </h1>");
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
