<%@page import="com.dao.MerchandiseDao"%>
<%@page import="com.bean.MerchandiseBean"%>
<%@page import="com.dao.AreaDao"%>
<%@page import="com.bean.AreaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<!--bookingOrder.html-->
<%@page import="com.controller.BookingServlet" %>
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
            p{
                font-size: 14px; 
                line-height: 1.6;
            }
            
            h1{
                font-size: 34px;
            }
            
            td{
                background-color:  #000000 ;
                padding:10px;
                border-radius: 25px;
                padding-left: 20px;
            }
            input[type=text] {
                width: 300px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                padding: 12px 20px 12px 13px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }
            input[type=text]:focus {
                width: 50%;
            }
            input[type=tel] {
                width: 300px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                padding: 12px 20px 12px 13px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }
            input[type=tel]:focus {
                width: 50%;
            }
        </style>
        <title>Booking of Charity Concert</title>
        <link rel="stylesheet" href="style.css">
    </head>
    
        <!--Error PopUp-->
        <script type="text/javascript"> 
            
        var errMessage= '<%=request.getAttribute("errMessage")%>';  
         
        if (errMessage != "null") {   
            function alertName(){
                alert("Invalid User Credential !\n- Wrong Username or Password");
            } 
        }
        window.onload = alertName;  
        
        function validate()
        {   
        var ticketY = document.form.yellowTicket.value; 
        var ticketO = document.form.orangeTicket.value;
        var ticketG = document.form.greenTicket.value;
        var ticketB = document.form.blueTicket.value;

        if (ticketY==0 && ticketO==0 && ticketG==0 && ticketB==0)
        { 
        alert("Choose at least 1 type of area ticket"); 
        return false; 
        }
        else
            return true;
        }
        </script>
        
    <body>
        <!--Navigation bar-->
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
            <form name="form" action="BookingServlet" method="POST" onsubmit="return validate()">
                
            <!--Background image and Top bar eg: logo DoNation and logo Caliph Buskers-->
            <div class="span">
                <img src="Icon/menu.png" class="menuicon" onclick="openNav()">
                <div>             
                    <img src="Image/logo white.png" class="icon">
                    <img src="Image/caliph buskers logo.png" class="icon">
                </div>    
            </div>
            <div class="background1">
                
            <!--Page Content-->    
            <div class="containerleft">
                <h1><b>Book Your Ticket Here.</b></h1>
                <p>  </p>
                <input class="input1" type = "text" name = "fullName" size="49" placeholder="Full Name" required>&nbsp;
                <select style="width:25%; padding: 12px 20px 12px 13px;border-radius: 4px" size="1" name="gender" required>
                    <option value="NoGender">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female
                    </option>
                </select>&nbsp;
                <input class="input1" style="width:25%; padding: 12px 20px 12px 13px;border-radius: 4px" type ="number" min="1" name ="age" size="31" placeholder="Age" required>&nbsp;
                <input class="input1" type ="tel" pattern="[0][1][0-9]{1}-[0-9]{7,8}" name ="pNumber" size="49" placeholder="Phone Num (eg:01X-XXXXXXXX)" required>&nbsp;                     
                <input class="input1" type ="text" name ="email" size="49" placeholder="Email" required>&nbsp; 
                
                <p class="noteGrey">
                Scroll Down
                </p>
                <img class="arrow"
                 src="Image/arrow down.png"
                    width="25" height="20"
                    alt="Arrow Down">
            
            </div>
        </div>
        
        
        <%
            ArrayList<AreaBean> areaList=new ArrayList<AreaBean>();
            AreaDao areaDao = new AreaDao();
                
            areaList=areaDao.getAreaFromDB();
            
             AreaBean temp=new  AreaBean() ;
            temp=(AreaBean) areaList.get(0);
            String availableY=temp.getAreaStatus();
            int capY=150-temp.getAreaCapacity();
            
            temp=(AreaBean) areaList.get(1);
            String availableO=temp.getAreaStatus();
            int capO=150-temp.getAreaCapacity();
            
            temp=(AreaBean) areaList.get(2);
            String availableG=temp.getAreaStatus();
            int capG=150-temp.getAreaCapacity();
            
            temp=(AreaBean) areaList.get(3);
            String availableB=temp.getAreaStatus();
            int capB=150-temp.getAreaCapacity();
            
        %>
        <div class="background2">
            <div class="containerleft">
                <table cellspacing="10" cellpadding="10" >
                    <tbody>
                    <tr>
                        <td style="background-color: #204060"><b>Area</b><br></td>
                        <td style="background-color: #204060"><b>Availability</b><br></td>
                        <td style="background-color: #204060"><b>No. of Seat</b><br></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffcc00"><b>Yellow</b><br></td>
                        
                        <%if(availableY.equals("Not Available")){%>
                        <td><b style="color:red"><%=availableY%></b><br></td>
                        <%}else{%>
                        <td><b><%=availableY%></b><br></td>   
                        <%}%>
                        
                        <td><input class="input1" type = "number" name = "yellowTicket" value="0" min="0" max="<%=capY%>" required  style="width:75%"></td>
                    </tr>
                    <tr>    
                        <td style="background-color: #ff6600"><b>Orange</b><br></td>
                        <%if(availableO.equals("Not Available")){%>
                        <td><b style="color:red"><%=availableO%></b><br></td>
                        <%}else{%>
                        <td><b><%=availableO%></b><br></td>   
                        <%}%>
                        <td><input class="input1" type = "number" name = "orangeTicket" value="0" min="0" max="<%=capO%>" required style="width:75%"></td>
                    </tr>
                    <tr>
                        <td style="background-color: #00802b"><b>Green</b><br></td>
                        <%if(availableG.equals("Not Available")){%>
                        <td><b style="color:red"><%=availableG%></b><br></td>
                        <%}else{%>
                        <td><b><%=availableG%></b><br></td>   
                        <%}%>
                        <td><input class="input1" type = "number" name = "greenTicket" value="0" min="0" max="<%=capG%>" required style="width:75%" ></td>
                    </tr>
                    <tr>
                        <td style="background-color: #000066"><b>Blue</b><br></td>
                        
                        <%if(availableB.equals("Not Available")){%>
                        <td><b style="color:red"><%=availableB%></b><br></td>
                        <%}else{%>
                        <td><b><%=availableB%></b><br></td>   
                        <%}%>
                        
                        <td><input class="input1" type = "number" name = "blueTicket" value="0" min="0" max="<%=capB%>" required style="width:75%"></td>
                    </tr>
                    </tbody> 
                </table>
                <p style="padding: 20px; "></p>

                
                <%
                    ArrayList<MerchandiseBean> merchList=new ArrayList<MerchandiseBean>();
                    MerchandiseDao merchDao = new MerchandiseDao();
                    
                    merchList=merchDao.selectMerchandise();
                    
                    MerchandiseBean tempMerch = new MerchandiseBean();
                    tempMerch = (MerchandiseBean) merchList.get(0);
                    String comboA=tempMerch.getMerchandiseStatus();
                    
                    tempMerch = (MerchandiseBean) merchList.get(1);
                    String comboB=tempMerch.getMerchandiseStatus();
                    
                    tempMerch = (MerchandiseBean) merchList.get(2);
                    String comboC=tempMerch.getMerchandiseStatus();

                %>
                
                
                <select size="1" name="merchandise" required>
                    <option value="NoMerchandise">Select Merchandise Combo</option>
                    <option value="ComboN">None</option>
                    <%if(comboA.equals("Available")){%>
                    <option value="ComboA">Combo A</option>
                    <%}if(comboB.equals("Available")){%>
                    <option value="ComboB">Combo B</option>
                    <%}if(comboC.equals("Available")){%>
                    <option value="ComboC">Combo C</option>
                    <%}%>
                    
                    
                </select>&nbsp;
                
                    <input class="input1" type ="number" min="0" name ="extdonation" size="8" placeholder="Extra Donation (RM)" required>&nbsp;
                   
                <div>
                    <input class="input2" type="submit" value="Checkout">
                    <input class="input3" type="reset" value="Reset">
                </div>
        </div>
        <div 
            class="background3">
        </div>
        </div>
        </form> 
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
             
    </body>
</html>
