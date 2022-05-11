/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.MerchandiseBean;
import com.util.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author azimd
 */
public class MerchandiseDao {
    
    PreparedStatement prepstatement =null;
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement pstmt=null;
    
    //Select list of Merchandise from database
    public ArrayList<MerchandiseBean> selectMerchandise() {
        
        ArrayList<MerchandiseBean> merchList = new ArrayList<MerchandiseBean>();
        
        
        int merchandiseIDDB = 0;
        int merchandiseStockDB = 0;
        String merchandiseTypeDB = "";
        String merchandiseStatusDB = "";
        double merchandisePriceDB = 0.0;
        
        try {
            con = DBconnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("SELECT MERCHANDISE_ID, MERCHANDISE_TYPE, MERCHANDISE_PRICE, MERCHANDISE_STOCK, MERCHANDISE_STATUS FROM MERCHANDISE");
            while (resultSet.next())
            {
                MerchandiseBean merchandiseBean = new MerchandiseBean();
                
                merchandiseIDDB = resultSet.getInt("MERCHANDISE_ID");
                merchandiseTypeDB = resultSet.getString("MERCHANDISE_TYPE");
                merchandisePriceDB = resultSet.getDouble("MERCHANDISE_PRICE");
                merchandiseStockDB = resultSet.getInt("MERCHANDISE_STOCK");
                merchandiseStatusDB = resultSet.getString("MERCHANDISE_STATUS");
                
                merchandiseBean.setMerchandiseID(merchandiseIDDB);
                merchandiseBean.setMerchandiseType(merchandiseTypeDB);
                merchandiseBean.setMerchandisePrice(merchandisePriceDB);
                merchandiseBean.setMerchandiseStock(merchandiseStockDB);
                merchandiseBean.setMerchandiseStatus(merchandiseStatusDB);
                
                merchList.add(merchandiseBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return merchList;
    }
    
    //Get total Merchandise booked
     public double getTotalMerch() {
        
        double totalMerchDB=0.0;

        try {
            con = DBconnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("SELECT SUM(MERCHANDISE.MERCHANDISE_PRICE)AS TOTAL\n" +
                                                "FROM BOOKING\n" +
                                                "INNER JOIN MERCHANDISE\n" +
                                                "ON BOOKING.MERCHANDISE_ID = MERCHANDISE.MERCHANDISE_ID");
            while (resultSet.next())
            {
                totalMerchDB = resultSet.getDouble("TOTAL");
                return totalMerchDB;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalMerchDB;
    }
     
     //UPdate Merchandise data into database
     public String updateMerch(MerchandiseBean merchBean){
        
        int id = merchBean.getMerchandiseID();
        String status = merchBean.getMerchandiseStatus();
        int stock = merchBean.getMerchandiseStock();
        try{
            con = DBconnection.createConnection();
            prepstatement = con
                        .prepareStatement("update MERCHANDISE set MERCHANDISE_STOCK=?, MERCHANDISE_STATUS=? where MERCHANDISE_ID=?");

            prepstatement.setInt(1, stock);
            prepstatement.setString(2, status);
            prepstatement.setInt(3, id);
            int R = prepstatement.executeUpdate();
        
            if(R!=0) {
                return "SUCCESS";
            }
            return "Invalid user credentials"; // Return appropriate message in case of failure
        } catch (SQLException ex) {
            System.out.println("Error Message : " + ex.toString());
        }
        return "oops";
    }
     
     //Update merchandise stock into database
     public void updateMerchStock(int id){
        
        try{
            con = DBconnection.createConnection();
            prepstatement = con
                        .prepareStatement("update MERCHANDISE set MERCHANDISE_STOCK=MERCHANDISE_STOCK-1 where MERCHANDISE_ID=?");

            prepstatement.setInt(1, id);
            prepstatement.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error Message : " + ex.toString());
        }
        
    }
     
     //UPdate merchandise status into database
    public void updateMerchStatus(int id){
        
        try{
            con = DBconnection.createConnection();
            prepstatement = con
                        .prepareStatement("update MERCHANDISE set MERCHANDISE_STATUS='Not Available' where MERCHANDISE_ID=?");

            prepstatement.setInt(1, id);
            prepstatement.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error Message : " + ex.toString());
        }
        
    }
}
