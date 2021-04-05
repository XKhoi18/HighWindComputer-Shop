<%@page import="com.g2computershop.model.brand"%>
<%@page import="com.g2computershop.dao.brandDAO"%>
<%@page import="com.g2computershop.model.producttype"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.g2computershop.dao.producttypeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Add New Product Type</title>
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
            <form action="../addproducttypeServlet" method="post" enctype="multipart/form-data" name="myform" onsubmit="return validateForm()">
            <h3 style="text-align:center;"> Add New Product Type</h3>
            <table style="width: 700px;">
                <tr>
                    <td>Product Type Name </td>
                    <td>
                        <input type="text" name="producttype_name" />
                        <p id="error" class="hidden" style="color: red">Please Input Product Type Name !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Product Type Icon</td>
                    <td style="padding-left: 14px;">
                        <input type="file" id="images" name="producttype_images">
                        <p id="error2" class="hidden" style="color: red">Please Choose Product Type Icon !!!<p>
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
            var producttype_name = document.forms["myform"]["producttype_name"].value;
            var producttype_images = document.forms["myform"]["producttype_images"].value;

            if (producttype_name === "" || producttype_name === null) {
                document.getElementById('error').classList.remove('hidden');
                document.getElementById('error').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error2').classList.add('hidden');
                return false;
            }
            else if(producttype_images === "" || producttype_images === null){
                document.getElementById('error').classList.add('hidden'); 
                document.getElementById('error2').classList.remove('hidden');
                document.getElementById('error2').scrollIntoView({ block: "center", behavior: "smooth" });
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