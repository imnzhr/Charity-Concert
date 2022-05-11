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
            .span{
                display: flex;
            }
            .icon{
                width: 85px;
                height: 85px;
                padding: 15px;
                
            }
        
            .picture1{
                width: 450px;
                height: 450px;
                padding: 15px;
                
            }
            
            .picture2{
                width: 150px;
                height: 100px;
                padding: 15px;
                margin-left: -20px;
            } 
            
            .icon2{
                width: 30px;
                height: 30px;
                margin-left: 5px;
                
            }
            
            p{
                font-size: 14px; 
                line-height: 1.6;
            }
            
            h1{
                font-size: 34px;
                
            }
            
            .divLeft{
                padding: 70px;
            }
            
            .divLeft2{
                margin-left: 70px;
                
            }
            
            .navigation{
                margin-right: 10px;

                
            }
            
            .book{
                background-color: green;
            }
            
            .background7{
                height: 790px;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                position: absolute;
                opacity: 0.7;
            }
            
        </style>
        
        <link rel="stylesheet" href="style.css">
        <title>Contact Us.</title>
        
         <!--Error PopUp-->
        <script type="text/javascript"> 
            
        var succMessage= '<%=request.getAttribute("succMessage")%>';  
         
        if (succMessage != "null") {   
            function alertName(){
                alert("Your message had been sent, Thank you!");
            } 
        }
        window.onload = alertName;  
        </script>
    </head>
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
            <a class="w3-text-blue" href="bookingOrder.jsp"><b>Book</b></a>
        </div>
        <div id="main">
            <!--Background image and Top bar eg: logo DoNation and logo Caliph Buskers-->
            <img class="background7" src="Image/background contact us.jpeg">
            <div class="span">           
                <img src="Icon/menu.png" class="menuicon" onclick="openNav()">
                <div>             
                    <img src="Image/logo white.png" class="icon">
                    <img src="Image/caliph buskers logo.png" class="icon">
                </div>    
            </div>

            <!--Page Content-->
            <div>
                <div class="containerleft">
                    <h1><b>Let's get in touch.<br>
                        Send me a message.</b></h1>
                <form method = "post" action = "ContactServlet">
                    <p>  </p>
                        <input style="border-radius: 4px" class="input1" type = "text" name = "fullName" size="49" placeholder="Full Name" required>&nbsp;
                        <input style="border-radius: 4px" class="input1" type ="text" name ="email" size="31" placeholder="Email" required>&nbsp;
                        <input style="border-radius: 4px" class="input1" type ="text" name ="subject" size="49" placeholder="Subject" required>&nbsp;  
                        <textarea class="input1" name ="message" placeholder="Message" style="height: 100px" required></textarea>&nbsp;
                        <p> </p>
                        <input class="input2" type="submit" value="Submit">
                        <input class="input3" type="reset" value="Reset">
                </form>
                </div>           
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