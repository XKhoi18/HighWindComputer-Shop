<%-- 
    Document   : adminheader
    Created on : Oct 10, 2020, 6:44:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="sidebar-toggle-box">
    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
</div>
<!--logo start-->
<a href="indexadmin.jsp" class="logo"><b>HIGHWIND<span>ADMIN</span></b></a>
<!--logo end-->
<div class="top-menu">
    <ul class="nav pull-right top-menu">
         <% if (session.getAttribute("adusername") != null) {%>
        <li><a class="logout">Welcome ${adusername}</a></li>
        <%}%>
    </ul>
</div>
