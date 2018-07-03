<%-- 
    Document   : logout
    Created on : 2/07/2018, 08:38:42 AM
    Author     : scxal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LogOut</h1>
        <a href="index.jsp">Continuar</a>
         <%
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
        %>
    </body>
</html>
