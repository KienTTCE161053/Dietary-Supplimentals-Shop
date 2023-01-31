<%-- 
    Document   : AccountManagement
    Created on : Nov 7, 2022, 9:53:07 AM
    Author     : QuangQui
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.daos.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #4e657a;
                font-family: 'Roboto', sans-serif;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                color: #fff;
                background:  #435c70;
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .search-box {
                position: relative;
                float: right;
            }
            .search-box .input-group {
                min-width: 300px;
                position: absolute;
                right: 0;
            }
            .search-box .input-group-addon, .search-box input {
                border-color: #ddd;
                border-radius: 0;
            }
            .search-box input {
                height: 34px;
                padding-right: 35px;
                background: #f4fcfd;
                border: none;
                border-radius: 2px !important;
            }
            .search-box input:focus {
                background: #fff;
            }
            .search-box .input-group-addon {
                min-width: 35px;
                border: none;
                background: transparent;
                position: absolute;
                right: 0;
                z-index: 9;
                padding: 6px 0;
            }
            .search-box i {
                color: #a0a5b1;
                font-size: 19px;
                position: relative;
                top: 2px;
            }

            .addNew {
                position: relative;
                float: right;
                margin-bottom: 5px



            }
            .addNew .btn btn-success {
                min-width: 35px;
                border: none;
                background: transparent;
                position: absolute;
                right: 0;
                z-index: 9;
                padding: 6px 0;
                margin-top: 5px

            }
            .addNew i {
                color: #a0a5b1;
                font-size: 19px;
                position: relative;
                top: 2px;
            }
            table.table {
                table-layout: fixed;
                margin-top: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table th:first-child {
                width: 60px;
            }
            table.table th:last-child {
                width: 120px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }
            back {
                padding-bottom: 5px;
            }
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
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">			
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>Account Management</h2>
                            </div>
                            <div class="col-sm-5">
                                <div class="search-box">
                                    <div class="input-group">								
                                        <input type="text" id="search" class="form-control" placeholder="Search by Username">
                                        <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2" >
                                <div class="addNew">
                                    <a href="/" class="btn btn-success"><i class="material-icons">&#xe88a;</i> <span>Back Home</span></a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <button onclick="topFunction()" id="myBtn" title="Go to top">TOP</button>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th style="width: 15%">Username</th>
                                <th style="width: 12%">Password</th>                           
                                <th style="width: 18%">FullName</th>
                                <th style="width: 12%">PhoneNumber</th>
                                <th style="width: 8%">Gender</th>
                                <th style="width: 15%">Address</th>
                                <th style="width: 11%">TypeAccount</th>
                                <th style="width: 10%">Actions</th>
                            </tr>
                        </thead>
                        <%
                            AccountDAO dao = new AccountDAO();
                            ResultSet rs = dao.getAll();
                            while (rs.next()) {
                        %>
                        <tbody>
                            <tr>
                                <td><%= rs.getString("Username")%></td>
                                <td><%= rs.getString("Password")%></td>
                                <td><%= rs.getString("FullName")%></td>
                                <td><%= rs.getInt("PhoneNumber")%></td>
                                <td><%= rs.getString("Gender")%></td>
                                <td><%= rs.getString("Address")%></td>
                                <%
                                    if (rs.getString("TypeAccount").equals("admin")) {
                                %>
                                <td><i class="material-icons haha">&#xe853;</i></td>
                                <%
                                } else {
                                %>
                                <td><i class="material-icons haha">&#xe7fc;</i></td>

                                <%
                                    }
                                %>
                                <td>
                                    <a href="/Account/Change/<%= rs.getString("Username")%>" class="edit" title="Change Permission" data-toggle="tooltip"><i class="material-icons">&#xe869;</i></a>
                                    <a href="/Account/Delete/<%= rs.getString("Username")%>" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>

                        </tbody>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>        
        </div>     
        <script>
            $(document).ready(function () {
                // Activate tooltips
                $('[data-toggle="tooltip"]').tooltip();
                // Filter table rows based on searched term
                $("#search").on("keyup", function () {
                    var term = $(this).val().toLowerCase();
                    $("table tbody tr").each(function () {
                        $row = $(this);
                        var name = $row.find("td:nth-child(1)").text().toLowerCase();
                        console.log(name);
                        if (name.search(term) < 0) {
                            $row.hide();
                        } else {
                            $row.show();
                        }
                    });
                });
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
            });
        </script>
    </body>
</html>
