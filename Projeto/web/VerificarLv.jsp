<%-- 
    Document   : VerificarLv
    Created on : 12/08/2015, 14:25:44
    Author     : Aluno
--%>
<%@page import="modelo.Lv1p2"%>
<%@page import="dao.Lv1p2DAO"%>
<%@page import="modelo.Lv1p1"%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Propriedade"%>
<%
    Propriedade pro = new Propriedade();
    Passos p = new Passos();
    if (session.getAttribute("Usuario") != null) {
        pro = (Propriedade) session.getAttribute("Propriedade");
        p = new Passos();
        p.setAno(request.getParameter("data"));
        Lv1p1DAO dao = new Lv1p1DAO();
        Lv1p1 n11 = dao.buscar(p.getAno(), pro);
        if (n11 != null) {
            //adiciona na session
            p.setLv1p1(n11);
            Lv1p2DAO dao1 = new Lv1p2DAO();
            Lv1p2 n12 = dao1.buscar(p.getAno(), pro);
            if (n11 != null) {
                //adiciona na session
                p.setLv1p2(n12);
                /*
                 mesma coisa pro passo 2
                 */
            } else {
                response.sendRedirect("Lv1-Passo2.jsp");
            }
        } else {
            response.sendRedirect("Lv1-Passo1.jsp");
        }

    } else {
        response.sendRedirect("index.jsp");
    }

%>

