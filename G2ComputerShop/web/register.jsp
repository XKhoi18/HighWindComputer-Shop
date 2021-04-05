<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register to High Wind</title>
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
                <div class="login__page">
                    <div class="welcome__text">
                        <h4>Welcome, Please Sign In!</h4>
                    </div>
                    <div class="signup_login_section">
                        <div class="register_section">
                            <form action="registerServlet" method="post">
                            <h5>Register Page</h5>
                            <br>                           
                                <table>
                                    <tr>
                                        <td>Name: </td>
                                        <td>
                                            <input class="form_input_f" type="text" name="customer_name" required>    
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Gender: </td>
                                        <td>
                                            <select name= "customer_gender" style="width: 183px; height:30px;">                         
                                                <option value="1">Male</option>
                                                <option value="2">Female</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Date Of Birth: </td>
                                        <td>
                                            <input type="date" name="customer_DOB" style="width: 183px; height:30px;" required>
                                            
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Email: </td>
                                        <td>
                                            <input class="form_input_f" type="text" name="customer_email" required>
                                         
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone: </td>
                                        <td>
                                            <input class="form_input_f" type="text" name="customer_phone" required>
                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Address: </td>
                                        <td>
                                            <input class="form_input_f" type="text" name="customer_address" required>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><h6>Username: </h6></td>
                                        <td>
                                            <input type="text" class="form_input_f" name="customer_username" required>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><h6>Password: </h6></td>
                                        <td>
                                            <input type="password" class="form_input_f" name="customer_pass" required>
                                        </td>
                                    </tr>
                                </table>   
                                <br>            
                                <input type="submit" value="Register" class="signup_login_btn">
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