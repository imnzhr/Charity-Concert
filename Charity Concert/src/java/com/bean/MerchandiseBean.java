package com.bean;

//A class named DonorBean
public class MerchandiseBean implements java.io.Serializable{
    private int merchandiseID;
    private int merchandiseStock;
    private String merchandiseType;
    private String merchandiseStatus;
    private double merchandisePrice;

    //Normal constructor 
    public MerchandiseBean(int merchandiseID, int merchandiseStock, String merchandiseType, String merchandiseStatus, double merchandisePrice) {
        this.merchandiseID = merchandiseID;
        this.merchandiseStock = merchandiseStock;
        this.merchandiseType = merchandiseType;
        this.merchandiseStatus = merchandiseStatus;
        this.merchandisePrice = merchandisePrice;
    }
   
    //Default constructor
    public MerchandiseBean() {

    }

    //Getter(accessor) method 
    public int getMerchandiseID() {
        return merchandiseID;
    }

    public int getMerchandiseStock() {
        return merchandiseStock;
    }
    
    public String getMerchandiseType() {
        return merchandiseType;
    }

    public String getMerchandiseStatus() {
        return merchandiseStatus;
    }

    public double getMerchandisePrice() {
        return merchandisePrice;
    }

    //Setter(mutator) method
    public void setMerchandiseID(int merchandiseID) {
        this.merchandiseID = merchandiseID;
    }

    public void setMerchandiseStock(int merchandiseStock) {
        this.merchandiseStock = merchandiseStock;
    }

    public void setMerchandiseType(String merchandiseType) {
        this.merchandiseType = merchandiseType;
    }

    public void setMerchandiseStatus(String merchandiseStatus) {
        this.merchandiseStatus = merchandiseStatus;
    }
    
    public void setMerchandisePrice(double merchandisePrice) {
        this.merchandisePrice = merchandisePrice;
    } 

    //toString() method
    @Override
    public String toString() {
        return "MerchandiseBean{" + "merchandiseID=" + merchandiseID + ", merchandiseStock=" + merchandiseStock + ", merchandiseType=" + merchandiseType + ", merchandiseStatus=" + merchandiseStatus + ", merchandisePrice=" + merchandisePrice + '}';
    }
    
}
