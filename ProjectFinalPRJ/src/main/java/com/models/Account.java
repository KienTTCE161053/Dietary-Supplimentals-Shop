/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author QuangQui
 */
public class Account {


    public String Username;

    public String Password;
    public String FullName;
    public int PhoneNumber;
    public String Gender;
   public String Address;
    public String TypeAccount;

  
    public Account() {
    }

    /**
     *
     * @param Username
     * @param Password
     * @param FullName
     * @param PhoneNumber
     * @param Gender
     * @param Address
     * @param TypeAccount
     */
    public Account(String Username, String Password, String FullName, int PhoneNumber, String Gender, String Address, String TypeAccount) {
        this.Username = Username;
        this.Password = Password;
        this.FullName = FullName;
        this.PhoneNumber = PhoneNumber;
        this.Gender = Gender;
        this.Address = Address;
        this.TypeAccount = TypeAccount;
    }
    
}
