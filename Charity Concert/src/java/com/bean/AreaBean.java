package com.bean;

//A class named AreaBean
public class AreaBean implements java.io.Serializable{
    //Instance variables or attributes
    private int areaID;
    private String areaName;
    private int areaCapacity;
    private String areaStatus;
    private double areaPrice;

    //Normal constructor
    public AreaBean(int areaID, String areaName, int areaCapacity, String areaStatus, double areaPrice) {
        this.areaID = areaID;
        this.areaName = areaName;
        this.areaCapacity = areaCapacity;
        this.areaStatus = areaStatus;
        this.areaPrice = areaPrice;
    }
    
    //Default constructor
    public AreaBean() {
 
    }

    //Getter(accessor) method
    public int getAreaID() {
        return areaID;
    }

    public String getAreaName() {
        return areaName;
    }

    public int getAreaCapacity() {
        return areaCapacity;
    }

    public String getAreaStatus() {
        return areaStatus;
    }

    public double getAreaPrice() {
        return areaPrice;
    }

    //Setter(mutator) method
    public void setAreaID(int areaID) {
        this.areaID = areaID;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public void setAreaCapacity(int areaCapacity) {
        this.areaCapacity = areaCapacity;
    }

    public void setAreaStatus(String areaStatus) {
        this.areaStatus = areaStatus;
    }

    public void setAreaPrice(double areaPrice) {
        this.areaPrice = areaPrice;
    }
}
