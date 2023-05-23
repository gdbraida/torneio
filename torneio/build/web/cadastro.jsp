<%-- 
    Document   : cadastro
    Created on : 4 de mai. de 2023, 10:26:21
    Author     : QI
--%>

<%@include file="session/verify.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro</h1>
        <h2>Novo mapa</h2>
        <form action="MapaController" method="post">
            <input type="text" name="nome" placeholder="Nome do jogador" required>
            <br><br>
            
            <input type="text" name="apelido" placeholder="Apelido do jogador" required>
            <br><br>
            
            <input type="password" name="senha" placeholder="Senha" required>
            <br><br>
            
            <input type="submit" value="Salvar dados">
        </form>
        <br><br>
        <a href="home.jsp" title="Página inicial">Página inicial</a>
    </body>
</html>
