<%-- 
    Document   : home
    Created on : 27 de abr. de 2023, 09:43:38
    Author     : QI
--%>

<%@include file="session/verify.jsp" %>

<%@page import="model.Jogador" %>
<%
    Jogador u = (Jogador)session.getAttribute("userSession");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game</title>
    </head>
    <body>
        <p>
            <button type="button" onclick="window.location.href='session/logout.jsp'">Logout</button>
            Bem vindo <%=
                            (u != null)
                            ?  u.getApelido()
                            : "visitante"
                        %>!
        </p>
        <main>
            <button onclick="window.location.href='cadastro.jsp'">Cadastrar</button>
            <button onclick="window.location.href='lista.jsp'">Listar</button>
        </main>
    </body>
</html>
