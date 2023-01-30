/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuangQui
 */
public class HomeController extends HttpServlet {

   

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
       AccountDAO daoAcc = new AccountDAO();
        ResultSet ac = daoAcc.getAll();
        List<String> accList = new ArrayList<>();
        try {
            while (ac.next()) {
                accList.add(ac.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String nameOfUser = "";
        Cookie cookie = null;
        Cookie[] cookies = null;
        cookies = request.getCookies();
        int check = 0;
        if ((cookies != null)) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                for (int j = 0; j < accList.size(); j++) {
                    if ((cookie.getValue()).equals(accList.get(j))) {
                        nameOfUser = cookie.getValue();
                        String type = daoAcc.getTypeAccount(nameOfUser);
                        if (type.equals("admin")) {
                            request.setAttribute("username", nameOfUser);
                            request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response);
                            return;
                        } else {
                            request.setAttribute("username", nameOfUser);
                            request.getRequestDispatcher("/Home.jsp").forward(request, response);
                            return;
                        }
                    } else {
                        check++;
                    }
                }
            }
            if (check > 0) {
                response.sendRedirect("/Login");
                return;
            }
        } else {
            response.sendRedirect("/Login");

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
