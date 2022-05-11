<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDatasource"
 driver="org.apache.derby.jdbc.ClientDriver"
 url="jdbc:derby://localhost:1527//CharityConcert" user="app"
 password="app"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>  
    <head>
        <style>            
            table, th, td {
                border: 1px solid white;
                border-collapse: collapse;
                padding: 10px;
            }
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area & Merchandise Table</title>
        
        <!--Error PopUp-->
        <script type="text/javascript"> 
            
        var succMessage= '<%=request.getAttribute("succMessage")%>';  
         
        if (succMessage != "null") {   
            function alertName(){
                alert("Successfully added new stock!");
            } 
        }
        window.onload = alertName;  
        </script>
    </head>
    <body>
        <!--Navigation bar-->
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="StaffHomepage.jsp">Admin Home</a>
            <a href="bookingTable.jsp">Booking Table</a>
            <a href="donorTable.jsp">Donor Table</a>
            <a href="contactTable.jsp">Contact Us Table</a>
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
                <c:set var="areaId" value="${param.areaId}"/>
                <c:set var="areaName" value="${param.areaName}"/>
                <c:set var="areaCapacity" value="${param.areaCapacity}"/>
                <c:set var="areaStatus" value="${param.areaStatus}"/>
                <c:set var="areaPrice" value="${param.areaPrice}"/>
                <c:set var="merchandiseId" value="${param.merchandiseId}"/>
                <c:set var="merchandiseType" value="${param.merchandiseType}"/>
                <c:set var="merchandisePrice" value="${param.merchandisePrice}"/>
                <c:set var="merchandiseStatus" value="${param.merchandiseStatus}"/>
                <c:set var="merchandiseStock" value="${param.merchandiseStock}"/>

                <div style="margin-left: 100px" class="divLeft w3-panel">
                <h1>Area</h1>
                <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM AREA
                </sql:query>
                <br>
                <table style="background-color: #818BC8; width:85%" class="w3-table w3-striped w3-text-black">
                <tr>
                    <th>Area Id</th>
                    <th>Name</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th>Price (RM)</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.AREA_ID}"/></td>
                    <td><c:out value="${row.AREA_NAME}"/></td>
                    <td><c:out value="${row.AREA_CAPACITY}"/></td>
                    <td><c:out value="${row.AREA_STATUS}"/></td>
                    <td><c:out value="${row.AREA_PRICE}"/></td>
                </tr>
                </c:forEach>
                </table>
                </div>
            </div>
                <br>    
            <div>
                <div style="margin-left: 100px" class="w3-panel">
                <h1>Merchandise</h1>
                <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM MERCHANDISE
                </sql:query>
                <br>
                <table style="background-color: #fa4646; width:85%" class="w3-table w3-striped w3-text-black">
                <tr>
                    <th>Merchandise Id</th>
                    <th>Type</th>
                    <th>Price (RM)</th>
                    <th>Status</th>
                    <th>Stock</th>
                    <th></th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.MERCHANDISE_ID}"/></td>
                    <td><c:out value="${row.MERCHANDISE_TYPE}"/></td>
                    <td><c:out value="${row.MERCHANDISE_PRICE}"/></td>
                    <td><c:out value="${row.MERCHANDISE_STATUS}"/></td>
                    <td><c:out value="${row.MERCHANDISE_STOCK}"/></td>
                    <td><a class="book" href="addStock.jsp?id=${row.MERCHANDISE_ID}&stock=${row.MERCHANDISE_STOCK}">Add New Stock</a></td>
                </tr>
                </c:forEach>
                </table>
                <br>
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
  
     