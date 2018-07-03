<%-- 
    Document   : registro
    Created on : 2/07/2018, 12:07:11 PM
    Author     : scxal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
    </head>
    <body>
        <h1>Ingrese sus datos</h1>
        <form action="creado.jsp" method="post">
            <br/>Usuario:<input type="text" name="user">
            <br/>Contraseña:<input type="password" name="password">
            <br/>Nombre:<input type="text" name="nombre">
            <br/>Apellido:<input type="text" name="apellido">
            <br/>Correo:<input type="text" name="correo">
            <br/><input type="submit" value="Registrar">
        </form>
    </body>
</html>
