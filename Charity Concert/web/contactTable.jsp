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
            <a href="refundTable.jsp">Refund Table</a>
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
                <c:set var="contactId" value="${param.contactId}"/>
                <c:set var="contactFname" value="${param.contactFname}"/>
                <c:set var="contactEmail" value="${param.contactEmail}"/>
                <c:set var="contactSubject" value="${param.contactSubject}"/>
                <c:set var="contactMessage" value="${param.contactMessage}"/>

                <div style="margin-left: 100px" class="divLeft w3-panel">
                <h1>Contact Us</h1>
                <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM CONTACT
                </sql:query>
                <br>
                <div style="overflow-y: auto;height: 500px">
                <table style="background-color: #57fa57;overflow: scroll;width:85%" class="w3-table w3-striped w3-text-black">
                <tr>
                    <th>Contact Us Id</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                </tr>
                
                <c:forEach var="row" items="${result.rows}">
                
                <tr>
                    <td><c:out value="${row.CONTACT_ID}"/></td>
                    <td><c:out value="${row.FULLNAME}"/></td>
                    <td><c:out value="${row.EMAIL}"/></td>
                    <td><c:out value="${row.SUBJECT}"/></td>
                    <td><c:out value="${row.MESSAGE}"/></td>
                </tr>
                
                </c:forEach>
                </table>
                </div>
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
