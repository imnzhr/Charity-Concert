/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author azimd
 */
public class DBconnection {
    //Create a connection to the Charity DB
    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:derby://localhost:1527/CharityConcert";
        String username = "app";
        String password = "app";
        
        try{           
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/CharityConcert;create=true;user=app;password=app";
            
            Class.forName(driver);
            
            con = DriverManager.getConnection(connectionString);
            System.out.println("Printing connection object "+con);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }  
}