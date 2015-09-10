<%-- 
    Document   : VerificarLv
    Created on : 12/08/2015, 14:25:44
    Author     : Aluno
--%>

<%@page import="modelo.Lv2p4"%>
<%@page import="modelo.Lv2p3"%>
<%@page import="modelo.Lv2p2"%>
<%@page import="modelo.Lv2p1"%>
<%@page import="dao.Lv2p4DAO"%>
<%@page import="dao.Lv2p3DAO"%>
<%@page import="dao.Lv2p2DAO"%>
<%@page import="dao.Lv2p1DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Propriedade"%>
<%
    Propriedade pro = new Propriedade();
    Passos p = new Passos ();
    
    p.setAno(request.getParameter("data2"));
    session.setAttribute("Passos", p);
    
    if (session.getAttribute("Usuario") != null) {
        pro = (Propriedade) session.getAttribute("Propriedade");
        
        Lv2p1DAO dao = new Lv2p1DAO();
        Lv2p2DAO dao2 = new Lv2p2DAO();
        Lv2p3DAO dao3 = new Lv2p3DAO();
        Lv2p4DAO dao4 = new Lv2p4DAO();
        
        Lv2p1 n11 = dao.buscar(p.getAno(), pro);
        Lv2p2 n12 = dao2.buscar(p.getAno(), pro);
        Lv2p3 n13 = dao3.buscar(p.getAno(), pro);
        Lv2p4 n14 = dao4.buscar(p.getAno(), pro);
        
        
        if (n11 != null) {  
            p.setLv2p1(n11);
        
            if (n12 != null) {
                p.setLv2p2(n12);
                
                    if (n13 != null) {
                        p.setLv2p3(n13);
                        
                            if (n14 != null){
                                p.setLv2p4(n14);
                                response.sendRedirect("Lv2-Passo1.jsp"); 
                            }else{                
                                response.sendRedirect("Lv2-Passo4.jsp");                
                            }
                    } else {
                        response.sendRedirect("Lv2-Passo3.jsp");
                    }
            }else {
                response.sendRedirect("Lv2-Passo2.jsp");
            }
        } else {
            response.sendRedirect("Lv2-Passo1.jsp");
        }
                     

    } else {
        response.sendRedirect("index.jsp");
    }

%>


