<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.controller.LoginServlet" %>
<!DOCTYPE html>
<html>
    <!--Page Content-->
    <head>
        <title>Staff Login Page</title>
        <link rel="stylesheet" href="style.css">
        <style>
            input[type=text] {
                width: 300px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                padding: 12px 20px 12px 20px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }
            input[type=text]:focus {
                width: 50%;
            }
            input[type=password] {
                width: 300px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                padding: 12px 20px 12px 20px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }
            input[type=password]:focus {
                width: 50%;
            }
        </style>
    </head>
    
    <body>
        
        
        <!--Error PopUp-->
        <script type="text/javascript"> 
            
        var errMessage= '<%=request.getAttribute("errMessage")%>';  
         
        if (errMessage != "null") {   
            function alertName(){
                alert("Invalid User Credential !\n- Wrong Username or Password");
            } 
        }
        window.onload = alertName;  
        </script>
        
        <!--Navigation bar-->
        <div id="mySidenav" class="sidenav"> 
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="homepage.html">Home</a>
            <a href="aboutUs.html">About</a>
            <a href="aboutArtist.html">Artist</a>
            <a href="contactUs.jsp">Contact</a>
            <a href="refund.jsp">Refund</a>
            <a class="w3-text-blue" href="bookingOrder.jsp"><b>Book</b></a>
         </div>
        
        <div id="main">
        <form name="form" action="LoginServlet" method="POST">
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
                <div class="divLeft">
                    <h1><b>Please Log In.</b></h1>
                    <p>  </p>    
                    <input class="input1" type ="text" name = "username" size="49" placeholder="Enter Username" required>&nbsp;
                    <input class="input1" type ="password" name ="password" size="31" placeholder="Enter Password" required>&nbsp;
                    <p></p>
                    <input class="input2" type="submit" value="Log in">
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
</html>
