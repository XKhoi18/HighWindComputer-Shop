<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CONTACT US</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Questrial&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="css/main.css" />
        <link rel="stylesheet" href="css/contact-us.css" />
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
            <div class="bg_contact_page">
                <div class="login__page">
                    <div class="welcome__text">
                        <h4>Need Help? Call us or submit a support ticket below.</h4>
                    </div>
                    <div class="maps" style="margin-bottom: 10px;">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.4730315658317!2d106.68787351462257!3d10.775036392322491!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3b11ad45f5%3A0xe364d9f90dac0f2e!2sMinh%20Long%20Tower!5e0!3m2!1svi!2s!4v1611553830456!5m2!1svi!2s"
                            width="100%" height="400px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                            tabindex="0"></iframe>
                    </div>

                    <div class="contactus_section">
                        <div class="address_section">
                            <h5>OUR SHOWROOM</h5>
                            <ul>
                                <li><b>Head office address:</b> </li>
                                <li>Floor 5, No. 117-119-121 Nguyen Du, Ben Thanh Ward, District 1, Ho Chi Minh City</li>
                                <li><b>Northern executive office:</b> </li>
                                <li>Floor 6, No. 1 Thai Ha Street, Trung Liet Ward, Dong Da District, Hanoi</li>
                                <li><b>Southern executive office:</b> </li>
                                <li>
                                    Floor 11 Minh Long Tower, No. 17 Ba Huyen Thanh Quan, Ward 6, District 3, City. Ho Chi Minh
                                </li>
                                <li>
                                    <b>Hotline: </b>18006867 - 02873016867
                                </li>
                                <li>
                                    <b>Open time: </b>08h00 - 21h30
                                </li>
                                <li>
                                    <b>Email: </b><a
                                        href="mailto:highwind_computer@gmail.com?subject=your title&body=TThe message">highwind_computer@mail.com</a>
                                </li>
                            </ul>
                        </div>

                        <div class="question_section">
                            <h5>YOUR QUESTION FOR US</h5>
                            <div class="question_form">
                                <form method="post" id="contactForm" name="contact-form" data-toggle="validator"
                                      action="mailto:khoi0no1@gmail.com?subject=SiteUser" enctype="text/plain">
                                    <!-- Name -->
                                    <div class="form_group">
                                        <label class="control-label" for="name">Name: </label>
                                        <input class="form-control" id="name" type="text" name="Name" required
                                               data-error="Please enter your name">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <!-- email -->
                                    <div class="form_group">
                                        <label class="control-label" for="email">Email: </label>
                                        <input class="form-control" id="email" type="email" name="Email" required
                                               data-error="Please enter your Email">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <!-- Subject -->
                                    <div class="form_group">
                                        <label class="control-label">Subject: </label>
                                        <input class="form-control" id="msg_subject" type="text" name="Subject" required
                                               data-error="Please enter your message subject">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <!-- Message -->
                                    <div class="form_group">
                                        <label for="message" class="control-label">Message: </label>
                                        <textarea class="form-control" rows="3" id="message" name="Message" required
                                                  data-error="Write your message"></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <!-- Form Submit -->
                                    <div class="form-submit mt-4">
                                        <button class="btn btn-primary" type="submit" id="form-submit"><i
                                                class="material-icons mdi mdi-message-outline"></i> Send Message</button>
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="notice__message">
                        <span><b>SOME DELIVERIES ARE DELAYED DUE TO COVID-19.</b> Please allow another 2+ days for tracking to
                            appear, and 2-5 days for deliveries due to delays. ALL dispatched orders are picked up from us EVERY
                            DAY - if you received a tracking number YOUR ORDER HAS LEFT OUR WAREHOUSE 100%! Apologies on behalf
                            of VNPost for the delays and lack of tracking updates. <b>Please do not contact us regarding minor
                                delays and lack of tracking updates</b> as our team can only inform you of the above and we are
                            under heavy ticket and phone support load and Australia Post delay issues are adding to this - we
                            ask for your patience and thank you for your consideration in this difficult time.</span>
                    </div>
                </div>
                <!-- MAIN CONTENT END -->
                <!-- ------------------ -->

                <!-- ------------------ -->
                <!-- FOOTER START-->
                <footer class="footer">
                <jsp:include page="model/footer.jsp"></jsp:include>
            </footer>
    </body>

</html>
