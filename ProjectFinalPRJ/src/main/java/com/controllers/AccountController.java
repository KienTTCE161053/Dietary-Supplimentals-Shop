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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author QuangQui
 */
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Account")) {
            request.getRequestDispatcher("/AccountManagement.jsp").forward(request, response);
        } else {
            if (path.startsWith("/Account/Edit/")) {
                // split path to get username
                String[] s = path.split("/");
                String username = s[s.length - 1];
                AccountDAO dao = new AccountDAO();
                Account ac = dao.getAccount(username);
                if (username == null) {
                    request.getRequestDispatcher("/Home.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("informationAccount", ac);
                    request.getRequestDispatcher("/EditAccount.jsp").forward(request, response);
                }
            } else {
                if (path.startsWith("/Account/Delete/")) {
                    String[] s = path.split("/");
                    String username = s[s.length - 1];
                    AccountDAO dao = new AccountDAO();
                    if (username.equals("admin")) {
                        response.sendRedirect("/Account");
                    } else {
                        dao.deleteAccount(username);
                        response.sendRedirect("/Account");
                    }

                } else {
                    if (path.startsWith("/Account/Change/")) {
                        String[] s = path.split("/");
                        String username = s[s.length - 1];
                        AccountDAO dao = new AccountDAO();
                        String TypeAccount = dao.getTypeAccount(username);
                        if (username.equals("admin")) {
                            response.sendRedirect("/Account");
                        } else if (TypeAccount.equals("customer")) {
                            Account ac;
                            ac = dao.getAccount(username);
                            dao.SetTypeAdminAccount(ac);
                            response.sendRedirect("/Account");
                        } else if (TypeAccount.equals("admin")) {
                            Account ac;
                            ac = dao.getAccount(username);
                            dao.SetTypeCustomerAccount(ac);
                            response.sendRedirect("/Account");
                        }
                    }
                }
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
        if (request.getParameter("btnUpdate") != null) {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String fullname = request.getParameter("txtFullName");
            String phonenumber = request.getParameter("txtPhoneNumber");
            String gender = request.getParameter("txtGender");
            String address = request.getParameter("txtAddress");
            String typeaccount = request.getParameter("txtTypeAccount");
            AccountDAO dao = new AccountDAO();
            Account ac = new Account(username, password, fullname, Integer.parseInt(phonenumber), gender, address, typeaccount);
            int count = dao.updateAccount(ac);
            if (count > 0) {
                request.setAttribute("username", username);
                request.getRequestDispatcher("/Home.jsp").forward(request, response);

            } else {
                request.setAttribute("mess", "Update Infomation Failed!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/EditAccount.jsp");
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
