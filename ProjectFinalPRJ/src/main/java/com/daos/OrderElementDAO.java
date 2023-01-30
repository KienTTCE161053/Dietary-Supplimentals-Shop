/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Order;
import com.models.OrderElement;
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
public class OrderElementDAO {
     private Connection conn = null;

    public OrderElementDAO() {
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
            rs = st.executeQuery("Select * from OrderElement");
        } catch (SQLException ex) {
            Logger.getLogger(OrderElementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    /**
     *
     * @param oe
     * @return
     */
    public int addOrderElement(OrderElement oe) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into OrderElement values(?,?,?,?)");
            pst.setString(1, oe.OrderID);
            pst.setString(2, oe.ProductID);
            pst.setInt(3, Integer.valueOf(oe.Quatity));
            pst.setInt(4, Integer.valueOf(oe.TotalPrice));
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderElementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
     /**
     *
     *
     * @param OrderID
     * @return
     */
    public ResultSet getOrder(String OrderID) {
        ResultSet ac = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from OrderElement where OrderID=?");
            pst.setString(1, OrderID);
            ac = pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderElementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ac;
    }
    
     public int deleteOrder(String OrderID) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("delete from OrderElement where OrderID=?");
            pst.setString(1, OrderID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderElementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
