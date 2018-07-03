<%-- 
    Document   : creado
    Created on : 2/07/2018, 01:06:37 PM
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
        <h2>
        <%
            String username = request.getParameter("user");
            String password = request.getParameter("password");
            String name=request.getParameter("nombre");
            String lastname=request.getParameter("apellido");
            String email=request.getParameter("correo");
            SEND send = new SEND();
            String msg = "{\"operacion\":\"create\",\"dpi\":\""+username+"\",\"password\":\""+password+"\",";
            msg += "\"nombre\":\""+name+"\",\"apellido\":\""+lastname+"\",\"correo\":\""+email+"\"}";
            String result = send.send(msg, "rpc_queue");
            send.close();
            out.println("Usuario Creado "+username);
            %>
        </h2>
        <br>
        <br>
        <a href="index.jsp">Volver</a>
    </body>
</html>
