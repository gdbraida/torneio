<%-- 
    Document   : lista
    Created on : 4 de mai. de 2023, 10:26:28
    Author     : QI
--%>

<%@page import="model.JogadorDAO" %>
<%@page import="model.Jogador" %>
<%@include file="session/verify.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game</title>
    </head>
    <body>
        <h1>Lista</h1>
            <table>
                <thead>
                    <th>ID</th>
                    <th>NOME</th>
                    <th>MISSÃO</th>
                    <th>CLIMA</th>
                    <th></th>
                    <th></th>
                </thead>
                <tbody>
            
        <%
                JogadorDAO jogadorDao = new JogadorDAO();
                
                //Para cada elemento da lista (jogadorDao.listJogador)
                //chame-o de "item"
                for(Jogador item : jogadorDao.listJogador()){
                    %>
                  <tr>
                    <td><%= item.getIdJogador() %></td>
                    <td><%= item.getNome()%></td>
                    <td><%= item.getApelido()%></td>
                    <td><%= item.getSenha()%></td>
                    <td>
                        <a href="JogadorUpdate?cod=<%= item.getIdJogador() %>"  >📝</a>
                    </td>
                    <td>
                        <a onclick="confirmaDelete(<%= item.getIdJogador() %>)">❌</a>
                    </td>
                  </tr>
               <%
                }
           %>
                </tbody>
           </table>
        <hr>
        <a href="home.jsp" title="Página inicial">Página inicial</a>
    
    <script>
        function confirmaDelete(id){
            if(confirm("Deseja realmente excliur?")){
                window.location.replace("JogadorDelete?cod=" + id);
            } else {
                alert("Exclusão cancelada.");
            }
        }
      </script>
        
    </body>
</html>
