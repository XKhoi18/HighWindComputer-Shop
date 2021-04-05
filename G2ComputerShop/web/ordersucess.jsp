<%@page import="com.g2computershop.model.bill_detail"%>
<%@page import="com.g2computershop.dao.bill_detailDAO"%>
<%@page import="com.g2computershop.model.customer"%>
<%@page import="com.g2computershop.model.bill"%>
<%@page import="com.g2computershop.dao.billDAO"%>
<%@page import="com.g2computershop.dao.customerDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.g2computershop.model.brand"%>
<%@page import="com.g2computershop.dao.brandDAO"%>
<%@page import="com.g2computershop.model.producttype"%>
<%@page import="com.g2computershop.dao.producttypeDAO"%>
<%@page import="com.g2computershop.model.productlist"%>
<%@page import="com.g2computershop.dao.productlistDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>High Wind Cart</title>
        <!-- ------------------------------------------------------ -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
            integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <!-- ------------------------------------------------------ -->
        <link
            rel="stylesheet"
            href="css/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css"
            type="text/css"
            />
        <link
            rel="stylesheet"
            href="css/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.css"
            type="text/css"
            />
        <!-- ------------------------------------------------------ -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Questrial&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
            />
        <!-- ------------------------------------------------------ -->
        <link rel="stylesheet" href="css/cart.css" />
        <!-- ------------------------------------------------------ -->
    </head>

    <body>
        <%
        if(session.getAttribute("username")==null)
            {
                response.sendRedirect("log_in.jsp");
            }
        %>
        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-angle-up"></i></button>
        <!-- ------------------ -->
        <!-- HEADER START-->
        <header class="header">
            <jsp:include page="model/header.jsp" ></jsp:include>
            </header>
            <!-- HEADER END-->
            <!-- ------------------ -->

            <!-- ------------------ -->
            <!-- MAIN CONTENT START-->
            <div class="bg_cart_page">
                <img class="bg__img" src="img/Christmas-Website-BG.jpg" alt="" />
                <div class="cart__page">
                    <h1 class="nothing">ORDER CONFIRMATION</h1>
                    <%
                        if(session.getAttribute("billId")!=null){       
                    %>
                    <h3 class="nothing order"><b>YOUR ORDER HAS SUBMITTED.</b></h3>
                    <div class="est">
                        <br><h5 class="nothing"><b>Estimate Delivery Time:</b></h5>
                    <%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                        LocalDateTime now = LocalDateTime.now(); //today
                        LocalDateTime deli = now.plusDays(4);     //Plus 4 day
                    %>
                    <h5 class="nothing"><%out.print(dtf.format(deli));%></h5>

                    <%  
                        int billID=(Integer)session.getAttribute("billId");
                        billDAO biDAO = new billDAO();
                        bill rs = biDAO.findByBillID(billID);
                        customerDAO cusDAO= new customerDAO();
                        customer rs_cus = cusDAO.findByID(rs.getCustomer_id());%>

                    <table class="nothing" border=1>
                    <tr>
                        <th width='150px' style="text-align: center;">Date</th>
                        <td width='350px' style="text-align: center;"><%out.print(rs.getBill_date());%></td>
                    </tr>
                    <tr>
                        <th style="text-align: center;">Customer Name</th>
                        <td style="text-align: center;"><%out.print(rs_cus.getCustomer_name());%></td>
                    </tr>
                    <tr>
                        <th style="text-align: center;">Status</th>
                        <td style="text-align: center;"><%out.print(rs.getStatus());%></td>
                    </tr>
                    </table>
                    <br>

                    <table border=1 width='900px' style="margin: 0 auto;">
                    <tr>
                        <th></th>
                        <th width='400px' style="text-align: center;">Product</th>
                        <th style="text-align: center;">Price</th>
                        <th style="text-align: center;">Amount</th>
                        <th style="text-align: center;">Sum</th>
                    </tr>

                    <%bill_detailDAO bidDAO = new bill_detailDAO();
                    ArrayList<bill_detail> list=bidDAO.findByBillId(rs.getBill_id());
                    productlistDAO proDAO = new productlistDAO();
                    int i = 1;
                    float total = 0;
                    for(bill_detail item: list)
                        {
                            productlist rs_pro = proDAO.findByID(item.getProduct_id());%>
                            <tr>
                                <td style="text-align: center;"><%out.print(i); %></td>
                                <td style="text-align: center;"><%out.print(rs_pro.getProduct_name());%></td>
                                <td style="text-align: center;">$<%out.print(rs_pro.getPrice()*(100-rs_pro.getDiscount())/100);%></td>
                                <td style="text-align: center;"><%out.print(item.getAmount());%></td>
                                <%float sum = item.getAmount()*(rs_pro.getPrice()*(100-rs_pro.getDiscount())/100); %>
                                <td style="text-align: center;">$<%out.print(sum); %></td>
                            </tr>
                            <%i++;
                                total = total+ sum;
                            }%>
                            <tr style=';font-size: 22px;'>
                                <th colspan='4' style="text-align: right;">Total &nbsp</th>
                                <th style="text-align: center">$<%out.print(total); %></th>
                            </tr>
                    </table>
                    <br><br>
                    <%}%>
                </div>
                <div class="return-index">
                    <a href="index.jsp" class="btn__shopping">
                        <div class="ssss">Shopping Now</div>
                    </a>
                </div>        
            </div>
        </div>
        <!-- MAIN CONTENT END -->
        <!-- ------------------ -->

        <!-- ------------------ -->
        <!-- FOOTER START-->
        <footer class="footer">
            <jsp:include page="model/footer.jsp"></jsp:include>
        </footer>

        <!-- ------------------------------------------------------ -->
        <script
            src="css/OwlCarousel2-2.3.4/docs/assets/vendors/jquery.min.js"
            type="text/javascript"
        ></script>
        <!-- ------------------------------------------------------ -->
        <script
            src="css/OwlCarousel2-2.3.4/dist/owl.carousel.js"
            type="text/javascript"
        ></script>
        <script type="text/javascript">
            //Get the button
            var scrollTop_btn = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (
                        document.body.scrollTop > 20 ||
                        document.documentElement.scrollTop > 20
                        ) {
                    scrollTop_btn.style.display = "block";
                } else {
                    scrollTop_btn.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }

            // owl carousel
            $(".owl-carousel").owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                responsive: {
                    0: {
                        items: 1,
                    },
                    600: {
                        items: 3,
                    },
                    1000: {
                        items: 5,
                    },
                },
            });
        </script>
    </body>
</html>
