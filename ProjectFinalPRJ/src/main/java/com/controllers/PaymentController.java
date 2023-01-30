/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.OrderDAO;
import com.daos.OrderElementDAO;
import com.models.Order;
import com.models.OrderElement;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author QuangQui
 */
public class PaymentController extends HttpServlet {

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
//        String path = request.getRequestURI();
//        if (path.endsWith("/Payment")) {
//            String[] s = path.split("/");
//            String username = s[s.length - 1];
//            HttpSession session = request.getSession();
//            session.setAttribute("username", username);
//            request.getRequestDispatcher("/Payment.jsp").forward(request, response);
//        }
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
        if (request.getParameter("btnOrder") != null) {
            String Username = request.getParameter("txtUsername");
            String totalBill = request.getParameter("txtTotalBill");
            String OrderID = request.getParameter("txtOrderID");
            String address = request.getParameter("txtAddress");
            String city = request.getParameter("txtCountry");
            String Country = request.getParameter("txtCountry");
            String DeliveryAddress = address + city + Country;
            Order or = new Order(OrderID, Username, DeliveryAddress, Integer.valueOf(totalBill));
            OrderDAO dao = new OrderDAO();
            int count = dao.addOrder(or);
            if (count > 0) {
                response.sendRedirect("/");
            } else {
                request.setAttribute("mess", "Payment Failed!");
                response.sendRedirect("/");
                return;
            }
        }
        if (request.getParameter("btnP") != null) {
            OrderDAO dao = new OrderDAO();
            OrderElementDAO daoR = new OrderElementDAO();
//            Lay danh sach dat hang
            String s = request.getParameter("blind");
            String username = request.getParameter("username");
//            random orderID           
            String OrderID;
            boolean check;
//            lap toi khi nao hk trung thi thui
            do {
                OrderID = random();
                check = dao.checkOrder(String.valueOf(OrderID));
            } while (check == true);
            s = s.substring(0, s.length() - 1);
            String array[] = s.split("/");
            String total = array[0];
            total = total.replace(",", ".");
            total = total.replace(".", "");
            total = total.substring(1, total.length() - 2);
            for (int i = 1; i < array.length; i++) {
                String obj[] = array[i].split(":");
                obj[3] = obj[3].replace(",", ".");
                obj[3] = obj[3].replace(".", "");
                obj[3] = obj[3].substring(1, obj[3].length() - 2);
                OrderElement oe = new OrderElement(String.valueOf(OrderID), obj[0], obj[2], obj[3]);
                daoR.addOrderElement(oe);
            }
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("totalPrice", total);
            session.setAttribute("OrderID", OrderID);
            request.getRequestDispatcher("/Payment.jsp").forward(request, response);
        }
    }

    /**
     * Random orderID
     *
     * @return
     */
    public String random() {
        int min = 1;
        int max = 1000000000;

        //Generate random int value from 1 to 1000000000 
        int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);
        return String.valueOf(random_int);
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
