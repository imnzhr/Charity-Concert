package com.controller;

import com.bean.AreaBean;
import com.bean.BookingBean;
import com.bean.DonorBean;
import com.dao.AreaDao;
import com.dao.dataDB;
import com.bean.MerchandiseBean;
import com.dao.BookingDao;
import com.dao.DonorDao;
import com.dao.MerchandiseDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        //Get all fields parameter
        System.out.println("FLAG INTO SERVLET");
        String fullName = request.getParameter("fullName");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phoneNum = request.getParameter("pNumber");
        String email = request.getParameter("email");
        
        int yellowTicket = Integer.parseInt(request.getParameter("yellowTicket"));
        int orangeTicket = Integer.parseInt(request.getParameter("orangeTicket"));
        int greenTicket = Integer.parseInt(request.getParameter("greenTicket"));
        int blueTicket = Integer.parseInt(request.getParameter("blueTicket"));

        String merch = request.getParameter("merchandise");
        System.out.println("Merch = "+merch);
        
        String extra = request.getParameter("extdonation");
        
        double addValue = Double.parseDouble(extra);
        
        //Declaration of bean
        BookingBean bookingBean = new BookingBean(); 
        DonorBean donorBean = new DonorBean();
        MerchandiseBean merchBean = new MerchandiseBean();
        
        dataDB table= new dataDB();
        //Set DonorBean data
        donorBean.setDonorID(table.nextID("DONOR","DONOR_ID"));
        donorBean.setDonorName(fullName);
        donorBean.setDonorGender(gender);
        donorBean.setDonorAge(Integer.parseInt(age));
        donorBean.setDonorEmail(email);
        donorBean.setDonorPhone(phoneNum);
        DonorDao donorDao=new DonorDao();
        donorDao.insertDonor(donorBean);

        donorBean.toString();
        
        //AreaDao declaration
        AreaDao areaDao=new AreaDao();
        
        //AreaBean declaration
        AreaBean areaBeanY= new AreaBean();
        AreaBean areaBeanO= new AreaBean();
        AreaBean areaBeanG= new AreaBean();
        AreaBean areaBeanB= new AreaBean();
        
        //Set value to each Area bean
        areaBeanY.setAreaID(1);
        areaBeanY.setAreaCapacity(yellowTicket);
        areaBeanO.setAreaID(2);
        areaBeanO.setAreaCapacity(orangeTicket);
        areaBeanG.setAreaID(3);
        areaBeanG.setAreaCapacity(greenTicket);
        areaBeanB.setAreaID(4);
        areaBeanB.setAreaCapacity(blueTicket);
        
        //Update area data
        try {
            areaDao.updateAreaToDB(areaBeanY);
            areaDao.updateAreaToDB(areaBeanO);
            areaDao.updateAreaToDB(areaBeanG);
            areaDao.updateAreaToDB(areaBeanB);
            
        } catch (SQLException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
 
        bookingBean.setBookingID(table.nextID("BOOKING","BOOKING_ID"));
        bookingBean.setDonorID(donorBean.getDonorID());
       
        //MerchandiseDao declaration
        MerchandiseDao merchDao = new MerchandiseDao();
        
        //Update Merchandise data
        if(merch.equals("ComboA")){
            bookingBean.setMerchandiseID(1);
            merchDao.updateMerchStock(1);
        }
        else if(merch.equals("ComboB")){
            bookingBean.setMerchandiseID(2);
            merchDao.updateMerchStock(2);
        }
        else if(merch.equals("ComboC")){
            bookingBean.setMerchandiseID(3);
            merchDao.updateMerchStock(3);
        }
        else if(merch.equals("ComboN")){
            bookingBean.setMerchandiseID(0);
        }
        
        //Update Merchandise status
        ArrayList<MerchandiseBean> merchList = new ArrayList<MerchandiseBean>();
        merchList=merchDao.selectMerchandise();
        
        for(int i=0;i<merchList.size();i++){
            MerchandiseBean tempMerch = (MerchandiseBean) merchList.get(i);
            System.out.println("HAHAHA :"+tempMerch.toString());
            if(tempMerch.getMerchandiseStock()==0)
                merchDao.updateMerchStatus(tempMerch.getMerchandiseID());
        }
               
        //AreaList declaration
        ArrayList<AreaBean> areaList= (ArrayList<AreaBean>) areaDao.getAreaFromDB();
        
        //Final price calculation
        double finalPrice=0.0;    
        AreaBean temp= new AreaBean();
        temp= areaList.get(0);
        finalPrice+=yellowTicket*temp.getAreaPrice();
        System.out.println("FinalPrice = "+finalPrice);
        temp= areaList.get(1);
        finalPrice+=orangeTicket*temp.getAreaPrice();
        System.out.println("FinalPrice = "+finalPrice);
        temp= areaList.get(2);
        finalPrice+=greenTicket*temp.getAreaPrice();
        System.out.println("FinalPrice = "+finalPrice);
        temp= areaList.get(3);
        finalPrice+=blueTicket*temp.getAreaPrice();

        System.out.println("FinalPrice = "+finalPrice);
        
        //Set all BookingBean data    
        bookingBean.setBookingDate(java.time.LocalDate.now().toString());
        bookingBean.setFinalPrice(finalPrice);
        bookingBean.setAddValue(addValue);
        bookingBean.setTotalPrice(bookingBean.getFinalPrice()+bookingBean.getAddValue());
        
        dataDB data=new dataDB();
        bookingBean.setCode(data.generateRandomString(10));
        
        //Inset booking into database
        BookingDao bookDao=new BookingDao();
        String insertBooking = bookDao.insertBooking(bookingBean);

        //Insert table BookingArea into database
        if(yellowTicket!=0)
        bookDao.insertBookingArea(bookingBean.getBookingID(),1,yellowTicket);
        if(orangeTicket!=0)
        bookDao.insertBookingArea(bookingBean.getBookingID(),2,orangeTicket);
        if(greenTicket!=0)
        bookDao.insertBookingArea(bookingBean.getBookingID(),3,greenTicket);
        if(blueTicket!=0)
        bookDao.insertBookingArea(bookingBean.getBookingID(),4,blueTicket);
        
        //Redirect the page
        if(insertBooking.equals("SUCCESS")) 
         {
             System.out.println("FLAG SUCCESS INSERT BOOKING");  
             request.setAttribute("booking",bookingBean);
             request.setAttribute("donor",donorBean);
             request.setAttribute("ticketY",yellowTicket);
             request.setAttribute("ticketO",orangeTicket);
             request.setAttribute("ticketG",greenTicket);
             request.setAttribute("ticketB",blueTicket);      
             request.setAttribute("succMessage", insertBooking);
             request.getRequestDispatcher("/receiptOrder.jsp").forward(request, response);
         }
         else
         {
             System.out.println("FLAG FAIL TO INSERT BOOKING");    
             request.setAttribute("errMessage", insertBooking);
             request.getRequestDispatcher("/bookingOrder.jsp").forward(request, response);
         }
        
    }
        

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
