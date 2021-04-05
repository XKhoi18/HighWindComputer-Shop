<%@page import="com.g2computershop.model.producttype"%>
<%@page import="com.g2computershop.dao.producttypeDAO"%>
<%@page import="com.g2computershop.model.brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.g2computershop.dao.brandDAO"%>
<%@page import="com.g2computershop.model.productlist"%>
<%@page import="com.g2computershop.dao.productlistDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>High Wind Computer</title>
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
        <!-- ------------------------------------------------------ -->
    </head>

    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-angle-up"></i></button>
        <!-- ------------------ -->
        <!-- Ads -->
        <div class="ads">
            <div class="ads-img-1">
                <img src="img/ads-Copy.png" alt="December ADS" />
            </div>
            <div class="ads-img-2">
                <img src="img/ads-2.png" alt="December ADS" />
            </div>
        </div>
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

            <!-- ------------------ -->
            <!-- MAIN CONTENT START-->
            <div class="main__content">
                <!-- ------------------ -->
                <!-- BANNER IMAGES -->
                <!-- ------------------ -->

                <div class="banner__images">
                    <a href='productbrand.jsp?brand_id=10'><img src='img/nav_img1.jpg' alt='' /></a>
                    <a href='producttype.jsp?producttype_id=2'><img src='img/nav_img2.jpg' alt='' /></a>
                    <a href='producttype.jsp?producttype_id=8'><img src='img/nav_img3.jpg' alt='' /></a>
                    <a href='producttype.jsp?producttype_id=3'><img src='img/nav_img4.jpg' alt='' /></a>

                </div>

                <!-- ------------------ -->
                <!-- POPULAR BRAND -->
                <!-- ------------------ -->

                <div class="popular__brand">
                    <div class="banner__text">
                        <h2>POPULAR BRAND</h2>
                    </div>

                    <div class="banner__images">
                        <div class="banner__images_content">
                            <div class="content__img">
                                <a href="productbrand.jsp?brand_id=9"><img src="img/hp.jpg" alt="" /></a>
                            </div>
                            <div class="content__text_1">
                                <span>HP</span>
                            </div>
                            <div class="content__text_2">
                                <span>HP Laptop Festival - Extreme deals</span>
                            </div>
                        </div>
                        <div class="banner__images_content">
                            <div class="content__img">
                                <a href="productbrand.jsp?brand_id=6"><img src="img/msi.jpg" alt="" /></a>
                            </div>
                            <div class="content__text_1">
                                <span>MSI</span>
                            </div>
                            <div class="content__text_2">
                                <span>Made for Gamers and Creators</span>
                            </div>
                        </div>
                        <div class="banner__images_content">
                            <div class="content__img">
                                <a href="productbrand.jsp?brand_id=1"><img src="img/lg.jpg" alt="" /></a>
                            </div>
                            <div class="content__text_1">
                                <span>LG</span>
                            </div>
                            <div class="content__text_2">
                                <span>Winning LG Laptop Giveaway</span>
                            </div>
                        </div>
                        <div class="banner__images_content">
                            <div class="content__img">
                                <a href="productbrand.jsp?brand_id=11"><img src="img/lenovo.jpg" alt="" /></a>
                            </div>
                            <div class="content__text_1">
                                <span>LENOVO</span>
                            </div>
                            <div class="content__text_2">
                                <span>Laptop For True Gamers</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ------------------ -->
                <!-- CAROUSEL 2 -->
                <!-- ------------------ -->

                <div
                    id="carouselExampleIndicators"
                    class="carousel slide"
                    data-ride="carousel"
                    >
                    <ol class="carousel-indicators">
                        <li
                            data-target="#carouselExampleIndicators"
                            data-slide-to="0"
                            class="active"
                            ></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="img/ca1.jpeg" alt="First slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/ca2.jpeg" alt="Second slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/ca3.jpeg" alt="Third slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/ca4.jpeg" alt="Forth slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/ca5.jpeg" alt="Fifth slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/ca6.jpeg" alt="Sixth slide" />
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/ca7.jpeg" alt="Seventh slide" />
                        </div>
                    </div>
                    <a
                        class="carousel-control-prev"
                        href="#carouselExampleIndicators"
                        role="button"
                        data-slide="prev"
                        >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a
                        class="carousel-control-next"
                        href="#carouselExampleIndicators"
                        role="button"
                        data-slide="next"
                        >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <!-- ------------------ -->
                <!-- CATAGORIES -->
                <!-- ------------------ -->

                <div class="catagories">
                    <div class="product__list">
                        <div class="product__title">
                            <div class="title__text">
                                <h3>LAPTOP</h3>
                            </div>
                            <div class="title__seeall">
                                <a href="#">
                                    <h6>See all ></h6>
                                </a>
                            </div>
                        </div>
                        <div class="product__content">
                            <div class="product__content_img">
                                <img src="img/LT.jpg" alt="" />
                            </div>
                            <div class="product__content_pd">
                                <div class="product__content_pd_detail">
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>MSI Gaming</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>POWER FROM DRAGON</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="productbrand.jsp?brand_id=6"><img src="img/smsi.png" alt="" /></a>
                                        </div>
                                    </div>
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>LENOVO</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>For businessman</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="productbrand.jsp?brand_id=11"><img src="img/sle.png" alt="" /></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product__content_pd_detail">
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>HP Festival</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>Extreme discounts</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="productbrand.jsp?brand_id=9"><img src="img/sHp.png" alt="" /></a>
                                        </div>
                                    </div>
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>LG Gram</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>Thin and convenient</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="productbrand.jsp?brand_id=1"><img src="img/slg.png" alt="" /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="product__list">
                        <div class="product__title">
                            <div class="title__text">
                                <h3>GAMING GEAR</h3>
                            </div>
                            <div class="title__seeall">
                                <a href="#">
                                    <h6>See all ></h6>
                                </a>
                            </div>
                        </div>
                        <div class="product__content">
                            <div class="product__content_img">
                                <img src="img/LT.jpg" alt="" />
                            </div>
                            <div class="product__content_pd">
                                <div class="product__content_pd_detail">
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>Highwind PC</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>Great deal PC</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="producttype.jsp?producttype_id=1"><img src="img/Case.jpg" alt="" /></a>
                                        </div>
                                    </div>
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>Highwind Mouse</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>Best mouse for Gamer</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="producttype.jsp?producttype_id=4"><img src="img/mouse.jpg" alt="" /></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product__content_pd_detail">
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>Gaming Monitor</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>Extreme discounts</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="producttype.jsp?producttype_id=7"><img src="img/monitor.jpg" alt="" /></a>
                                        </div>
                                    </div>
                                    <div class="pd_details">
                                        <div class="content__text_1">
                                            <span>VGA</span>
                                        </div>
                                        <div class="content__text_2">
                                            <span>Outstanding Performance</span>
                                        </div>
                                        <div class="content_img">
                                            <a href="producttype.jsp?producttype_id=9"><img src="img/vga.jpg" alt="" /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ------------------ -->
                <!-- ALL PRODUCTS -->
                <!-- ------------------ -->

                <div class="list__all_products">
                    <div class="all__products">
                        <div class="product__title">
                            <div class="title__text">
                                <h3>ALL PRODUCTS</h3>
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
        <!-- FOOTER END -->
        <!-- ------------------ -->

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
