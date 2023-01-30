 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Product;
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
public class ProductDAO {

    private Connection conn = null;

    public ProductDAO() {
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
            rs = st.executeQuery("Select * from Product");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
        /**
     * Lay thong tin cua mot khach hang dua vao makh
     *
     * @param ProductID
     * @return mot doi tuong chua thong tin cua khach hang can tim
     */
    public Product getProduct(String ProductID) {
        Product st = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from Product where ProductID=?");
            pst.setString(1, ProductID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                st = new Product(rs.getString("ProductID"), rs.getString("ProductName"), rs.getString("Description"), rs.getInt("Price"), rs.getString("LinkPicture"), rs.getString("TypeProduct"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return st;
    }
    /**
     *
     * @param pd
     * @return
     */
    public int addProduct(Product pd) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Product values(?,?,?,?,?,?)");
            pst.setString(1, pd.ProductID);
            pst.setString(2, pd.ProductName);
            pst.setString(3, pd.Description);
            pst.setInt(4, pd.Price);
            pst.setString(5, pd.LinkPicture);
            pst.setString(6, pd.TypeProduct);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    /**
     *
     * @param pd
     * @return
     */
    public int updateProduct(Product pd) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("update Product set ProductName=?, Description=?, Price=?, LinkPicture=?, TypeProduct=? where ProductID=?");
            pst.setString(1, pd.ProductName);
            pst.setString(2, pd.Description);
            pst.setInt(3, pd.Price);
            pst.setString(4, pd.LinkPicture);
            pst.setString(5, pd.TypeProduct);
            pst.setString(6, pd.ProductID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int deleteProduct(String ProductID) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("delete from Product where ProductID=?");
            pst.setString(1, ProductID);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public boolean checkProductId(String input) {
        ResultSet rs = null;
        boolean check = false;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select ProductID from Product");
            while (rs.next()) {
                if (input.equals(rs.getString("ProductID"))) {
                    check = true;
                    break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;

    }



}
