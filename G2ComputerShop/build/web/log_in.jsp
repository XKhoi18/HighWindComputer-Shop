<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login High Wind</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Questrial&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="css/login.css" />
    </head>
    <body>
        <!-- HEADER START-->
        <header class="header">
            <jsp:include page="model/header.jsp" ></jsp:include>
            </header>
            <!-- HEADER END-->
            <!-- ------------------ -->

            <!-- ------------------ -->
            <!-- MAIN CONTENT START-->
            <div class="bg_login_page">
                <img class="bg__img" src="img/Christmas-Website-BG.jpg" alt="" />
                <div class="login__page">
                    <div class="welcome__text">
                        <h4>Welcome, Please Sign In!</h4>
                    </div>
                    <div class="signup_login_section">
                        <div class="sign_up_section">
                            <h5>New Customer</h5>
                            <br><h6><b>Register and save time!</b></h6>
                            <h6>Register with us for future convenience:</h6>
                            <h6><i class="fa fa-check"></i> Fast and easy check out</h6>
                            <h6><i class="fa fa-check"></i> Easy access to your order history</h6>
                            <h6><i class="fa fa-check"></i> Be up to date on your order status</h6>
                            <a href="register.jsp"><input type="button" value="Register" class="signup_login_btn"></a>
                        </div>

                        <div class="sign_up_section">
                            <h5>Returning Customer</h5>
                            <br>
                            <form action="/G2ComputerShop/loginServlet" method="post">
                                <table>
                                    <tr>
                                        <td><h6>Username: </h6></td>
                                        <td><input type="text" class="form_input_f" name="username" id="username" required></td>
                                    </tr>
                                    <tr>
                                        <td><h6>Password: </h6></td>
                                        <td><input type="password" class="form_input_f" name="pass" id="pass" required></td>
                                    </tr>
                                </table>   
                                <br>            
                                <input type="submit" value="Login" class="signup_login_btn">
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
        <!-- FOOTER END -->
        <!-- ------------------ -->

    </body>
</html>
