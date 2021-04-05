<%@page import="com.g2computershop.dao.customerDAO"%>
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
        <link rel="stylesheet" href="css/product.css" />
        <!-- ------------------------------------------------------ -->
        <style>
            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #dddddd;
              text-align: center;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #dddddd;
            }
            
            .button {
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
            }
            .button1 {background-color: #4CAF50;} /* Green */
            .button2 {background-color: red;} /* Blue */
            
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
            }
            input[type=number] {
              -moz-appearance: textfield;
            }
        </style>
    </head>

    <body>
        <%
        if(session.getAttribute("username")==null)
            {
                response.sendRedirect("log_in.jsp");
            }
            customerDAO cus= new customerDAO();
            String username= (String)session.getAttribute("username");
            int customerID= cus.findCustomerID(username);
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
            <div class="main__content">
                <div class="nav__redirect">

                
            </div>
            <div class="product__content">
                <div class="product__detail col-12" height="1000px">
                    <div style="float: left;">
            <form action="addbillcusServlet" method="post">
            
            <table style="width: 1000px;margin-left: 100px;" border=1>
                <tr style="font-weight: bold;">
                    <td>Image</td>
                    <td width="400px" style="padding-left: 14px;">Product Name </td>
                    <td>Price </td>
                    <td>Amount </td>
                    <td>Sum </td>
                    <td></td>
                    <input type="hidden" name="customer_id" value='<%out.print(customerID);%>'/>
                </tr>
                <%
                    int total=0;
                    productlistDAO proDAOL=new productlistDAO();
                    ArrayList<productlist> list = proDAOL.findProductIDlist();
                    for(productlist idlist: list){
                        if(session.getAttribute("cart"+idlist.getProduct_id())!=null){
                            ArrayList<productlist> cart=(ArrayList)session.getAttribute("cart"+idlist.getProduct_id());
                            for(productlist item: cart){
                %>
                <tr>
                    <td>
                        <input type="hidden" name="cartproduct_image<%out.print(item.getProduct_id());%>" id="cartproduct_image<%out.print(item.getProduct_id());%>" value='<%out.print(item.getImages());%>'/>
                        <img src="images/product/<%out.print(item.getImages());%>" width="100" height="100"/>
                    </td>    
                    <td style="padding-left: 14px;">
                        <input type="hidden" name="cartproduct_id<%out.print(item.getProduct_id());%>" id="cartproduct_id<%out.print(item.getProduct_id());%>" value='<%out.print(item.getProduct_id());%>'/>
                        <input type="hidden" name="cartproduct_name<%out.print(item.getProduct_id());%>" id="cartproduct_name<%out.print(item.getProduct_id());%>" value='<%out.print(item.getProduct_name());%>'/>
                        <%out.print(item.getProduct_name());%>
                    </td>
                    <td>
                        <input type="hidden" name="cartproduct_price<%out.print(item.getProduct_id());%>" id="cartproduct_price<%out.print(item.getProduct_id());%>" value='<%out.print(item.getPrice());%>'/>
                        <%out.print("$"+item.getPrice());%>
                    </td>
                    <td>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-danger" onclick="CartMinus(<%out.print(idlist.getProduct_id());%>)">-</button>
                            </div>
                            <input type="number" class="form-control" style="text-align: center; width: 5em;height: 3em" name="cartproduct_amount<%out.print(idlist.getProduct_id());%>" id="cartproduct_amount<%out.print(idlist.getProduct_id());%>" onchange="Cart(<%out.print(idlist.getProduct_id());%>)"
                               value='<%out.print(item.getUnit_sold());%>' min="1"/>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-success" onclick="CartPlus(<%out.print(idlist.getProduct_id());%>)">+</button>
                            </div>
                        </div>
                    </td>
                    <td width="100px" id="cartsum<%out.print(item.getProduct_id());%>">
                        <%
                            int a= item.getPrice();
                            int b= item.getUnit_sold();
                            int sum = a*b ;
                            out.print("$"+sum);
                            total=total+sum ;
                        %>
                    </td>
                    <td>
                        <a href="removeItemServlet?id=<%out.print(item.getProduct_id());%>">Delete</a>
                    </td>
                </tr>
                    <%
                            }
                        }
                    }    
                    %>
                    
                <tr style="background-color: white;">
                    <td colspan="4" ><p style="font-weight: bold;text-align: right;">Total</p></td>
                    <td><p id="total" style="font-weight: bold;"><%out.print("$"+total);%></p></td><td></td>
                </tr>    
                <tr>
                    <td colspan="6" style="text-align: center;">
                        <button style="margin-top: 20px;margin-bottom: 20px;width: 300px;text-align: center;" type="submit" class="buy_btn"/>Submit</button> 
                    </td>
                </tr>
            </table> 
        </form>
        </div>
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
        <script>
            function CartPlus(id){
                var total=0;
                var price= document.getElementById("cartproduct_price"+id).value ;
                var amount= document.getElementById("cartproduct_amount"+id).value ;
                amount++;
                document.getElementById("cartproduct_amount"+id).value=amount;
                var sum = price*amount;
                document.getElementById("cartsum"+id).innerHTML = "$"+sum;
                
                <%for(productlist idlist: list){
                    if(session.getAttribute("cart"+idlist.getProduct_id())!=null){%>
                    var price= document.getElementById("cartproduct_price<%out.print(idlist.getProduct_id());%>").value ;
                    var amount= document.getElementById("cartproduct_amount<%out.print(idlist.getProduct_id());%>").value ;
                    var sum = price*amount;
                    document.getElementById("cartsum<%out.print(idlist.getProduct_id());%>").innerHTML = "$"+sum;
                    total=total+sum ;
                 <%}}%>
                document.getElementById("total").innerHTML = "$"+total;
                
                var data= new FormData;
                
                data.append("cartproduct_id",document.getElementById("cartproduct_id"+id).value);
                data.append("cartproduct_image",document.getElementById("cartproduct_image"+id).value);
                data.append("cartproduct_name",document.getElementById("cartproduct_name"+id).value);
                data.append("cartproduct_price",document.getElementById("cartproduct_price"+id).value);
                data.append("cartproduct_amount",document.getElementById("cartproduct_amount"+id).value);
                
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "addCartServlet");
                xhr.onload = function(){
                    console.log(this.response);
                };
                xhr.send(data);
            }
            function CartMinus(id){
                var total=0;
                var price= document.getElementById("cartproduct_price"+id).value ;
                var amount= document.getElementById("cartproduct_amount"+id).value ;
                if(amount>=2){
                    amount--;
                }
                document.getElementById("cartproduct_amount"+id).value=amount;
                var sum = price*amount;
                document.getElementById("cartsum"+id).innerHTML = "$"+sum;
                
                <%for(productlist idlist: list){
                    if(session.getAttribute("cart"+idlist.getProduct_id())!=null){%>
                    var price= document.getElementById("cartproduct_price<%out.print(idlist.getProduct_id());%>").value ;
                    var amount= document.getElementById("cartproduct_amount<%out.print(idlist.getProduct_id());%>").value ;
                    var sum = price*amount;
                    document.getElementById("cartsum<%out.print(idlist.getProduct_id());%>").innerHTML = "$"+sum;
                    total=total+sum ;
                 <%}}%>
                document.getElementById("total").innerHTML = "$"+total;
                
                var data= new FormData;
                
                data.append("cartproduct_id",document.getElementById("cartproduct_id"+id).value);
                data.append("cartproduct_image",document.getElementById("cartproduct_image"+id).value);
                data.append("cartproduct_name",document.getElementById("cartproduct_name"+id).value);
                data.append("cartproduct_price",document.getElementById("cartproduct_price"+id).value);
                data.append("cartproduct_amount",document.getElementById("cartproduct_amount"+id).value);
                
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "addCartServlet");
                xhr.onload = function(){
                    console.log(this.response);
                };
                xhr.send(data);
            }
            function Cart(id){
                var total=0;
                var price= document.getElementById("cartproduct_price"+id).value ;
                var amount= document.getElementById("cartproduct_amount"+id).value ;
                document.getElementById("cartproduct_amount"+id).value=amount;
                var sum = price*amount;
                document.getElementById("cartsum"+id).innerHTML = "$"+sum;
                
                <%for(productlist idlist: list){
                    if(session.getAttribute("cart"+idlist.getProduct_id())!=null){%>
                    var price= document.getElementById("cartproduct_price<%out.print(idlist.getProduct_id());%>").value ;
                    var amount= document.getElementById("cartproduct_amount<%out.print(idlist.getProduct_id());%>").value ;
                    var sum = price*amount;
                    document.getElementById("cartsum<%out.print(idlist.getProduct_id());%>").innerHTML = "$"+sum;
                    total=total+sum ;
                 <%}}%>
                document.getElementById("total").innerHTML = "$"+total;
                
                var data= new FormData;
                
                data.append("cartproduct_id",document.getElementById("cartproduct_id"+id).value);
                data.append("cartproduct_image",document.getElementById("cartproduct_image"+id).value);
                data.append("cartproduct_name",document.getElementById("cartproduct_name"+id).value);
                data.append("cartproduct_price",document.getElementById("cartproduct_price"+id).value);
                data.append("cartproduct_amount",document.getElementById("cartproduct_amount"+id).value);
                
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "addCartServlet");
                xhr.onload = function(){
                    console.log(this.response);
                };
                xhr.send(data);
            }
        </script>
    </body>
</html>
