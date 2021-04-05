
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
            <div id="sidebar" class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu" id="nav-accordion">
                    <h5 class="centered">ADMIN COMMAND LIST</h5>
<!--                    <li class="mt">
                        <a href="indexadmin.jsp">
                            <i class="fa fa-dashboard"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>-->
                    <li class="sub-menu">
                        <a href="adminmanager.jsp">
                            <i class="fa fa-desktop"></i>
                            <span>Manager List</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="admincustomer.jsp">
                            <i class="fa fa-comments-o"></i>
                            <span>Customer List</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;">
                            <i class="fa fa-cogs"></i>
                            <span>Product</span>
                        </a>
                        <ul class="sub">
                            <li>
                                <a href="adminproduct.jsp">Product List</a>
                            </li>
                            <li>
                                <a href="adminproducttype.jsp">Product Type Manage</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;">
                            <i class="fa fa-book"></i>
                            <span>Bill</span>
                        </a>
                        <ul class="sub">
                            <li>
                                <a href="adminbill.jsp">Bill Manage</a>
                            </li>
                            <li>
                                <a href="adminbilldetail.jsp">Bill Detail Manage</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sub-menu">
                        <a href="adminbrand.jsp">
                            <i class="fa fa-tasks"></i>
                            <span>Brand Manage</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="adminnation.jsp">
                            <i class="fa fa-map-marker"></i>
                            <span>Nation Manage</span>
                        </a>                   
                    </li>
                    <li class="sub-menu">
                        <a href="adminreport.jsp">
                            <i class="fa fa-book"></i>
                            <span>Report</span>
                        </a>                   
                    </li>
                    <li class="sub-menu">
                        <a href="admininventory.jsp">
                            <i class="fa fa-book"></i>
                            <span>Inventory Summary</span>
                        </a>                   
                    </li>
                    <li class="sub-menu">
                        <a href="../AdminLogoutServlet"> 
                            <i class="fa fa-key"></i>
                            <span>Log Out</span>
                        </a>                   
                    </li>
                </ul>                                                    
                <!-- sidebar menu end-->
            </div>