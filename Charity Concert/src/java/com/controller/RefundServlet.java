package com.controller;

import com.bean.BookingBean;
import com.dao.BookingDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RefundServlet extends HttpServlet {

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
            out.println("<title>Servlet RefundServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RefundServlet at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("FLAG INTO SERVLET");
        
        //Get all field parameters
        int bookId = Integer.parseInt(request.getParameter("booking_Id"));
        String code = request.getParameter("code");
        String validateRefund = "FAIL"; 
        
        //Declaration of BookingDao
        BookingDao bookDao= new BookingDao();
        
        //Declaration of bookList
        ArrayList<BookingBean> bookList=new ArrayList<BookingBean>();
        
        bookList=bookDao.selectBooking();

        //Search for booking ID
        for(int i=0;i<bookList.size();i++){
            BookingBean temp=(BookingBean) bookList.get(i);
            
            //If found, make a refund
            if((temp.getBookingID()==bookId)&&(temp.getCode().equals(code))){
                validateRefund = bookDao.insertRefund(temp);
                bookDao.deleteRefundBook(bookId);
                break;
            } 
        }
 
        //Redirect to page
        if(validateRefund.equals("SUCCESS")) 
         {
             System.out.println("FLAG SUCCESS TO REFUND");
             request.setAttribute("succMessage", validateRefund); 
             request.getRequestDispatcher("/refund.jsp").forward(request, response);
         }
         else
         {
             System.out.println("FLAG FAIL TO REFUND");
             request.setAttribute("errMessage", validateRefund); 
             request.getRequestDispatcher("/refund.jsp").forward(request, response);
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
