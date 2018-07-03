<%-- 
    Document   : update
    Created on : 2/07/2018, 12:51:03 PM
    Author     : scxal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.SEND" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();
            String name=request.getParameter("nombre");
            String lastname=request.getParameter("apellido");
            String email=request.getParameter("correo");
            SEND send = new SEND();
            String msg = "{\"operacion\":\"update\",\"dpi\":\""+username+"\",\"password\":\""+password+"\",";
            msg += "\"nombre\":\""+name+"\",\"apellido\":\""+lastname+"\",\"correo\":\""+email+"\"}";
            String result = send.send(msg, "rpc_queue");
            send.close();
            response.sendRedirect("perfil.jsp");
            %>
    </body>
</html>
