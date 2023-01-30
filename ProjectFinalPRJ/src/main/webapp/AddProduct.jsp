<%-- 
    Document   : AddProduct
    Created on : Nov 7, 2022, 9:57:52 AM
    Author     : QuangQui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Addition Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo-style.css">
    </head>
    <body>
        <%
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
                                <h2 class="tm-block-title d-inline-block">Add Product</h2>
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
                                            type="text"
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
                                            name="txtDescription"
                                            rows="3"
                                            required
                                            ></textarea>
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
                                            type="number"
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
                                            name="txtTypeProduct"
                                            id="category"
                                            >
                                            <option selected>Select category</option>
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
                                <input type="submit" class="btn btn-primary btn-block text-uppercase" value="Add" name="btnInsert"/>
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
