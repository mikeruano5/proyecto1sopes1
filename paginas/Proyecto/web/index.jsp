<%-- 
    Document   : home
    Created on : 30/06/2018, 03:47:32 PM
    Author     : scxal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.SEND" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>LogIn</h1>
        <form action="login_check.jsp" method="post">
            <br/>Usuario:<input type="text" name="user">
            <br/>Contraseña:<input type="password" name="password">
            <br/><input type="submit" value="Ingresar">
        </form>
        <br>
        <a href="registro.jsp">Registrarse</a>
    </body>
</html>
