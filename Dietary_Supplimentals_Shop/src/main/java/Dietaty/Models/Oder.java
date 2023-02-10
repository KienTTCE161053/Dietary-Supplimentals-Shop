/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dietaty.Models;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Oder {
    private String OrderID;
    private String Username;
    private String OderStatusID;
    private String DeliveryAddress;
    private Date OderTime ;
    private int totalBill ;

    public Oder(String OrderID, String Username, String OderStatusID, String DeliveryAddress, Date OderTime, int totalBill) {
        this.OrderID = OrderID;
        this.Username = Username;
        this.OderStatusID = OderStatusID;
        this.DeliveryAddress = DeliveryAddress;
        this.OderTime = OderTime;
        this.totalBill = totalBill;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getOderStatusID() {
        return OderStatusID;
    }

    public void setOderStatusID(String OderStatusID) {
        this.OderStatusID = OderStatusID;
    }

    public String getDeliveryAddress() {
        return DeliveryAddress;
    }

    public void setDeliveryAddress(String DeliveryAddress) {
        this.DeliveryAddress = DeliveryAddress;
    }

    public Date getOderTime() {
        return OderTime;
    }

    public void setOderTime(Date OderTime) {
        this.OderTime = OderTime;
    }

    public int getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(int totalBill) {
        this.totalBill = totalBill;
    }
    
    
}
