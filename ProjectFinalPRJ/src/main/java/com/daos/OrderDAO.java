/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuangQui
 */
public class OrderDAO {
     private Connection conn = null;

    public OrderDAO() {
        conn = DBConnection.getConnection();
    }

    /**
     * Phuong thuc nay dung de lay tat ca thong tin cua cac KH trong csdl
     *
     * @return mot ResultSet chua danh sach khach hang
     */
    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from [Order]");
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
     /**
     *
     *
     * @param OrderID
     * @return
     */
    public Order getOrder(String OrderID) {
        Order ac = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from Order where OrderID=?");
            pst.setString(1, OrderID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                ac = new Order(rs.getString("OrderID"), rs.getString("Username"), rs.getString("DeliveryAddress"), rs.getInt("TotalBill"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ac;
    }
     public int addOrder(Order or) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into [Order] values(?,?,?,?)");
            pst.setString(1, or.OrderID);
            pst.setString(2, or.Username);
            pst.setString(3, or.DeliveryAddress);
            pst.setInt(4, or.TotalBill);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
     public int deleteOrder(String OrderID) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("delete from [Order] where OrderID=?");
            pst.setString(1, OrderID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
     public boolean checkOrder(String input) {
        ResultSet rs = null;
        boolean check = false;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select OrderID from [Order]");
            while (rs.next()) {
                if (input.equals(rs.getString("OrderID"))) {
                    check = true;
                    break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;

    }
}
