/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.ProductDAO;
import com.models.Product;
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
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Product")) {
            request.getRequestDispatcher("/ProductManagement.jsp").forward(request, response);
        } else {
            if (path.endsWith("/Product/New")) {
                request.getRequestDispatcher("/AddProduct.jsp").forward(request, response);
            } else {
                if (path.startsWith("/Product/Edit/")) {
                    // split path to get makh
                    String[] s = path.split("/");
                    String ProductID = s[s.length - 1];
                    ProductDAO dao = new ProductDAO();
                    Product pd = dao.getProduct(ProductID);
                    if (ProductID == null) {
                        response.sendRedirect("/Product");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("informationProduct", pd);
                        request.getRequestDispatcher("/EditProduct.jsp").forward(request, response);
                    }
                } else {
                    if (path.startsWith("/Product/Delete/")) {
                        String[] s = path.split("/");
                        String ProductID = s[s.length - 1];
                        ProductDAO dao = new ProductDAO();
                        dao.deleteProduct(ProductID);
                        response.sendRedirect("/Product");
                    } else {
                        if (path.startsWith("/Product/Info/")) {
                            String[] s = path.split("/");
                            String ProductID = s[s.length - 1];
                            ProductDAO dao = new ProductDAO();
                            Product pd;
                            pd = dao.getProduct(ProductID);
                            HttpSession session = request.getSession();
                            session.setAttribute("informationProduct", pd);
                            request.getRequestDispatcher("/InfoProduct.jsp").forward(request, response);
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
        if (request.getParameter("btnInsert") != null) {
            ProductDAO dao = new ProductDAO();
            String ProductID = request.getParameter("txtProductID");
            boolean check = dao.checkProductId(ProductID);
            if (check == true) {
                request.setAttribute("mess", "Product ID already exists!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AddProduct.jsp");
                dispatcher.forward(request, response);
            } else {
                String ProductName = request.getParameter("txtProductName");
                String Description = request.getParameter("txtDescription");
                String Price = request.getParameter("txtPrice");
                String LinkPicture = request.getParameter("txtLinkPicture");
                String TypeProduct = request.getParameter("txtTypeProduct");
                Product pd = new Product(ProductID, ProductName, Description, Integer.parseInt(Price), LinkPicture, TypeProduct);
                int count = dao.addProduct(pd);
                if (count > 0) {
                    response.sendRedirect("/Product");
                } else {
                    request.setAttribute("mess", "Added Product Failed!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/AddProduct.jsp");
                    dispatcher.forward(request, response);
                }
            }

        } else if (request.getParameter("btnUpdate") != null) {
            String ProductID = request.getParameter("txtProductID");
            String ProductName = request.getParameter("txtProductName");
            String Description = request.getParameter("txtDescription");
            String Price = request.getParameter("txtPrice");
            String LinkPicture = request.getParameter("txtLinkPicture");
            String TypeProduct = request.getParameter("txtTypeProduct");
            ProductDAO dao = new ProductDAO();
            Product pd = new Product(ProductID, ProductName, Description, Integer.parseInt(Price), LinkPicture, TypeProduct);
            int count = dao.updateProduct(pd);
            if (count > 0) {
                response.sendRedirect("/Product");
            } else {
                request.setAttribute("mess", "Update Product Failed!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/EditProduct.jsp");
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
