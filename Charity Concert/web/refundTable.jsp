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
            
            .background4{
                height: 790px;
                width: 100%;
                position: absolute;
                background-size: cover;
                background-repeat: no-repeat;
                opacity: 1;
            }
        </style>
        
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Table</title>
    </head>
    <body>
        <!--Navigation bar-->
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="StaffHomepage.jsp">Admin Home</a>
            <a href="areaMerchTable.jsp">Area & Merchandise<br>Table</a>
            <a href="bookingTable.jsp">Booking Table</a>
            <a href="donorTable.jsp">Donor Table</a>
            <a href="contactTable.jsp">Contact Us Table</a>
            <a class="w3-text-red" href="staffLogin.jsp"><b>Log Out</b></a>
        </div>
        
        <div id="main">
            <!--Background image and Top bar eg: logo DoNation and logo Caliph Buskers-->
            <img class="background4" src="Image/axiata arena.png">
            <div class="span">           
                <img src="Icon/menu.png" class="menuicon" onclick="openNav()">
                <div>             
                    <img src="Image/logo white.png" class="icon">
                    <img src="Image/caliph buskers logo.png" class="icon">
                </div>    
            </div>

            <!--Page Content-->
            <div>
                <c:set var="bookId" value="${param.bookId}"/>
                <c:set var="donorId" value="${param.donorId}"/>
                <c:set var="merchandiseId" value="${param.merchandiseId}"/>
                <c:set var="totalPrice" value="${param.totalPrice}"/>
                <c:set var="addPrice" value="${param.addPrice}"/>
                <c:set var="finalPrice" value="${param.finalPrice}"/>
                <c:set var="bookDate" value="${param.bookDate}"/>
                <c:set var="code" value="${param.code}"/>

                <div style="margin-left: 100px" class="divLeft w3-panel">
                <h1>Refund</h1>
                <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM REFUND
                </sql:query>
                <br>
                <table style="width:85%" class="w3-yellow w3-table w3-striped w3-text-black">
                <tr>
                    <th>Booking Id</th>
                    <th>Donor Id</th>
                    <th>Merchandise Id</th>
                    <th>Final Price (RM)</th>
                    <th>Add Value (RM)</th>
                    <th>Total Price (RM)</th>
                    <th>Booking Date (yyyy-mm-dd)</th>
                    <th>Code</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.BOOKING_ID}"/></td>
                    <td><c:out value="${row.DONOR_ID}"/></td>
                    <td><c:out value="${row.MERCHANDISE_ID}"/></td>
                    <td><c:out value="${row.FINAL_PRICE}"/></td>
                    <td><c:out value="${row.ADD_VALUE}"/></td>
                    <td><c:out value="${row.TOTAL_PRICE}"/></td>
                    <td><c:out value="${row.BOOKING_DATE}"/></td>
                    <td><c:out value="${row.CODE}"/></td>
                </tr>
                </c:forEach>
                </table>
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