<%-- 
    Document   : perfil
    Created on : 2/07/2018, 12:06:53 PM
    Author     : scxal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="logica.SEND" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.parser.ParseException" %>
<%@page import="org.json.simple.parser.JSONParser" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
    </head>
    <body>
        <a href="home.jsp">Volver</a><br>
        <h1>
            <%
                String username = session.getAttribute("username").toString();
                String password = session.getAttribute("password").toString();
                out.println("Perfil de "+username);
                
                SEND nuevo = new SEND();
                String perfil = nuevo.send("{\"operacion\":\"get\",\"dpi\":\""+username+"\",\"password\":\""+password+"\"}", "rpc_queue");
                nuevo.close();
                JSONParser parser = new JSONParser();
                JSONObject obj = new JSONObject();
                try{
                    obj = (JSONObject) parser.parse(perfil);
                }catch(Exception e){
                    System.out.println(e.toString());
                }
                %>
        </h1>
            <form action="update.jsp" method="post">
                <br/>Nombre:<input type="text" name="nombre" value=<% out.println("\""+obj.get("nombre")+"\""); %>>
                <br/>Apellido:<input type="text" name="apellido" value=<% out.println("\""+obj.get("apellido")+"\""); %>>
                <br/>Correo:<input type="text" name="correo" value=<% out.println("\""+obj.get("correo")+"\""); %>>
                <br/><input type="submit" value="Actualizar">
            </form>
    </body>
</html>
