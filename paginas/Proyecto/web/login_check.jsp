<%-- 
    Document   : login_check
    Created on : 2/07/2018, 08:13:19 AM
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
        <%
        String username=request.getParameter("user");
        String password=request.getParameter("password");
        SEND send = new SEND();
        String result = send.send("{\"operacion\":\"login\",\"dpi\":\""+username+"\",\"password\":\""+password+"\"}", "rpc_queue");
        send.close();
        if(result.equals("1"))
            {
                session.setAttribute("username",username);
                session.setAttribute("password",password);
                response.sendRedirect("home.jsp");
            }
        else
            response.sendRedirect("login_error.jsp");
        %>
    </body>
</html>
