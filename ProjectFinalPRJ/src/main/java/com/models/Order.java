/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author QuangQui
 */
public class Order {
    public String OrderID;
    public String Username;
    public String DeliveryAddress;
    public int TotalBill;

    public Order() {
    }

    public Order(String OrderID, String Username, String DeliveryAddress, int TotalBill) {
        this.OrderID = OrderID;
        this.Username = Username;
        this.DeliveryAddress = DeliveryAddress;
        this.TotalBill = TotalBill;
    }

 
    
}
