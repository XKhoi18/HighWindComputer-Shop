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
        <title>Add New Product</title>
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
            <form action="../addproductServlet" method="post" enctype="multipart/form-data" name="myform" onsubmit="return validateForm()"> 
<!--            enctype="multipart/form-data"-->
            <h3 style="text-align:center;"> Add New Product </h3>
            <table style="width: 700px;">
                <tr>
                    <td>Name </td>
                    <td>
                        <input type="text" name="product_name" />
                        <p id="error" class="hidden" style="color: red">Please Input Product Name !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Description </td>
                    <td style='padding-left: 14px;'>
                        <textarea name="product_detail" rows="10" cols="50" style="border-bottom: 2px solid #5fbae9;"></textarea>
                        <p id="error2" class="hidden" style="color: red">Please Input Description !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Product Date </td>
                    <td style="padding-left: 14px;">
                        <input type="date" name="product_date">
                        <p id="error3" class="hidden" style="color: red">Please Input Product Date !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Purchase Price </td>
                    <td style="padding-left: 14px;">
                        <input type="number" name="purchase_price" />
                        <p id="error4" class="hidden" style="color: red">Please Input Valid Purchase Price !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Price </td>
                    <td style="padding-left: 14px;">
                        <input type="number" name="price" />
                        <p id="error5" class="hidden" style="color: red">Please Input Valid Price !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Discount </td>
                    <td style="padding-left: 14px;">
                        <input type="number" name="discount" />
                        <p id="error6" class="hidden" style="color: red">Please Input Valid Discount !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Stock </td>
                    <td style="padding-left: 14px;">
                        <input type="number" name="stock" />
                        <p id="error7" class="hidden" style="color: red">Please Input Valid Stock !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Unit Sold </td>
                    <td style="padding-left: 14px;">
                        <input type="number" name="unit_sold" />
                        <p id="error8" class="hidden" style="color: red">Please Input Valid Unit Sold !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Warrant </td>
                    <td style="padding-left: 14px;">
                        <input type="number" name="warrant" />
                        <p id="error9" class="hidden" style="color: red">Please Input Valid Warrant !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Brand </td>
                    <td>
                        <%
                            brandDAO brDAO= new brandDAO();
                            ArrayList<brand> list2 = new ArrayList<>();
                            list2 = brDAO.findALL();
                            out.print("<select style='width: 300px; height:30px; margin-left:5px;' id='brand_id' name='brand_id'>");
                            for(brand item: list2) {
                            out.print("<option value=\""+item.getBrand_id()+"\">"+item.getBrand_name()+"</option>");
                            }
                        out.print("</select>");
                        %>                        
                    </td>
                </tr>
                <tr>
                    <td>Type </td>
                    <td>
                        <%
                            producttypeDAO ptDAO= new producttypeDAO();
                            ArrayList<producttype> list = new ArrayList<>();
                            list = ptDAO.findALL();
                            out.print("<select style='width: 300px; height:30px; margin-left:5px;' id= 'producttype_id' name= 'producttype_id'>");
                            for(producttype item: list) {
                            out.print("<option value='"+item.getProducttype_id()+"'>"+item.getProducttype_name()+"</option>");
                        }
                        out.print("</select>");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Images</td>
                    <td style="padding-left: 14px;">
                        <input type="file" id="images" name="images">
                        <p id="error10" class="hidden" style="color: red">Please Choose Images !!!<p>
                    </td>
                </tr>
                <tr>
                      <td colspan="2" ><input style="margin-left: 200px;margin-top: 20px;" type="submit" value="Add New"/> </td>
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
            var product_name = document.forms["myform"]["product_name"].value;
            var product_detail = document.forms["myform"]["product_detail"].value;
            var product_date = document.forms["myform"]["product_date"].value;
            var purchase_price = document.forms["myform"]["purchase_price"].value;
            var price = document.forms["myform"]["price"].value;
            var discount = document.forms["myform"]["discount"].value;
            var stock = document.forms["myform"]["stock"].value;
            var unit_sold = document.forms["myform"]["unit_sold"].value;
            var warrant = document.forms["myform"]["warrant"].value;
            var images = document.forms["myform"]["images"].value;

            if (product_name === "" || product_name === null) {
                document.getElementById('error').classList.remove('hidden'); 
                document.getElementById('error').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(product_detail === "" || product_detail === null){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.remove('hidden');
                document.getElementById('error2').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(product_date === "" || product_date === null){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.remove('hidden');
                document.getElementById('error3').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(purchase_price === "" || purchase_price === null || purchase_price<=0){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.remove('hidden');
                document.getElementById('error4').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(price === "" || price === null || price<=0){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.remove('hidden');
                document.getElementById('error5').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(discount === "" || discount === null ||discount<0){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.remove('hidden');
                document.getElementById('error6').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(stock === "" || stock === null ||stock<0){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.remove('hidden');
                document.getElementById('error7').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(unit_sold === "" || unit_sold === null||unit_sold<0){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.remove('hidden');
                document.getElementById('error8').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(warrant === "" || warrant === null|| warrant<0){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.remove('hidden');
                document.getElementById('error9').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(images === "" || images === null){
                document.getElementById('error').classList.add('hidden');
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.add('hidden');
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.remove('hidden');
                document.getElementById('error10').scrollIntoView({ block: "center", behavior: "smooth" });
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