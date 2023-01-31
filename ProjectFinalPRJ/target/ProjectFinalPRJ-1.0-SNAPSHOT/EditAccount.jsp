<%-- 
    Document   : EditAccount
    Created on : Nov 7, 2022, 10:13:26 AM
    Author     : QuangQui
--%>

<%@page import="com.models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Information</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo-style.css">
    </head>
    <body>
        <%
            Account ac = (Account) session.getAttribute("informationAccount");
            String mess = (String) request.getAttribute("mess");
        %>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <%
                                    if (mess != null) {
                                %>
                                <h2 class="tm-block-title d-inline-block"><%= mess%></h2>
                                <%
                                } else {
                                %>
                                <h2 class="tm-block-title d-inline-block">Edit Account</h2>
                                <%
                                    }
                                %>   
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form method="post" action="AccountController" class="tm-edit-product-form">
                                    <div class="form-group mb-3">
                                        <label for="name">Username
                                        </label>
                                        <input id="name" name="txtUsername" type="text" value="<%= ac.Username%>" readonly class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">FullName
                                        </label>
                                        <input id="name" name="txtFullName" value="<%= ac.FullName%>" type="text" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">New Password
                                        </label>
                                        <input id="name" name="txtPassword" type="text" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Confirm Password
                                        </label>
                                        <input id="name" name="txtConfirmPassword" type="text" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Phone Number
                                        </label>
                                        <input id="name" name="txtPhoneNumber" value="<%= ac.PhoneNumber%>" type="text" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="category">Gender</label>
                                        <select class="custom-select tm-select-accounts" name="txtGender" id="category">
                                            <option selected value="<%= ac.Gender%>">Gender current: <%= ac.Gender%></option>
                                            <option value="Male" >Male</option>
                                            <option value="Female">Female</option>                 
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="description">Address</label>
                                        <textarea class="form-control validate" rows="3" name="txtAddress" required><%= ac.Address%></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Type Account
                                        </label>
                                        <input id="name" name="txtTypeAccount" type="text" readonly value="<%= ac.TypeAccount%>" class="form-control validate" required />
                                    </div>


                            </div>

                            <div class="col-12">
                                <input type="submit" class="btn btn-primary btn-block text-uppercase" value="Update" name="btnUpdate"/>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jquery-ui-datepicker/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                $("#expire_date").datepicker();
            });
        </script>
    </body>
</html>
