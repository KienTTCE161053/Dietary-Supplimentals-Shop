<%-- 
    Document   : SignIn
    Created on : Nov 7, 2022, 9:19:03 AM
    Author     : QuangQui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/css/main.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/vendor/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/vendor/animate/animate.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/vendor/css-hamburgers/hamburgers.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/vendor/select2/select2.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/css/util.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Login/css/main.css">
    </head>
    <body>
        <%
            String mess = (String) request.getAttribute("mess");
        %>
        <div class="limiter">
            <div class="container-login100" style="background: url('${pageContext.request.contextPath}/resources/Login/images/doctor1.jpg') no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
                <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
                    <form class="login100-form validate-form flex-sb flex-w" id="loginForm" method="post" action="HomeController">
                        <span class="login100-form-title p-b-53">
                            <%
                                if (mess != null) {
                            %>
                            <%= mess%>
                            <%
                            } else {
                            %>
                            Sign In Now
                            <%
                                }
                            %>
                        </span>			
                        <div class="p-t-31 p-b-9">
                            <span class="txt1">Username</span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "">
                            <input class="input100" type="text" name="txtUsername" id="username" >
                            <span class="focus-input100"></span>
                        </div>
                        <div class="p-t-13 p-b-9">
                            <span class="txt1">Password</span>
                            <a href="https://forms.gle/PRohrRmHJDJEhMqm6" class="txt2 bo1 m-l-5">Forgot?</a>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "">
                            <input class="input100" type="password" name="txtPassword" id="password">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="container-login100-form-btn m-t-17">
                            <input type="submit" class="login100-form-btn" value="Sign In" name="btnSignIn"/>
                        </div>
                        <div class="w-full text-center p-t-55">
                            <span class="txt2">Not a member?</span>
                            <a href="/Login/NewAccount" class="txt2 bo1">SIGN UP NOW</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="dropDownSelect1"></div>

        <!--Link JS-->
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/animsition/js/animsition.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/bootstrap/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/daterangepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/daterangepicker/daterangepicker.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/vendor/countdowntime/countdowntime.js"></script>
        <script src="${pageContext.request.contextPath}/resources/Login/js/main.js"></script>
    </body>
</html>
