/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author QuangQui
 */
public class OrderElement {
     public String OrderID;
    public String ProductID;
    public String Quatity;
    public String TotalPrice;

    public OrderElement() {
    }

    public OrderElement(String OrderID, String ProductID, String Quatity, String TotalPrice) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Quatity = Quatity;
        this.TotalPrice = TotalPrice;
    }
    
}
