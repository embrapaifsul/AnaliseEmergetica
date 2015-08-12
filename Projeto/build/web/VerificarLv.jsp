<%-- 
    Document   : VerificarLv
    Created on : 12/08/2015, 14:25:44
    Author     : Aluno
--%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Propriedade"%>
<%
    Propriedade pro = new Propriedade ();
    Passos p = new Passos();
    if (session.getAttribute("Usuario") != null) {
        pro = (Propriedade) session.getAttribute("Propriedade");
         p = new Passos();
         p.setAno(request.getParameter("data"));
         Lv1p1DAO dao = new Lv1p1DAO();
         
         
    } else {
        response.sendRedirect("index.jsp");
    }

%>

