/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CE160195 TRAN QUANG QUI
 */
public class DBConnection {
    private static Connection conn = null;
    public static Connection getConnection(){
        if(conn == null) {
            try {
//              Class.forName("com.mysql.jdbc.Driver");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://DESKTOP-TEIM7A0\\SQLEXPRESS:1433;databaseName=ProjectFinalPRJ;user=sa;password=admin;encrypt=true;trustServerCertificate=true;";
                conn = DriverManager.getConnection(url);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        return conn;
    }
    
    public static void closeConnection(){
        try {
            if(!conn.isClosed())
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
