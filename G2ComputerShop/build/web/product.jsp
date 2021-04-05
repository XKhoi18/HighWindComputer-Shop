<%-- 
    Document   : product
    Created on : Jan 17, 2021, 3:48:59 PM
    Author     : Admin
--%>

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
        <title>High Wind Product</title>
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
    </head>

    <body>
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
                <%
                    int id = Integer.parseInt(request.getParameter("product_id"));
                    productlistDAO pDAO = new productlistDAO();
                    productlist rs = pDAO.findByID(id);
                %>
                <div class="logo__home">
                    <a href="index.jsp"
                       ><i class="fa fa-home" style="font-size: 20px"></i
                        ></a>
                </div>
                <div class="product__name">
                    <span><%out.print(rs.getProduct_name());%></span>
                </div>
            </div>
            <div class="product__content">
                <div class="product__detail">
                    <div class="product__img_info" style="width: 40%">
                        <div class="product__img">
                            <div class="img__product">
                                <img
                                    src="images/product/<%out.print(rs.getImages());%>"
                                    width="100%"
                                    alt="product_img"
                                    />
                            </div>
                        </div>
                        <div class="product__info" style="padding-top: 20px">
                            <%out.print(rs.getProduct_detail());%>
                        </div>
                    </div>
                    <div class="product__sale">
                        <div class="product__title">
                            <h4><%out.print(rs.getProduct_name());%></h4>
                            <%
                                brandDAO pbDAO = new brandDAO();
                                brand rsb = pbDAO.findByID(rs.getBrand_id());
                            %>
                            <span class="brand__name">Brand: <a href='productbrand.jsp?brand_id=<%out.print(rs.getBrand_id());%>' style="color: blue;font-weight: bold;"><%out.print(rsb.getBrand_name());%></a></span>
                            <span class="product__date">Product Date: <%out.print(rs.getProduct_date());%></span><br>
                            <span class="brand__name">Price: <a style="color: red;"><%out.print(rs.getPrice());%></a></span>
                            <span class="product__date">Discount : <a style="color: blue;"><%out.print(rs.getDiscount());%>%</a>
                            <h2>$<%out.print(rs.getPrice()*(100-rs.getDiscount())/100);%></h2>
                        </div>
                            <div class="group_btn">
                                <input type="hidden" id="cartproduct_id" value='<%out.print(request.getParameter("product_id"));%>'/>
                                <input type="hidden" id="cartproduct_image" value='<%out.print(rs.getImages());%>'/>
                                <input type="hidden" id="cartproduct_name" value='<%out.print(rs.getProduct_name());%>'/>
                                <input type="hidden" id="cartproduct_price" value='<%out.print(rs.getPrice()*(100-rs.getDiscount())/100);%>'/>
                                <button class="buy_btn" onclick="checkLoginLink()">BUY NOW!</button>
                                <button class="add_to_cart_btn" onclick="checkLogin()">ADD TO CART</button>
                            </div>
                        <!--</form>-->
                        <p style="font-weight: bold;color: red; margin-top: 10px;" id="message">                       
                            <%if(request.getAttribute("message")!=null){
                                out.print(request.getAttribute("message"));
                            }%>
                        </p>
                    </div>
                        
                </div>
                <div class="right__content_wrapper">
                    <div class="free_ship">
                        <span size="24" class="cmt"><img src="img/svg_img/freeship.svg" alt="free ship" style="padding-right:10px;"> Free ship in country</span>
                    </div>
                    <h6><b>Sales policy</b>
                    </h6>
                    <ul>
                        <li>100% Authentic Product Commitment.</li>
                        <li>Free shipping from 800.000đ.</li>
                        <li>Free return within 10 days.</li>
                    </ul>
                    <h6><b>Other Services</b>
                    </h6>
                    <ul>
                        <li>Repair at the same price 150,000đ.</li>
                        <li>Cleaning computers, laptops.</li>
                        <li>Warranty at home.</li>
                    </ul>
                </div>
            </div>
            <div class="list__all_products">
                <div class="all__products">
                    <div class="product__title">
                        <div class="title__text">
                            <h3 style="padding-left: 25px;padding-top: 15px;">RELATED PRODUCTS</h3>
                        </div>
                    </div>
                    <div class="owl-carousel owl-theme">
                        <%
                            productlistDAO proDAO = new productlistDAO();
                            ArrayList<productlist> list = new ArrayList<>();
                            list = proDAO.findALL();
                            for (productlist item : list) {
                                out.print("<div class=\"item\">");
                                out.print("<div class=\"pd__images_content\">");
                                out.print("<div class=\"content__img\">");
                                out.print("<a href=product.jsp?product_id=" + item.getProduct_id() + ">");
                                out.print("<img src=\"images/product/" + item.getImages() + "\" alt=''/></a>");
                                out.print("</div>");
                                out.print("<div class=\"content__text_3\">");
                                out.print("<span>" + item.getProduct_name() + "</span>");
                                out.print("</div>");
                                out.print("<div class=\"content__text_4\">");
                                out.print("<span>$" + item.getPrice()*(100-item.getDiscount())/100 + "</span>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                            }%>
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
            function checkLogin(){
                <%if(session.getAttribute("username")==null){%>
                    document.getElementById("message").innerHTML="Please Login to process !!!";
                    return false;
                <%}%>
                var data= new FormData;
                
                data.append("cartproduct_id",document.getElementById("cartproduct_id").value);
                data.append("cartproduct_image",document.getElementById("cartproduct_image").value);
                data.append("cartproduct_name",document.getElementById("cartproduct_name").value);
                data.append("cartproduct_price",document.getElementById("cartproduct_price").value);
                
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "addCartServlet");
                xhr.onload = function(){
                    console.log(this.response);
                };
                xhr.send(data);
                document.getElementById("message").innerHTML="Item Added to Cart !!!";
            }
            function checkLoginLink(){
                <%if(session.getAttribute("username")==null){%>
                    document.getElementById("message").innerHTML="Please Login to process !!!";
                    return false;
                <%}%>
                var data= new FormData;
                
                data.append("cartproduct_id",document.getElementById("cartproduct_id").value);
                data.append("cartproduct_image",document.getElementById("cartproduct_image").value);
                data.append("cartproduct_name",document.getElementById("cartproduct_name").value);
                data.append("cartproduct_price",document.getElementById("cartproduct_price").value);
                
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "addCartServlet");
                xhr.send(data);
                location.href='cart.jsp';
            }
        </script>
    </body>
</html>
