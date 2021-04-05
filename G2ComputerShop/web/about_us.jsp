<%-- 
    Document   : about_us
    Created on : Jan 25, 2021, 4:19:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ABOUT US</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Questrial&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="css/about-us.css" />
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
            <div class="bg_about_page">
                <div class="about__page">
                    <div class="welcome__text">
                        <h4>About High Wind</h4>
                    </div>
                    <div class="about__content">
                        <h5><B>HIGH WIND TRADING & SERVICE CORPORATION</B> </h5>
                        <div class="about__text">
                            <ul>
                                <li>Founded in 1997 as a computer shop, High Wind has grown into one of the most reputable
                                    retailers in Vietnam. Uniquely focused on information technology products, gaming devices,
                                    office equipment and hi-tech products, High Wind has been bringing to the market products
                                    from leading brands such as Dell, Asus, HP, MSI, Lenovo… </li>
                                <li>During our 23 years of development, at High Wind, we have always been aiming at going beyond
                                    a computer business but trying to enrich people’s lives through providing our customers with
                                    a wide variety of modern technology gadgets and our signature high-quality services.</li>
                            </ul>
                        </div>
                        <h5><b>MONOLY VIETNAM</b></h5>
                        <div class="about__text">
                            <ul>
                                <li>Founded on Jan 13th, 2017 as one of the key members of VNLife Group, Monoly's principal task
                                    is to provide consultations to our associates & partners in finding and creating
                                    breakthroughs using technology. We have an impressive record of engineering efficiency
                                    improvements and cost- cutting solutions for our partners in E-commerce, Payment and
                                    Logistics. </li>
                                <li>In addition, Monoly Ventures is investing in various industries: Fintech, New Retail,
                                    Logistics, Warehouse, Digital Entertainment, B2B Management Solution. Monoly member units
                                    include: High Wind Trading and Service Corporation, Tripi Vietnam, Jupviec.vn, Pos365.vn,
                                    Sapo.vn, VNPAY, Umbala, VVM Investment and Trade Company, Tenpoint7.VN.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="welcome__text">
                        <h4>High Wind Business</h4>
                    </div>
                    <div class="about__content">
                        <img src="img/business.jpg" width="100%" alt="our business">
                        <div class="about__text">
                            <ul>
                                <li>High Wind provides full range of ICT & hi-end devices for home users</li>
                                <li>High Wind also offers ICT system integrated solution for SMBs</li>
                                <li>High Wind provides special solutions for enterprises such as video conference, digital
                                    screens, payment management system</li>
                                <li>High Wind is deeply passionate about bringing our customers a wide assortment of consumer
                                    electronic devices, home appliances & smart home devices</li>
                                <li>Premium partner: Asus, Dell, Acer, Hp, Lenovo, AMD, MSI, LG, Intel, Apple, Samsung,
                                    Microsoft, GigaByte, Logitech, NVIDIA, Kingston, KB Vision, Xiaomi, JBL, Bose, Sony,
                                    Microlab, Razer,…</li>
                            </ul>

                            <span id="txt-text"><i><b>...We always expand categories to earn customers’ satisfaction…</b></i></span>
                        </div>
                    </div>

                    <div class="welcome__text">
                        <h4>MISSION AND VISION</h4>
                    </div>
                    <div class="about__content">
                        <img src="img/mission.jpg" width="100%" alt="our mission">
                        <img src="img/vision.jpg" width="100%" alt="our vision">
                    </div>

                    <div class="welcome__text">
                        <h4>CORE VALUE</h4>
                    </div>
                    <div class="about__content">
                        <img src="img/corevalue.jpg" width="100%" alt="our mission">
                    </div>

                    <div class="welcome__text">
                        <h4>ORGANIZATION</h4>
                    </div>
                    <div class="about__content">
                        <img src="img/organization.jpg" width="100%" alt="our ORGANIZATION">
                    </div>

                    <div class="welcome__text">
                        <h4>NUMBER TALK</h4>
                    </div>
                    <div class="about__content">
                        <img src="img/numbertalk.jpg" width="100%" alt="our number talk">
                        <div class="about__text">

                            <span id="txt-text"><b>We are proud to achieve many Awards in Hi-tech & Computing retail segment</b></span>

                            <ul>
                                <li>Top 10 ICT retailers in Vietnam (ICT Associate, HCMC)</li>
                                <li>The most favorite ICT retailer in Southern Vietnam (eChip)</li>
                                <li>Premium partner with leading global ICT manufacturers
                                    : Asus, Dell, Acer, Hp, Lenovo, AMD, MSI, LG, Intel, Apple, Samsung, Microsoft, GigaByte,
                                    Logitech, NVIDIA, Kingston, KB Vision, Xiaomi, JBL, Bose, Sony, Microlab, Razer,…</li>
                            </ul>
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
    </body>

</html>
