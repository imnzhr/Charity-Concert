/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.AreaBean;
import com.util.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;


/**
 *
 * @author apitz
 */
public class AreaDao {
    
    PreparedStatement prepstatement =null;
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    //Get list of Area from Database
    public ArrayList<AreaBean> getAreaFromDB(){
    
       
        ArrayList<AreaBean> areaList=new ArrayList<AreaBean>();

        try {
            con = DBconnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("Select * from AREA");
            while (resultSet.next())
            {
                 AreaBean areaBean=new AreaBean();
                String areaID = resultSet.getString("AREA_ID");
                String areaName = resultSet.getString("AREA_NAME");
                String areaCapacity = resultSet.getString("AREA_CAPACITY");
                String areaStatus = resultSet.getString("AREA_STATUS");
                String areaPrice = resultSet.getString("AREA_PRICE");
                
                areaBean.setAreaID(Integer.parseInt(areaID));
                areaBean.setAreaName(areaName);
                areaBean.setAreaCapacity(Integer.parseInt(areaCapacity));
                areaBean.setAreaStatus(areaStatus);
                areaBean.setAreaPrice(Double.parseDouble(areaPrice));
                
                areaList.add(areaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //return List of Area
        return areaList;
    }
    
    //Search for area data and update area
    public void updateAreaToDB(AreaBean areaBean) throws SQLException{
        
         ArrayList<AreaBean> areaList=new ArrayList<AreaBean>();
         areaList= getAreaFromDB();
         
         int cap=areaBean.getAreaCapacity();
         
         for(int i=0;i<areaList.size();i++){
             AreaBean temp = (AreaBean) areaList.get(i);
             
             if(temp.getAreaID()==areaBean.getAreaID())
                 areaBean.setAreaCapacity(cap+temp.getAreaCapacity());
   
         }
            
            if(areaBean.getAreaCapacity() == 150)
                areaBean.setAreaStatus("Not Available");
            else
                areaBean.setAreaStatus("Available");
            
            updateDB(areaBean);
    }
    
    //Update area capacity and status into database
    private void updateDB(AreaBean areaBean) throws SQLException {
        
        int id= areaBean.getAreaID();
        String status = areaBean.getAreaStatus();
        int capacity = areaBean.getAreaCapacity();
        
        con = DBconnection.createConnection();
        prepstatement = con
                    .prepareStatement("update AREA set AREA_CAPACITY=?, AREA_STATUS=? where AREA_ID=?");

        prepstatement.setInt(1, capacity);
        prepstatement.setString(2, status);
        prepstatement.setInt(3, id);
        prepstatement.executeUpdate();
        
    }
    
    //Get total seat booked in database
    public int getTotalSeat() {
        
        int numSeat=0;

        try {
            con = DBconnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("SELECT SUM(AREA_CAPACITY)AS TOTAL FROM AREA");
            while (resultSet.next())
            {

                numSeat = resultSet.getInt("TOTAL");
                return numSeat;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //return total
        return numSeat;
    }
}
