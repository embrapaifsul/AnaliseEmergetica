<%-- 
    Document   : VerificarLv3
    Created on : 15/10/2015, 15:37:42
    Author     : Aluno
--%>

<%@page import="modelo.Lv3p2"%>
<%@page import="modelo.Lv3p1"%>

<%@page import="dao.Lv3p2DAO"%>
<%@page import="dao.Lv3p1DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Propriedade"%>
<%
    Propriedade pro = new Propriedade();
    Passos p = new Passos();

    p.setAno(request.getParameter("data2"));
    session.setAttribute("Passos", p);

    if (session.getAttribute("Usuario") != null) {
        pro = (Propriedade) session.getAttribute("Propriedade");

        Lv3p1DAO dao = new Lv3p1DAO();
        Lv3p2DAO dao2 = new Lv3p2DAO();
        

        Lv3p1 n11 = dao.buscar(p.getAno(), pro);
        Lv3p2 n12 = dao2.buscar(p.getAno(), pro);
        

        if (n11 != null) {
            p.setLv3p1(n11);

            if (n12 != null) {
                p.setLv3p2(n12);
          
            } else {
                response.sendRedirect("Lv3-Passo2.jsp");
            }
        } else {
            response.sendRedirect("Lv3-Passo1.jsp");
        }

    } else {
        response.sendRedirect("index.jsp");
    }

%>


