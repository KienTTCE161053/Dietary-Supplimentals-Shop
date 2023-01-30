/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author QuangQui
 */
public class Product {
    public String ProductID;
    public String ProductName;
    public String Description;
    public int Price;
    public String LinkPicture;
    public String TypeProduct;

    public Product() {
    }

    public Product(String ProductID, String ProductName, String Description, int Price, String LinkPicture, String TypeProduct) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Description = Description;
        this.Price = Price;
        this.LinkPicture = LinkPicture;
        this.TypeProduct = TypeProduct;
    }
    
}
