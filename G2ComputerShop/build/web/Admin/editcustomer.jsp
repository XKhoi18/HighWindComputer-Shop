<%@page import="com.g2computershop.model.customer"%>
<%@page import="com.g2computershop.dao.customerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Edit Customer</title>
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
            <form action="../editcustomerServlet" method="post" enctype="multipart/form-data" name="myform" onsubmit="return validateForm()">
                <% 
                    int id =Integer.parseInt(request.getParameter("id"));
                    customerDAO cusDAO=new customerDAO();
                    customer rs= cusDAO.findByID(id);
                %>
            <h3 style="text-align:center;"> Edit Customer</h3>
            <table style="width: 700px;">
                <tr>
                    <td>Name </td>
                    <td>
                        <input type="hidden" name="customer_id" value='<%out.print(rs.getCustomer_id());%>'/>
                        <input type="text" name="customer_name" style="width: 300px;" value='<%out.print(rs.getCustomer_name());%>'/>
                        <p id="error" class="hidden" style="color: red">Please Input Name !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Gender </td>
                    <td>
                        <select name= "customer_gender" style="width: 200px; height:30px; margin-left:5px;">                           
                            <%
                                if(rs.getCustomer_gender()==1){
                                    out.print("<option value='1' selected >Male</option>");
                                    out.print("<option value='2'>Female</option>");
                                }
                                else{
                                    out.print("<option value='1'>Male</option>");
                                    out.print("<option value='2'selected >Female</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Date Of Birth </td>
                    <td style="padding-left: 14px;">
                        <input type="date" name="customer_DOB" value='<%out.print(rs.getCustomer_DOB());%>'/>
                        <p id="error2" class="hidden" style="color: red">Please Input Date !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Email </td>
                    <td>
                        <input type="text" name="customer_email" value='<%out.print(rs.getCustomer_email());%>'/>
                        <p id="error3" class="hidden" style="color: red">Please Input Email !!!<p>
                        <p id="error4" class="hidden" style="color: red">Please Input Valid Email !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Phone </td>
                    <td>
                        <input type="text" name="customer_phone" value='<%out.print(rs.getCustomer_phone());%>'/>
                        <p id="error5" class="hidden" style="color: red">Please Input Phone Number !!!<p>
                        <p id="error6" class="hidden" style="color: red">Please Input Valid Phone Number !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>Address </td>
                    <td>
                        <input type="text" name="customer_address" value='<%out.print(rs.getCustomer_address());%>'/>
                        <p id="error7" class="hidden" style="color: red">Please Input Address !!!<p>
                    </td>
                </tr>
                </tr>
                 <tr>
                    <td>UserName </td>
                    <td>
                        <input type="text" name="customer_username" value='<%out.print(rs.getCustomer_username());%>'/>
                        <p id="error8" class="hidden" style="color: red">Please Input UserName !!!<p>
                    </td>
                </tr>
                <tr>
                    <td>PassWord </td>
                    <td>
                        <input type="text" name="customer_pass" value='<%out.print(rs.getCustomer_pass());%>'/>
                        <p id="error9" class="hidden" style="color: red">Please Input PassWord !!!<p>
                        <p id="error10" class="hidden" style="color: red">Password can't be longer than 20 or less than 3 characters!!!<p>
                    </td>
                </tr>
                <tr>
                      <td colspan="2" ><input style="margin-left: 200px;margin-top: 20px;margin-bottom: 20px;" type="submit" value="Update"/> </td>
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
            var customer_name = document.forms["myform"]["customer_name"].value;
            var customer_DOB = document.forms["myform"]["customer_DOB"].value;
            var customer_email = document.forms["myform"]["customer_email"].value;
            var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            var customer_phone = document.forms["myform"]["customer_phone"].value;
            var phone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
            var customer_address = document.forms["myform"]["customer_address"].value;
            var customer_username = document.forms["myform"]["customer_username"].value;
            var customer_pass = document.forms["myform"]["customer_pass"].value;

            if (customer_name === "" || customer_name === null) {
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
            else if(customer_DOB === "" || customer_DOB === null){
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
            else if(customer_email === "" || customer_email === null){
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
            else if(!customer_email.match(mailformat)){
                document.getElementById('error').classList.add('hidden'); 
                document.getElementById('error2').classList.add('hidden');
                document.getElementById('error3').classList.add('hidden');
                document.getElementById('error4').classList.remove('hidden');
                document.getElementById('error4').scrollIntoView({ block: "center", behavior: "smooth" });
                document.getElementById('error5').classList.add('hidden');
                document.getElementById('error6').classList.add('hidden');
                document.getElementById('error7').classList.add('hidden');
                document.getElementById('error8').classList.add('hidden');
                document.getElementById('error9').classList.add('hidden');
                document.getElementById('error10').classList.add('hidden');
                return false;
            }
            else if(customer_phone === "" || customer_phone === null){
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
            else if(!customer_phone.match(phone)){
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
            else if(customer_address === "" || customer_address === null){
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
            else if(customer_username === "" || customer_username === null){
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
            else if(customer_pass === "" || customer_pass === null){
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
            else if(customer_pass.length>21 || customer_pass.length<3){
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