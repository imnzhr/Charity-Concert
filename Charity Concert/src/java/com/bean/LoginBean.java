package com.bean;

//A class named DonorBean
public class LoginBean implements java.io.Serializable{
    String username;
    String password;

    //Normal constructor 
    public LoginBean(String username, String password) {
        this.username = username;
        this.password = password;
    }

    //Default constructor
    public LoginBean() {
       username = "";
       password = "";
    }

    //Getter(accessor) method 
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    //Setter(mutator) method
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
