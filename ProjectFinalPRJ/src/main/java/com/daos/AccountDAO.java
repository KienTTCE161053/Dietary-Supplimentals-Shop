/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.daos.ProductDAO;
import com.daos.ProductDAO;
import com.db.DBConnection;
import com.models.Account;
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
public class AccountDAO {

    private Connection conn = null;

    public AccountDAO() {
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
            rs = st.executeQuery("Select * from Account");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    /**
     * Lay thong tin cua mot khach hang dua vao makh
     *
     * @param username
     * @return mot doi tuong chua thong tin cua khach hang can tim
     */
    public Account getAccount(String username) {
        Account ac = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from Account where Username=?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                ac = new Account(rs.getString("Username"), rs.getString("Password"), rs.getString("FullName"), rs.getInt("PhoneNumber"), rs.getString("Gender"), rs.getString("Address"), rs.getString("TypeAccount"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ac;
    }

    public int deleteAccount(String username) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("delete from Account where Username=?");
            pst.setString(1, username);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    /**
     * Lay thong tin cua mot khach hang dua vao makh
     *
     * @param ac
     * @return mot doi tuong chua thong tin cua khach hang can tim
     */
    public int SetTypeAdminAccount(Account ac) {
        int count = 0;
        String Type = "admin";
        try {
            PreparedStatement pst = conn.prepareStatement("update Account set Password=?, FullName=?, PhoneNumber=?, Gender=?, Address=?, TypeAccount=? where Username=?");
            pst.setString(1, ac.Password);
            pst.setString(2, ac.FullName);
            pst.setInt(3, ac.PhoneNumber);
            pst.setString(4, ac.Gender);
            pst.setString(5, ac.Address);
            pst.setString(6, Type);
            pst.setString(7, ac.Username);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    /**
     * Lay thong tin cua mot khach hang dua vao makh
     *
     * @param ac
     * @return mot doi tuong chua thong tin cua khach hang can tim
     */
    public int SetTypeCustomerAccount(Account ac) {
        int count = 0;
        String Type = "customer";
        try {
            PreparedStatement pst = conn.prepareStatement("update Account set Password=?, FullName=?, PhoneNumber=?, Gender=?, Address=?, TypeAccount=? where Username=?");
            pst.setString(1, ac.Password);
            pst.setString(2, ac.FullName);
            pst.setInt(3, ac.PhoneNumber);
            pst.setString(4, ac.Gender);
            pst.setString(5, ac.Address);
            pst.setString(6, Type);
            pst.setString(7, ac.Username);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    /**
     *
     * @param ac
     * @return
     */
    public int addNew(Account ac) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Account values(?,?,?,?,?,?,?)");
            pst.setString(1, ac.Username);
            pst.setString(2, ac.Password);
            pst.setString(3, ac.FullName);
            pst.setInt(4, ac.PhoneNumber);
            pst.setString(5, ac.Gender);
            pst.setString(6, ac.Address);
            pst.setString(7, ac.TypeAccount);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    /**
     *
     * @param ac
     * @return
     */
    public int updateAccount(Account ac) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("update Account set Password=?, FullName=?, PhoneNumber=?, Gender=?, Address=?, TypeAccount=? where Username=?");
            pst.setString(1, ac.Password);
            pst.setString(2, ac.FullName);
            pst.setInt(3, ac.PhoneNumber);
            pst.setString(4, ac.Gender);
            pst.setString(5, ac.Address);
            pst.setString(6, ac.TypeAccount);
            pst.setString(7, ac.Username);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public boolean checkUsername(String input) {
        ResultSet rs = null;
        boolean check = false;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select Username from Account");
            while (rs.next()) {
                if (input.equals(rs.getString("Username"))) {
                    check = true;
                    break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;

    }

    public String getAccountPassword(String username) {
        String password = "";
        try {
            PreparedStatement pst = conn.prepareStatement("select Password from Account where Username=?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                password = rs.getString("Password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return password;
    }

    /**
     * Lay thong tin cua mot khach hang dua vao makh
     *
     * @param username
     * @return mot doi tuong chua thong tin cua khach hang can tim
     */
    public String getFullNameAccount(String username) {
        String nameOfUser = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from Account where Username=?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                nameOfUser = rs.getString("FullName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return nameOfUser;
    }

    /**
     * Lay thong tin cua mot khach hang dua vao makh
     *
     * @param username
     * @return mot doi tuong chua thong tin cua khach hang can tim
     */
    public String getTypeAccount(String username) {
        String typeAcc = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from Account where Username=?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                typeAcc = rs.getString("TypeAccount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return typeAcc;
    }
}
