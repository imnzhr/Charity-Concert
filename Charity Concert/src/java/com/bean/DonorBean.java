package com.bean;

//A class named DonorBean
public class DonorBean implements java.io.Serializable{
    private int donorID;
    private String donorName;
    private String donorGender;
    private int donorAge;
    private String donorEmail;
    private String donorPhone;

    //Normal constructor 
    public DonorBean(int donorID, String donorName, String donorGender, int donorAge, String donorEmail, String donorPhone) {
        this.donorID = donorID;
        this.donorName = donorName;
        this.donorGender = donorGender;
        this.donorAge = donorAge;
        this.donorEmail = donorEmail;
        this.donorPhone = donorPhone;
    }

    //Default constructor
    public DonorBean(){
    
    }
    
    //Getter(accessor) method & //Setter(mutator) method
    public int getDonorID() {
        return donorID;
    }

    public String getDonorName() {
        return donorName;
    }

    public String getDonorGender() {
        return donorGender;
    }

    public int getDonorAge() {
        return donorAge;
    }

    public String getDonorEmail() {
        return donorEmail;
    }

    public String getDonorPhone() {
        return donorPhone;
    }

    //Setter(mutator) method
    public void setDonorID(int donorID) {
        this.donorID = donorID;
    }

    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public void setDonorGender(String donorGender) {
        this.donorGender = donorGender;
    }

    public void setDonorAge(int donorAge) {
        this.donorAge = donorAge;
    }

    public void setDonorEmail(String donorEmail) {
        this.donorEmail = donorEmail;
    }

    public void setDonorPhone(String donorPhone) {
        this.donorPhone = donorPhone;
    } 
}
