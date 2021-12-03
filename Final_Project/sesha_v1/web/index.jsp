<%-- 
    Document   : main
    Created on : Nov 30, 2021, 10:05:12 AM
    Author     : Natalie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException,java.io.PrintWriter,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"%>
 <%     
    String categoryID = request.getParameter("categoryID");
    
    String driver = "org.mariadb.jdbc.Driver";
    Class.forName(driver);
    
    String dbURL = "jdbc:mariadb://localhost:3306/apollo8_sesha";
    String username = "apollo8";
    String password = "Ea8AHNGh";
    Connection conn = DriverManager.getConnection(dbURL, username, password);%>   
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sesha</title>

        <!-- bootstrap 5 CSS followed by global css -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">
        <link href="./resources/global-styles.css"
              rel="stylesheet"
              type="text/css">
        <link rel="shortcut icon" type="image/ico"
              href="./resources/images/favicon.ico">
    </head>

    <body onLoad="modiifyHeader()">
        <!-- Popup pages 
        <div id="codeEntryOverlay" class="invisible">
            <div id="background" onClick="hideEnterCode()"></div>
            <div id="codeEntry">
                <h2>Enter code</h2>
                <input type="text" id="codeTextBox" name="Search" placeholder="xxxx-xxxx-xxxx">
                <button onClick="hideEnterCode()">Enter</button>
            </div>
        </div>-->

        <!--Site wide header -->
        <div class="container-flex global-shell">
            
            <jsp:include page="./resources/header.jsp"/>
            
            <div class="row p-1 align-items-center justify-cosntent-center main">
                <div class="col-1">
                </div>
                <div class="col-7 main-content">
                        <div class="row align-items-center justify-content-arround
                            row-cols-auto">

                    <%  Statement stment = conn.createStatement();
                        String sectionsQuery = "SELECT * FROM courses";
                        if(categoryID!=null){
                            sectionsQuery = "Select courses.* FROM courses join categoryLinks on courses.courseID = categoryLinks.courseID WHERE categoryLinks.catagoryID="+categoryID;
                        }
                        ResultSet rs = stment.executeQuery(sectionsQuery);    
                     while(rs.next()){%>
                        <div class="mb-3 col course">
                            <div class="card shadow" style="width: 18rem;">
                                <img src="<%=rs.getString("previewImageURL")%>"
                                     class="card-img-top" alt="<%=rs.getString("courseName")%> course image">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <%=rs.getString("courseName")%>
                                    </h5>
                                    <p class="card-text">
                                        <%=rs.getString("courseDescription")%>
                                    </p>
                                    
                                    <%  Statement stmentOwner = conn.createStatement();
                                        String sectionsQueryOwner = "SELECT * FROM courseOwnership WHERE userID=1 and courseID = " + rs.getString("courseID");
                                        ResultSet rsOwner = stment.executeQuery(sectionsQueryOwner);
                                        
                                    if(rsOwner.isBeforeFirst()){%>
                                    <form class="viewCourse" action="seshaServlet" method="post">    
                                        <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                        <input type="hidden" name="action" value="viewCourse">
                                        <input class="btn btn-primary" type="submit" value="View Course">
                                    </form>
                                    <%} rsOwner.close();
                                        stmentOwner.close();%>
                                    <form class="viewPreview" action="seshaServlet" method="post">    
                                        <input type="hidden" name="courseID" value="<%=rs.getString("courseID")%>">
                                        <input type="hidden" name="action" value="viewPreview">
                                        <input class="btn btn-primary" type="submit" value="View Preview">
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                    <%} rs.close();
                        stment.close(); %>
                    </div>
                </div>     
                <div class="col-3 align-self-start text-center text-wrap main-sidebar">
                    <div class="row align-items-start justify-content-arround
                        row-cols-auto text-center text-wrap">

                        <div class="col pill-nav">
                            <div class="input-group mb-3">
                                <button class="btn btn-outline-secondary" 
                                    type="button" id="button-addon1"
                                    onclick="bysection(1000)">Reset</button>

                                <input type="text" 
                                    class="form-control" 
                                    placeholder="search courses &#x1f50e;" 
                                    aria-label="Search" 
                                    aria-describedby="button-addon1">
                            </div>
                        </div>
                        <%   stment = conn.createStatement();
                         sectionsQuery = "SELECT * FROM categoryName";
                         rs = stment.executeQuery(sectionsQuery);
                        while(rs.next()){%>
                            <form class="col pill-nav" action="seshaServlet" method="post">    
                                <input type="hidden" name="categoryID" value="<%=rs.getString("catagoryID")%>">                    
                                <button  class="mb-3 btn btn-info" type="submit" name="action" value="store"><%=rs.getString("catagoryText")%></button>
                            </form>
                        <%} rs.close();
                            stment.close();%>
                    </div>
                </div>
                <%--<jsp:include page="./resources/categories.jsp"/>--%>
                <div class="col-1">
                </div>
            </div>            
            <jsp:include page="./resources/footer.jsp"/>
        </div>
        <!-- bootstrap JavaScript followed by Global JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
            crossorigin="anonymous"></script>
        <script src="./resources/index.js"></script>
    </body>
</html>


<%
    conn.close();
%>