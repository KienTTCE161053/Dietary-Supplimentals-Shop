<%-- 
    Document   : HomeAdmin
    Created on : Nov 7, 2022, 9:32:33 AM
    Author     : QuangQui
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.daos.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Admin</title>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/main_styles.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
        <style>

            #myBtn {
                display: none;
                position: fixed;
                bottom: 10px;
                right: 43px;
                z-index: 99;
                font-size: 18px;
                border: none;
                outline: none;
                background-color: red;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 4px;
            }

            #myBtn:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <div class="super_container">

            <!-- Header -->
            <header class="header trans_300">

                <!-- Top Navigation -->
                <div class="top_nav">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="top_nav_left">Welcome to Admin Page!</div>
                            </div>
                            <div class="col-md-6 text-right">
                                <div class="top_nav_right">
                                    <ul class="top_nav_menu">
                                        <!--  My Account -->
                                        <li class="account">
                                            <a href="<%= getServletContext().getContextPath()%>/Login">Sign Out</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Navigation -->
                <div class="main_nav_container">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-right">
                                <div class="logo_container">
                                    <a>Group 1 <span>shop</span></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="/Product">Product Management</a></li>
                                        <li><a href="/Account">Account Management</a></li>
                                        <li><a href="/Order">Order Management</a></li>
                                    </ul>
                                    <ul class="navbar_user">
                                        <li><a href="https://docs.google.com/forms/u/1/?tgif=c"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <div class="hamburger_container">
                                        <i class="fa fa-bars" aria-hidden="true"></i>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="fs_menu_overlay"></div>
            <div class="hamburger_menu">
                <div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
                <div class="hamburger_menu_content text-right">
                    <ul class="menu_top_nav">
                        <li class="menu_item has-children">
                            <a href="<%= getServletContext().getContextPath()%>/Login">Sign Out</a>
                        </li>                  
                    </ul>
                </div>
            </div>
        </div>
                        
        <!-- New Arrivals -->
        <div class="new_arrivals">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <div class="section_title new_arrivals_title">
                            <h2>New Arrivals</h2>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col text-center">
                        <div class="new_arrivals_sorting">
                            <ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">all</li>
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Resistance">Resistance</li>
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Sleep">Sleep deprivation</li>
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Digestion">Digestion</li>
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Liver">Liver</li><!-- comment -->
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".HighBlood">High Blood Sugar</li><!-- comment -->
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Weight">Weight</li><!-- comment -->
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Skin">For Skin</li><!-- comment -->
                                <li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Eyes">Eyes</li><!-- comment -->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
                            <!-- Product -->
                            <%
                                ProductDAO dao = new ProductDAO();
                                ResultSet rs = dao.getAll();
                                while (rs.next()) {
                            %>
                            <div class="product-item <%= rs.getString("TypeProduct")%>">
                                <div class="product discount product_filter">
                                    <div class="product_image">
                                        <img src="<%= rs.getString("LinkPicture")%>" alt="">
                                    </div>
                                    <div class="favorite favorite_left"></div>
                                    <div class="product_info">
                                        <h6 class="product_name"><a href="/Product/Info/<%= rs.getString("ProductID")%>"><%= rs.getString("ProductName")%></a></h6>
                                        <div class="product_price"><%= rs.getString("Price")%>VND</div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
                            <ul class="footer_nav">
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">FAQs</a></li>
                                <li><a href="contact.jsp">Contact us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer_nav_container">
                            <div class="cr"> Template by <a href="#">©Group 1</a></div>                                
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!--button on top-->
        <button onclick="topFunction()" id="myBtn" title="Go to top">TOP</button>

        <!--Link Java Script-->
       <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        <script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
        <script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
        <script>
            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };
            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("myBtn").style.display = "block";
                } else {
                    document.getElementById("myBtn").style.display = "none";
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </body>
</html>
