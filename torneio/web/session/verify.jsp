<%@page import="model.Jogador"%>
<%
    Jogador userSession = (Jogador) session.getAttribute("userSession");
    //out.print(userSession);
    if(userSession == null) {
        response.sendRedirect(request.getContextPath());
    }
%>