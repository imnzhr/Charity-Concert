/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.LoginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.util.DBconnection;

/**
 *
 * @author azimd
 */
public class LoginDao {
    
    //Authenticate admin account from database
    public String authenticateUser(LoginBean loginBean) {
        
        String username = loginBean.getUsername();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        
        try {
            con = DBconnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("Select username, password from account");
            while (resultSet.next())
            {
                userNameDB = resultSet.getString("username");
                passwordDB = resultSet.getString("password");
                if (username.equals(userNameDB) && password.equals(passwordDB)) {
                    return "SUCCESS";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid Username or Password";
    }
}
