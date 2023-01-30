/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.AccountDAO;
import com.models.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author QuangQui
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.endsWith("/Login")) {
             Cookie cookie = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                        // delete cookie
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                }
            } 
            request.getRequestDispatcher("/SignIn.jsp").forward(request, response);
        } else {
            if (path.endsWith("/Login/NewAccount")) {
                request.getRequestDispatcher("/SignUp.jsp").forward(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnSignUp") != null) {
            AccountDAO dao = new AccountDAO();
            String username = request.getParameter("txtUsername");
            boolean check = dao.checkUsername(username);
            if (check == true) {
                request.setAttribute("mess", "Username already exists!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/SignUp.jsp");
                dispatcher.forward(request, response);
            } else {
                String password = request.getParameter("txtPassword");
                String fullname = request.getParameter("txtFullName");
                String phonenumber = request.getParameter("txtPhoneNumber");
                String gender = request.getParameter("txtGender");
                String address = request.getParameter("txtAddress");
                String typeaccount = "customer";
                Account st = new Account(username, password, fullname, Integer.parseInt(phonenumber), gender, address, typeaccount);
                int count = dao.addNew(st);
                if (count > 0) {
                    request.setAttribute("mess", "Sign Up Successfully! You can sign in now!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/SignIn.jsp");
                    dispatcher.forward(request, response);

                } else {
                    request.setAttribute("mess", "Sign Up Failed! Please Sign Up again!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/SignUp.jsp");
                    dispatcher.forward(request, response);
                }
            }

        }
        if (request.getParameter("btnSignIn") != null) {
            AccountDAO dao = new AccountDAO();
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");

            boolean check = dao.checkUsername(username);
            if (check == true) {
                String passwordAccount = dao.getAccountPassword(username);
                if (password.equals(passwordAccount)) {
                    Cookie accLogin = new Cookie("username", username);
                    accLogin.setMaxAge(60 * 60 * 72);
                    response.addCookie(accLogin);
                    String type = dao.getTypeAccount(username);
                    if (type.equals("admin")) {
                        request.setAttribute("username", username);
                        request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                    } else {
                        request.setAttribute("username", username);
                        request.getRequestDispatcher("/Home.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("mess", "Username or Password is not correct! Please check again!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/SignIn.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                request.setAttribute("mess", "Username is not exist!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/SignIn.jsp");
                dispatcher.forward(request, response);
            }

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
