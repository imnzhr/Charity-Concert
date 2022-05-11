package com.bean;

//A class named ContactBean
public class ContactBean implements java.io.Serializable {
    private int contactId;
    private String contactName;
    private String contactEmail;
    private String contactSubject;
    private String contactMessage;

    //Normal constructor
    public ContactBean(String contactName, String contactEmail, String contactSubject, String contactMessage,int id) {
        this.contactName = contactName;
        this.contactEmail = contactEmail;
        this.contactSubject = contactSubject;
        this.contactMessage = contactMessage;
        this.contactId=id;
    }
    
    //Default constructor
    public ContactBean() {
        
    }

    //Getter(accessor) method 
    public int getContactId() {
        return contactId;
    }

    public String getContactName() {
        return contactName;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public String getContactSubject() {
        return contactSubject;
    }

    public String getContactMessage() {
        return contactMessage;
    }

    //Setter(mutator) method
    public void setContactId(int contactId) {
        this.contactId = contactId;
    }
    
    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public void setContactSubject(String contactSubject) {
        this.contactSubject = contactSubject;
    }

    public void setContactMessage(String contactMessage) {
        this.contactMessage = contactMessage;
    }
}
