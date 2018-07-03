<%-- 
    Document   : home
    Created on : 2/07/2018, 08:24:46 AM
    Author     : scxal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" type="text/javascript" src="http://www.flotcharts.org/flot/jquery.js"></script>
        <title>Home Mensajeria</title>
        <script language="javascript" type="text/javascript">
            function update(){
                $.ajax({
                    url: "http://localhost:8080/Proyecto/webresources/get",
                    type: "GET",
                    dataType: "text",
                    success: function(response){
                            var res = response.replace("[","");
                            res = res.replace("]","");
                            var lineas = res.split("',");
                            var i = 0;
                            var texto = "";
                            var obj;
                            for(i;i<lineas.length;i++){ 
                                var linea = lineas[i].replace("'","");
                                linea = linea.replace("'","");
                                try{
                                    obj = JSON.parse(linea);
                                    texto+=obj.usuario+"\n";
                                    texto+=obj.msj+"\n";
                                    texto+=obj.timestamp+"\n\n";
                                }catch(err){
                                    texto+="error - mensaje invalido \n\n";
                                    //texto+=linea.replace("'","")+"\n\n";
                                }
                            }
                            $('#area').val(texto);
                        }   
                    });
                    $('#area').scrollTop(1000);
                    setTimeout(update, 5000);
            }
            
            function enviar(){
                var json = "{\"usuario\":\""+<% out.println("\""+session.getAttribute("username").toString()+"\""); %>;
                json += "\",\"msj\":\""+$('#msg').val()+"\",\"timestamp\":\""+Date()+"\"}";
                json += "";
                $('#msg').val("");
                $.post("http://localhost:8080/Proyecto/webresources/get",json,update);
            }
            update();
        </script>
    </head>
    <body>
        <br>
        <a href="logout.jsp">Salir</a>
        <br><br>
        <a href="perfil.jsp">Perfil</a>
        <br><br>
        <h1>
            <%
                String usuario = session.getAttribute("username").toString();
                out.println("Bienvenido "+usuario);
                %>
        </h1>
        <div style="overflow: scroll" name="div" id="div">
            <textarea name="area" id="area" style="width: 100%;height: 40vh">
                
            </textarea>
        </div>
        <input id="msg" name="msg">
        <button onclick="enviar()">Enviar</button>
    </body>
</html>
