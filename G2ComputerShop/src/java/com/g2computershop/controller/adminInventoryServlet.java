package com.g2computershop.controller;

import com.g2computershop.dao.inventoryDAO;
import com.g2computershop.model.inventory;
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
public class adminInventoryServlet extends HttpServlet {

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
            out.print("<br>");out.print("<br>");
            out.print("<form action='admininventorySearch.jsp' method='post'>");
            out.print("<table width='500px'>");
            out.print("<tr style='padding-left: 14px;'>");
            out.print("<td style=\"text-align: center;\">Product Type</td>");
            out.print("<td style=\"text-align: center;\"><input type='text' name=\"type\"></td>");
            out.print("</tr>");
            out.print("</tr>");
            out.print("<td></td>");
            out.print("<td style=\"text-align: center;\"><input style=\"margin-top: 20px;\" type=\"submit\" value=\"Search\"/></td>");
            out.print("</tr>");
            out.print("</table>");
            out.print("</form>");
            
            out.print("<br>");out.print("<br>");
            out.print("<table border=1 width='900px'>");
            out.print("<tr>");
            out.print("<th style=\"text-align: center;\">STT</th>");
            out.print("<th style=\"text-align: center;\">Product Type</th>");
            out.print("<th style=\"text-align: center;\">Brand</th>");
            out.print("<th style=\"text-align: center;\">Stock</th>");
            out.print("</tr>");
           
            inventoryDAO ivDAO = new inventoryDAO();
            ArrayList<inventory> list=ivDAO.findALL();
            int i = 1;
            for(inventory item: list)
                {
                    out.print("<tr>");
                    out.print("<td style=\"text-align: center;\">" + i+" </td>");
                    out.print("<td style=\"text-align: center;\"> "+item.getProducttype_name()+" </td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getBrand_name()+"</td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getStock()+"</td>");
                    out.print("</tr>");
                    i++;
                }
            out.print("</table>");
            out.print("<br>");
            out.print("<br>");
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