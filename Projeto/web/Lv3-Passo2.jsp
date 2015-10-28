<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
      

    
    
        //Buscar a Lista na Session
    //Percorrer a lista, para cada item da lista adicionar no BD
    //limpar a session depreciacao
        
    List<Lv3p1> depreciacoes = new ArrayList<Lv3p1>();
    depreciacoes = (List<Lv3p1>)session.getAttribute("depreciacoes");
    Lv3p1DAO dao = new Lv3p1DAO();
    Boolean deucerto;
    for(Lv3p1 depreciacao:depreciacoes)
    {
    
        
       deucerto = dao.inserir(depreciacao);
    
        
        
    }
    
      session.setAttribute("depreciacoes", null);
      
      
    
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
