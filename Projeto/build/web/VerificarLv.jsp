<%-- 
    Document   : VerificarLv
    Created on : 12/08/2015, 14:25:44
    Author     : Aluno
--%>
<%@page import="modelo.Lv1p4"%>
<%@page import="dao.Lv1p4DAO"%>
<%@page import="modelo.Lv1p3"%>
<%@page import="dao.Lv1p3DAO"%>
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
        Lv1p2DAO dao2 = new Lv1p2DAO();
        Lv1p3DAO dao3 = new Lv1p3DAO();
        Lv1p4DAO dao4 = new Lv1p4DAO();
        
        Lv1p1 n11 = dao.buscar(p.getAno(), pro);
        Lv1p2 n12 = dao2.buscar(p.getAno(), pro);
        Lv1p3 n13 = dao3.buscar(p.getAno(), pro);
        Lv1p4 n14 = dao4.buscar(p.getAno(), pro);
        if (n11 != null) {
            //adiciona na session
            p.setLv1p1(n11);          
            } else {
                response.sendRedirect("Lv1-Passo1.jsp");
            }
            if (n12 != null) {
                p.setLv1p2(n12);
        } else {
            response.sendRedirect("Lv1-Passo2.jsp");
        }
            if (n13 != null){
               p.setLv1p3(n13);
            }else{                
                response.sendRedirect("Lv1-Passo3.jsp");                
            }
            
            if (n14 != null){
               p.setLv1p4(n14);
            }else{                
                response.sendRedirect("Lv1-Passo4.jsp");                
            }

    } else {
        response.sendRedirect("index.jsp");
    }

%>

