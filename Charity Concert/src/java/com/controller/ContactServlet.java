package com.controller;

import com.bean.ContactBean;
import com.dao.ContactDao;
import com.dao.dataDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {

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
            out.println("<title>Servlet ContactServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactServlet at " + request.getContextPath() + "</h1>");
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
 
        //Get all field parameters
        System.out.println("FLAG INTO SERVLET");
        String contactName = request.getParameter("fullName");
        String contactEmail = request.getParameter("email");
        String contactSubject = request.getParameter("subject");
        String contactMessage = request.getParameter("message");
 
        dataDB table=new dataDB();
 
        //ContactBean declration
        ContactBean contactBean = new ContactBean(); 
 
        //Set ContactBean data
        contactBean.setContactId(table.nextID("CONTACT", "CONTACT_ID"));
        contactBean.setContactName(contactName); 
        contactBean.setContactEmail(contactEmail); 
        contactBean.setContactSubject(contactSubject); 
        contactBean.setContactMessage(contactMessage); 
 
        //ContactDao declaration
        ContactDao contactDao = new ContactDao(); 
 
        //Insert Contact data into database
        String userValidate = contactDao.insertMessageToDB(contactBean);

        //Redirect to page
        if(userValidate.equals("SUCCESS")) 
         {
             System.out.println("FLAG SUCCESS");
             request.setAttribute("succMessage", userValidate);
             request.getRequestDispatcher("/contactUs.jsp").forward(request, response);
         }
         else
         {
             System.out.println("FLAG FAIL");
             request.getRequestDispatcher("/contactUs.jsp").forward(request, response);
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
