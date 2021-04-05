<%@page import="com.g2computershop.model.customer"%>
<%@page import="com.g2computershop.dao.customerDAO"%>
<%@page import="com.g2computershop.model.manager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.g2computershop.dao.managerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Add New Bill</title>
        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
        <!-- Bootstrap core CSS -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--external css-->
        <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css" />
        <!-- Custom styles for this template -->
        <link href="css/style2.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <script src="lib/chart-master/Chart.js"></script>
    </head>
    <body>
        <%
        if(session.getAttribute("adusername")==null)
            {
                response.sendRedirect("adminlogin.jsp");
            }
        %>
        <section id="container">
        <!--header-->
        <header class="header black-bg">
            <jsp:include page="model/adminheader.jsp"></jsp:include>
        </header>

        <!--MAIN SIDEBAR MENU-->
        <aside>
            <jsp:include page="model/adminsidebar.jsp"></jsp:include>
        </aside>

        <!--MAIN CONTENT-->
        <!--main content start-->
        <section id="main-content">
            <div style="float: left;">
            <form action="../addbillServlet" method="post" name="myform" onsubmit="return validateForm()">
            <h3 style="text-align:center;"> Add New Bill</h3>
            <table style="width: 700px;">
                <tr>
                    <td>Bill Date </td>
                    <td style="padding-left: 14px;">
                        <input type="date" name="bill_date" />
                        <p id="error" class="hidden" style="color: red">Please Input Date !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Manager </td>
                    <td>
                        <%
                            managerDAO maDAO= new managerDAO();
                            ArrayList<manager> list = new ArrayList<>();
                            list = maDAO.findALL();
                            out.print("<select name= 'manager_id' style=\"width: 200px; height:30px; margin-left:5px;\">");
                            for(manager item: list) {
                            out.print("<option value="+item.getManager_id()+">"+item.getFullname()+"</option>");
                        }
                        out.print("</select>");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Customer </td>
                    <td>
                        <%
                            customerDAO cuDAO= new customerDAO();
                            ArrayList<customer> list2 = new ArrayList<>();
                            list2 = cuDAO.findALL();
                            out.print("<select name= 'customer_id' style=\"width: 200px; height:30px; margin-left:5px;\">");
                            for(customer item: list2) {
                                out.print("<option value="+item.getCustomer_id()+">"+item.getCustomer_name()+"</option>");
                            }
                            out.print("</select>");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Status </td>
                    <td>
                            <select name= "status" style="width: 200px; height:30px; margin-left:5px;">                           
                            <option value="Waiting Confirm">Waiting Confirm</option>
                            <option value="Delivering">Delivering</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Received Payment">Received Payment</option>
                        </select>
                    </td>
                </tr>
                <tr>
                      <td colspan="2" ><input style="margin-left: 200px;margin-top: 20px;margin-bottom: 20px;" type="submit" value="Add New"/> </td>
                </tr>
            </table>     
        </form>
        </div>
        </section>
        <!--main content end-->
    </section>
    </body>
    <script>
        function validateForm() {
            var date = document.forms["myform"]["bill_date"].value;
            if(date === "" || date === null){
                document.getElementById('error').classList.remove('hidden');
                document.getElementById('error').scrollIntoView({ block: "center", behavior: "smooth" });
                return false;
            }
        }
    </script>
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
    <script src="lib/jquery.scrollTo.min.js"></script>
    <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="lib/jquery.sparkline.js"></script>
    <!--common script for all pages-->
    <script src="lib/common-scripts.js"></script>
    <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="lib/gritter-conf.js"></script> 
</html>
