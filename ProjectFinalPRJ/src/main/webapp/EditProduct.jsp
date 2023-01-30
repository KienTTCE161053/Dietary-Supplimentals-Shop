<%-- 
    Document   : EditProduct
    Created on : Nov 7, 2022, 10:11:17 AM
    Author     : QuangQui
--%>

<%@page import="com.models.Product"%>
<%@page import="com.daos.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edition Product </title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo-style.css">
    </head>
    <body>
        <%
            Product pd = (Product) session.getAttribute("informationProduct");
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
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                                <%
                                    }
                                %>                                   
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form method="post" action="ProductController" class="tm-edit-product-form">
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product ID
                                        </label>
                                        <input
                                            id="name"
                                            name="txtProductID"
                                            type="text" readonly
                                            value="<%= pd.ProductID%>"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <input
                                            id="name"
                                            name="txtProductName"
                                            type="text"
                                            value="<%= pd.ProductName%>"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <textarea
                                            class="form-control validate"
                                            rows="3"
                                            name="txtDescription"

                                            required
                                            ><%= pd.Description%></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Link Picture
                                        </label>
                                        <input
                                            id="name"
                                            name="txtLinkPicture"
                                            type="text"
                                            value="<%= pd.LinkPicture%>"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Price
                                        </label>
                                        <input
                                            id="name"
                                            name="txtPrice"
                                            type="text"
                                            value="<%= pd.Price%>"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="category"

                                            >Type Product</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            id="category"
                                            name="txtTypeProduct"
                                            >
                                            <option selected value="<%= pd.TypeProduct%>">Type Product Current: <%= pd.TypeProduct%></option>
                                            <option value="Resistance">Resistance</option>
                                            <option value="Sleep">Sleep Deprivation</option>
                                            <option value="Digestion">Digestion</option>
                                            <option value="Liver">Liver</option>
                                            <option value="HighBlood">High Blood Sugar</option>
                                            <option value="Weight">Weight</option>
                                            <option value="Skin">For Skin</option>
                                            <option value="Eyes">Eyes</option>
                                        </select>
                                    </div>
                            </div>

                            <div class="col-12">
                                <input type="submit" class="btn btn-primary btn-block text-uppercase" value="Submit" name="btnUpdate"/>
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
