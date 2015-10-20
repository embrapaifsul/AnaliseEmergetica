<%@page import="dao.Lv3p1DAO"%>
<%@page import="modelo.Lv3p1"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%  Usuario u = new Usuario();
    Passos p = new Passos();
    
      Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
      

    
    
    if(request.getParameter("descricao")!= null||
            request.getAttribute("categoria")!= null||
            request.getAttribute("vida")!= null||
            request.getAttribute("valor")!= null||
            request.getAttribute("valorm")!= null){
             
        Lv3p1 a = new Lv3p1();
        a.setDescricao(request.getParameter("descricao").toString());
        a.setCategoria(request.getParameter("categoria").toString());
        a.setVida(Integer.parseInt(request.getParameter("vida").toString()));
        a.setValor(Double.parseDouble(request.getParameter("valor").toString()));
        a.setValorm(Double.parseDouble(request.getParameter("valorm").toString()));
        
        Lv3p1DAO dao = new Lv3p1DAO();
        dao.inserir(a);
        p.setLv3p1(a);
        
        
    }
      
      
      
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
