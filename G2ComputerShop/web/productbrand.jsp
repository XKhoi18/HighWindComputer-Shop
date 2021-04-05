<%@page import="com.g2computershop.model.productlist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.g2computershop.dao.productlistDAO"%>
<%@page import="com.g2computershop.model.brand"%>
<%@page import="com.g2computershop.dao.brandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>High Wind</title>
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
        <link rel="stylesheet" href="css/main.css" />
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
            <!-- HEADER NAVIGATION AND CAROUSEL START-->
            <div class="header__navigation">
            <jsp:include page="model/navbar.jsp"></jsp:include>

                <!-- ------------------ -->
                <!-- HEADER CAROUSEL-->
                <!-- ------------------ -->

                <div class="carousel__content">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <a href="#"><img class="d-block w-100" src="img/crs1.jpg" alt="First slide" /></a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs2.jpg" alt="Second slide" /></a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs3.jpg" alt="Third slide" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs4.jpg" alt="Fourth slide" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs5.jpg" alt="Fifth slide" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs6.jpg" alt="Sixth slide" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs7.jpg" alt="Seventh slide" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a href="#"><img class="d-block w-100" src="img/crs8.jpg" alt="Eighth slide" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- HEADER NAVIGATION END -->
            <!-- ------------------ -->

            <div class="main__content">

                <div class="banner__images">
                    <a href='productbrand.jsp?brand_id=10'><img src='img/nav_img1.jpg' alt='' /></a>
                    <a href='producttype.jsp?producttype_id=2'><img src='img/nav_img2.jpg' alt='' /></a>
                    <a href='producttype.jsp?producttype_id=8'><img src='img/nav_img3.jpg' alt='' /></a>
                    <a href='producttype.jsp?producttype_id=3'><img src='img/nav_img4.jpg' alt='' /></a>
                </div>

                <div class="nav__redirect">
                    <div class="logo__home">
                        <a href="index.jsp"
                           ><i class="fa fa-home" style="font-size: 20px"></i
                            ></a>
                    </div>
                <%
                    String brandid = request.getParameter("brand_id");
                    brandDAO brandDAO = new brandDAO();
                    brand rs = brandDAO.findByID(brandid);
                %>
                <div class="product__name">
                    <span><%out.print(rs.getBrand_name());%></span>
                </div>
            </div>

            <div class="list__all_products">
                <div class="all__products">
                    <div class="product__title">
                        <div class="title__text">
                            <h3><%out.print(rs.getBrand_name());%> Products</h3>
                        </div>
                    </div>
                    <div class="owl-carousel owl-theme">
                        <%
                            productlistDAO proDAO = new productlistDAO();
                            ArrayList<productlist> list = new ArrayList<>();
                            list = proDAO.findByBrandID(brandid);
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

        <!-- ------------------ -->
        <!-- FOOTER START-->
        <footer class="footer">
            <jsp:include page="model/footer.jsp"></jsp:include>
        </footer>
        <!-- ------------------------------------------------------ -->
        <script
            src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"
        ></script>
        <!-- ------------------------------------------------------ -->
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"
        ></script>
        <!-- ------------------------------------------------------ -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"
        ></script>
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
