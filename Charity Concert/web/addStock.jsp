<%@page import="com.dao.MerchandiseDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.MerchandiseBean"%>
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
    </head>
    <body>
        
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int stock = Integer.parseInt(request.getParameter("stock"));
        %>
        
        <!--Navigation bar-->
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="areaMerchTable.jsp">Area & Merchandise<br>Table</a>
            <a class="w3-text-red" href="staffLogin.jsp"><b>Log Out</b></a>
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
                    <%if(id==1){%>
                    <h1><b>Add Stock for Combo A</b></h1>
                    <%}else if(id==2){%>
                    <h1><b>Add Stock for Combo B</b></h1>
                    <%}else if(id==3){%>
                    <h1><b>Add Stock for Combo C</b></h1>
                    <%}%>
                <form method = "post" action = "AddMerchStockServlet">
                    <p></p>
                        <input class="input1" type ="hidden" name ="merchandiseId" value="<%=id%>">
                        <input class="input1" type ="hidden" name ="merchandiseCurrentStock" value="<%=stock%>">
                        <input class="input1" type ="number" name ="merchandiseStock" min="1" Style="width:25%" placeholder="Enter Num. of Stock."required>&nbsp;
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