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
            .container1{
                position: relative;
            }
            .top-left {
            position: absolute;
            width: 248px;
            height:95px;
            top: 208px;
            left: 49px;
            display:flex;
            }
            .ticketArea{
                color: black;
                font-size: 100px;
                margin-left: 0px;
                margin-top: 0px;
                width:161px;
                background-color: white; 
                display:flex;
            }
            .ticketDetails{
                color: black;
                font-size: 12px;
                margin-left: 13px;
            }
            .ticketCode{
                color: black;
                font-size: 13px;
                
                
            }
            .bottom-left {
            position: absolute;
          
            top: 553px;
            left: 61px;
            display:flex;
            }
            .box{
                display:flex;
               heigth:25%;
               width: 25%;
            }
            
        </style>
        <title>TICKET DOWNLOAD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    
    <!--Page content-->
    <body>
        <%
       
       String y = request.getParameter("y");
       String o =request.getParameter("o");
       String g =request.getParameter("g");
       String b = request.getParameter("b");
       String merch = request.getParameter("merch");
       String code = request.getParameter("code");
       String id = request.getParameter("id");
    %>
        <div class="container1">
            <img src="Image/ticket.png" >
                <div class="top-left">
                    <div class="ticketArea">
                        <%if(!y.equals("0")){%>
                        <div class="box" style="background-color: yellow"></div>
                        <%}else{%>
                        <div class="box" style="background-color: white"></div>
                        <%}%>
                        
                        <%if(!o.equals("0")){%>
                        <div class="box" style="background-color: orange"></div>
                        <%}else{%>
                        <div class="box" style="background-color: white"></div>
                        <%}%>
                        
                        <%if(!g.equals("0")){%>
                        <div class="box" style="background-color: greenyellow"></div>
                        <%}else{%>
                        <div class="box" style="background-color: white"></div>
                        <%}%>
                        
                        <%if(!b.equals("0")){%>
                        <div class="box" style="background-color: lightskyblue"></div>
                        <%}else{%>
                        <div class="box" style="background-color: white"></div>
                        <%}%>
                    </div>
                    <div class="ticketDetails">
                        Area Yellow : <b><%=y%></b><br/>
                        Area Orange : <b><%=o%></b><br/>
                        Area Green  : <b><%=g%></b><br/>
                        Area Blue   : <b><%=b%></b><br/>
                        <%if(merch.equals("1")){%>
                        Merchandise : <br><b>Combo A</b>
                        <%}else if(merch.equals("2")){%>
                        Merchandise : <br><b>Combo B</b>
                        <%}else if(merch.equals("3")){%>
                        Merchandise : <br><b>Combo C</b>
                         <%}else{%>
                        Merchandise : <br><b>None</b>
                         <%}%>
                       
                        
                    </div>
                    
                </div>
                <div class="bottom-left ticketCode">
                           
                    Booking Id: <b><%=id%></b>&nbsp; Code: <b><%=code%></b>
                </div>
         </div>

    </body>
</html>
