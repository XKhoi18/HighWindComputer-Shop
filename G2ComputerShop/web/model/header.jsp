
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ------------------ -->
<!-- TOP BANNER -->
<!-- ------------------ -->

<div class="top__bn">
    <a href="./about_us.jsp"><img src="img/bn_top/bn-top2.jpg" alt="December ADS" /></a>
</div>

<!-- ------------------ -->
<!-- HEADER LOGO / SEARCH / SERVICE-->
<!-- ------------------ -->

<div class="header__nav">

    <!-- ------------------ -->
    <!-- HEADER LOGO-->
    <!-- ------------------ -->

    <div class="logo__img">
        <a href="./index.jsp"><img src="img/logo.png" width="100%" alt="HIGHWIND COMPUTER" /></a>
    </div>

    <!-- ------------------ -->
    <!-- HEADER SEARCH -->
    <!-- ------------------ -->

    <div class="search__bar">
        <form class="search__function" action="searchServlet" method="GET">
            <input type="text" placeholder="Search.." name="search" />
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>

    <!-- ------------------ -->
    <!-- HEADER SERVICE-->
    <!-- ------------------ -->

    <div class="customer__nav">
        <a class="nav__items" href="./contact_us.jsp">
            <img src="img/nav_items/register.png" width="100%" alt="" />

            <div class="nav__items__description">
                <div class="items__text">Contact Us</div>
            </div>
        </a>

        <% if (session.getAttribute("username") != null) {%>
        <a class="nav__items">
            <img src="img/nav_items/login.png" width="100%" alt="" />

            <div class="nav__items__description">
                <div class="items__text">
                    <div class="text__welcome">Welcome ${username}.</div>
                </div>
            </div>
        </a>
                    
        <a class="nav__items">
            <div class="nav__items__description">
                <div class="items__text">
                    <div class="log__out">
                        <form action="logoutServlet" method="post">
                            <input class="logout_form" type="submit" value=" Log out."> 
                        </form>
                    </div>
                </div>
            </div>
        </a>  
                
        <%}
            if (session.getAttribute("username") == null) {%>
        <a class="nav__items" href="./log_in.jsp">
            <img src="img/nav_items/login.png" width="100%" alt="" />

            <div class="nav__items__description">
                <div class="items__text">Log In</div>
            </div>
        </a>
        <%}%>

        <a class="nav__items" href="cart.jsp">
            <img src="img/nav_items/shop.png" width="100%" alt="" />

            <div class="nav__items__description">
                <div class="items__text">Cart</div>
            </div>
        </a>
    </div>
</div>