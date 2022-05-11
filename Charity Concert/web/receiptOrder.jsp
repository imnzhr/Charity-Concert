<%@page import="com.bean.DonorBean"%>
<%@page import="com.bean.BookingBean"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <style>
            ul{
                list-style-type: none;  
                margin-right: 40px;
            }         
            li{
                display: inline;
            }            
            hr{
                width: 100%;           
            }
            .divPadding{
                padding: 50px;
            }
            .divBackgroundGrey{
                background-color: #0a0a0a  ;
                width: 40%;
                margin-left: 40px;
                border-radius: 20px;
                padding: 20px;
            }
            h3{
                margin-top: 0px;
                
            }
            td{
                background-color:  #000000 ;
                padding:10px;
                border-radius: 25px;
                padding-left: 20px;
            }
            
            .background8{
                height: 970px;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                position: absolute;
                opacity: 0.5;
            }
        </style>
        <title>Receipt Order Generated</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="style.css">
        
        <!--Error PopUp-->
        <script type="text/javascript"> 
            
        var succMessage= '<%=request.getAttribute("succMessage")%>';  
        var errMessage= '<%=request.getAttribute("errMessage")%>';  
        
        if (succMessage != "null") {   
            function alertName(){
                alert("Congratulation, Your ticket had been booked!");
            } 
        }
        window.onload = alertName;  
        </script>
        
    </head>
    
    <%
       BookingBean bookingBean = (BookingBean) request.getAttribute("booking");
       DonorBean donorBean = (DonorBean) request.getAttribute("donor");
       int y = (Integer) request.getAttribute("ticketY");
       int o = (Integer) request.getAttribute("ticketO");
       int g = (Integer) request.getAttribute("ticketG");
       int b = (Integer) request.getAttribute("ticketB");
       
    %>
    <body>
        <!--Navigation bar-->
            <img class="background8" src="Image/background receipt.jpg">
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="homepage.html">Home</a>
                <a href="aboutUs.html">About</a>
                <a href="aboutArtist.html">Artist</a>
                <a href="contactUs.jsp">Contact</a>
                <a href="staffLogin.jsp">Admin</a>
                <a href="refund.jsp">Refund</a>
            </div>
        
            <div id="main">
                <!--Background image and Top bar eg: logo DoNation and logo Caliph Buskers-->
                <div class="span">           
                <img src="Icon/menu.png" class="menuicon" onclick="openNav()">
                <div>             
                    <img src="Image/logo white.png" class="icon">
                    <img src="Image/caliph buskers logo.png" class="icon">
                </div>    
                </div>
                
            <!--Page Content-->    
            <div class="divPadding">
                <h1>Ticket Booking Details</h1>
            </div>
            <div style="display:flex; align-content: center">
                <div class="divBackgroundGrey">
                <h2>Customer Details<br></h2>
                <table>
                <tbody>
                    <tr>
                        <td><b>Full Name</b><br></td>
                        <td><%=donorBean.getDonorName()%><br></td>
                    </tr>
                    <tr>
                        <td><b>Gender</b><br></td>
                        <td><%=donorBean.getDonorGender()%><br></td>
                    </tr>
                    <tr>    
                        <td><b>Age</b><br></td>
                        <td><%=donorBean.getDonorAge()%><br></td>
                    </tr>
                    <tr>
                        <td><b>Phone Number</b><br></td>
                        <td><%=donorBean.getDonorPhone()%><br></td>
                    </tr>
                </tbody> 
                </table> 
                </div>

                <div class="divBackgroundGrey" >
                    <h2>Your Ticket</h2>

                    <table>
                        <tbody>
                            <tr>    
                                <td><b style="color:yellow">Yellow Ticket </b><br></td>
                                <td><b></b>RM150 x <%=y%> unit<br></td>
                            </tr>
                            <tr>    
                                <td><b style="color:orange">Orange Ticket </b><br></td>
                                <td><b></b>RM100 x <%=o%> unit<br></td>
                            </tr>
                            <tr>    
                                <td><b style="color:greenyellow">Green Ticket </b><br></td>
                                <td><b></b>RM75 x <%=g%> unit<br></td>
                            </tr>
                            <tr>    
                                <td><b style="color:lightskyblue">Blue Ticket </b><br></td>
                                <td><b></b>RM50 x <%=b%> unit<br></td>
                            </tr>
                            <tr>
                                <%if(bookingBean.getMerchandiseID()==1){%>
                                <td><b></b>Combo A<br></td>
                                <td>Rm20</td>
                                <%}else if(bookingBean.getMerchandiseID()==2){%>
                                 <td><b></b>Combo B<br></td>
                                 <td>Rm50</td>
                                <%}else if(bookingBean.getMerchandiseID()==3){%>
                                 <td><b></b>Combo C<br></td>
                                 <td>Rm85</td>
                                 <%}else{%>
                                 <td><b>Merchandise Combo</b><br></td>
                                 <td>None<br></td>
                                 <%}%>
                                 
                            </tr>
                            <tr>    
                                <td><b>Donation</b><br></td>
                                <td><b></b>RM<%=bookingBean.getAddValue()%><br></td>
                            </tr>
                            
                            <tr>    
                                <td><b>Total Price</b><br></td>
                                <td><b></b>RM<%=bookingBean.getTotalPrice()%><br></td>
                            </tr>

                        </tbody> 
                    </table>
                    <p></p>
                    <a class="book" href="ticketview.jsp?y=<%=y%>&o=<%=o%>&g=<%=g%>&b=<%=b%>&merch=<%=bookingBean.getMerchandiseID()%>&code=<%=bookingBean.getCode()%>&id=<%=bookingBean.getBookingID()%>" target="_blank">Print Your Ticket</a><br>
                    <p class="note">*Click your ticket link and please print or make a screenshot of the ticket.</p>
                </div>
            </div>
            <div class="divPadding">
                <h1>Thank You !!<br></h1>
                <h4>Enjoy the concert while make a donation is best way to have a good deed. Congratulations !<br></h4>
                <p class="note">*You may save or print the full receipt</p>
                <a class="input2" href="homepage.html" >Finish Payment</a>
            </div>    
        </div>
                   
        <!--Navigation bar details-->            
        <script>
            /* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
                function openNav() {
                  document.getElementById("mySidenav").style.width = "250px";
                  document.getElementById("main").style.marginLeft = "250px";
                  document.body.style.backgroundColor = "rgba(0,0,0,0.-4)";
                }

                /* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
                function closeNav() {
                  document.getElementById("mySidenav").style.width = "0";
                  document.getElementById("main").style.marginLeft = "0";
                  document.body.style.backgroundColor = "black";
                } 
        </script>
    </body>
</html>
