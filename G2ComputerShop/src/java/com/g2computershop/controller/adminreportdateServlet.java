package com.g2computershop.controller;

import com.g2computershop.dao.reportDAO;
import com.g2computershop.model.report;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class adminreportdateServlet extends HttpServlet {

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
            out.print("<form action='adminreportdate.jsp' method='post'>");
            out.print("<table width='500px'>");
            out.print("<tr style='padding-left: 14px;'>");
            out.print("<td style=\"text-align: center;\">Star date </td>");
            out.print("<td style=\"text-align: center;\"><input type='date' name=\"day1\"></td>");
            out.print("</tr>");
            out.print("<tr style='padding-left: 14px;'>");
            out.print("<td style=\"text-align: center;\">End date </td>");
            out.print("<td style=\"text-align: center;\"><input type='date' name=\"day2\"></td>");
            out.print("</tr>");
            out.print("</tr>");
            out.print("<td></td>");
            out.print("<td style=\"text-align: center;\"><input style=\"margin-top: 20px;margin-bottom: 20px;\" type=\"submit\" value=\"Search\"/></td>");
            out.print("</tr>");
            out.print("</table>");
            out.print("</form>");
            
            out.print("<br>");out.print("<br>");
            out.print("<table border=1 width='1000px'>");
            out.print("<tr>");
            out.print("<th style=\"text-align: center;\">STT</th>");
            out.print("<th style=\"text-align: center;\">Bill ID</th>");
            out.print("<th style=\"text-align: center;\">Bill Date</th>");
            out.print("<th style=\"text-align: center;\">Amount</th>");
            out.print("<th style=\"text-align: center;\">Product ID</th>");
            out.print("<th style=\"text-align: center;\">Purchase price</th>");
            out.print("<th style=\"text-align: center;\">Price</th>");
            out.print("<th style=\"text-align: center;\">Discount</th>");
            out.print("<th style=\"text-align: center;\">Profit</th>");
            out.print("</tr>");
           
            
            reportDAO rpDAO = new reportDAO();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            ArrayList<report> list=rpDAO.findByDate(request.getParameter("day1"),request.getParameter("day2"));
            int i = 1;
            float totalprofit=0;
            for(report item: list)
                {
                    out.print("<tr>");
                    out.print("<td style=\"text-align: center;\">" + i+" </td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getBill_id()+"</td>");
                    out.print("<td style=\"text-align: center;\"> "+item.getBill_date()+" </td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getAmount()+"</td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getProduct_id()+"</td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getPurchase_price()+"</td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getPrice()+"</td>");
                    out.print("<td style=\"text-align: center;\">"+ item.getDiscount()+"%</td>");
                    out.print("<td style=\"text-align: center;\">$"+ item.getProfit()+"</td>");
                    out.print("</tr>");
                    totalprofit=totalprofit+item.getProfit();
                    i++;
                }
            out.print("<tr>");
            out.print("<td colspan='9' style='text-align: right;font-size:30px;'>Total profit: "+totalprofit+"</td>");
            out.print("</tr>");
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