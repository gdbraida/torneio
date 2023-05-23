<%-- 
    Document   : cadastro
    Created on : 4 de mai. de 2023, 10:26:21
    Author     : QI
--%>
<%@page import="model.Mapa" %>
<%@include file="session/verify.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Mapa mapa = (Mapa)request.getAttribute("mapa");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edição</h1>
        
        <form action="MapaController" method="post">
            <input type="text" name="cod_mapa" value="<%= mapa.getIdMapa() %>" readonly>
            <br><br>
            
            <input type="text" name="nome_mapa" value="<%= mapa.getNome() %>" placeholder="Nome do mapa" required>
            <br><br>
            
            <select name="missao_mapa" required>
                <option value="<%= mapa.getMissao() %>"><%= mapa.getMissao() %></option>
                <option value="Deserto">Deserto</option>
                <option value="Praia">Praia</option>
                <option value="Selva">Selva</option>
                <option value="Cidade grande">Cidade grande</option>
                <option value="Caverna">Caverna</option>
            </select>
            <br><br>
            
             <select name="clima_mapa" required>
                <option value="<%= mapa.getClima() %>"><%= mapa.getClima() %></option>
                <option value="Ensolarado">Ensolarado</option>
                <option value="Chuvoso">Chuvoso</option>
                <option value="Nublado">Nublado</option>
                <option value="Chove não molha">Chove não molha</option>
                <option value="Torrando os pelo">Torrando os pelo</option>
            </select>
            <br><br>
            
            <input type="submit" value="Atualizar mapa">
            <input type="reset" value="Restaurar">
        </form>
        <br><br>
        <a href="home.jsp" title="Página inicial">Página inicial</a>
    </body>
</html>
