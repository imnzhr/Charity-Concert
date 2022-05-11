/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.util.DBconnection;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author apitz
 */
public class dataDB {
    
    //Get maximum id from any table
    public int getMaxID(String tableName,String id){
        
        int size=0;
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            con = DBconnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("Select MAX("+id+") as count from "+tableName);
            resultSet.next();
            size=resultSet.getInt("count");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return size;
    }
    
    //Return next Id from any table
    public int nextID(String tableName,String id){
    
        return (getMaxID(tableName,id)+1);
    }
    
    //Return next BookId from Booking Table
    public int nextBookID(){
        
        int bookId=0;
        int refundId=0;
        
        String tableName="BOOKING";
        String id="BOOKING_ID";
        
        bookId=getMaxID(tableName,id);
        
        tableName="REFUND";
        id="BOOKING_ID";
        
        refundId=getMaxID(tableName,id);
        
        if(refundId>bookId)
            bookId=refundId+1;
        else
            bookId+=1;
        
        return bookId;
    }
    
    //Generate code for each ticket
    private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";

    private static final String DATA_FOR_RANDOM_STRING = CHAR_LOWER + CHAR_UPPER + NUMBER;
    
    private static SecureRandom random = new SecureRandom();
    //Return generated code for each ticket
    public String generateRandomString(int length) {
        if (length < 1) throw new IllegalArgumentException();

        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {

            // 0-62 (exclusive), random returns 0-61
            int rndCharAt = random.nextInt(DATA_FOR_RANDOM_STRING.length());
            char rndChar = DATA_FOR_RANDOM_STRING.charAt(rndCharAt);

            // debug
            System.out.format("%d\t:\t%c%n", rndCharAt, rndChar);

            sb.append(rndChar);

        }

        return sb.toString();

    }
}
