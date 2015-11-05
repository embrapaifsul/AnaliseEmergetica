<%-- 
    Document   : Lv3-Passo3
    Created on : 29/10/2015, 16:21:10
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv3p1DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv3p2DAO"%>
<%@page import="modelo.Lv3p2"%>
<%
    Usuario u = new Usuario();
    Lv3p2DAO dao = new Lv3p2DAO ();
   Passos p = new Passos ();
    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    
    
    


    
    
    
    
    
  if(request.getParameter("combustivel") != null || request.getParameter("eletricidade") != null|| request.getParameter("materiaismanutencao") != null || request.getParameter("manutencao") != null||
     request.getParameter("impostos") != null || request.getParameter("servicosprivados") != null || request.getParameter("telefone") != null || request.getParameter("touro") != null ||
     request.getParameter("vacasinvernar") != null || request.getParameter("novilhos") != null || request.getParameter("vacinaovinos") != null || request.getParameter("vermifugosovinos") != null ||
     request.getParameter("vacinabovinos") != null || request.getParameter("vermifugosbovinos") != null || request.getParameter("vermifugosequinos") != null || request.getParameter("sementesaveia") != null ||
     request.getParameter("remedio") != null || request.getParameter("comida") != null || request.getParameter("planosaude") != null || request.getParameter("sementemilho") != null){
      
    Lv3p2 a = new Lv3p2 ();
    
    a.setCombustivel(Double.parseDouble(request.getParameter("combustivel")));
    a.setEletricidade(Double.parseDouble(request.getParameter("eletricidade")));
    a.setMateriaisManutencao(Double.parseDouble(request.getParameter("materiaismanutencao")));
    a.setManutencao(Double.parseDouble(request.getParameter("manutencao")));
    a.setImpostos(Double.parseDouble(request.getParameter("impostos")));
    a.setServicosPrivados(Double.parseDouble(request.getParameter("servicosprivados")));
    a.setTelefone(Double.parseDouble(request.getParameter("telefone")));
    a.setTouro(Double.parseDouble(request.getParameter("touro")));
    a.setVacasInvernar(Double.parseDouble(request.getParameter("vacasinvernar")));
    a.setNovilhos(Double.parseDouble(request.getParameter("novilhos")));
    a.setVacinaOvinos(Double.parseDouble(request.getParameter("vacinaovinos")));
    a.setVermifugosOvinos(Double.parseDouble(request.getParameter("vermifugosovinos")));
    a.setVacinaBovinos(Double.parseDouble(request.getParameter("vacinabovinos")));
    a.setVermifugosBovinos(Double.parseDouble(request.getParameter("vermifugosbovinos")));
    a.setVermifugoEquinos(Double.parseDouble(request.getParameter("vermifugosequinos")));
    a.setSementeAzevem(Double.parseDouble(request.getParameter("sementesaveia")));
    a.setRemedio(Double.parseDouble(request.getParameter("remedio")));
    a.setComida(Double.parseDouble(request.getParameter("comida")));
    a.setPlanoSaude(Double.parseDouble(request.getParameter("planosaude")));
    a.setSementeMilho(Double.parseDouble(request.getParameter("sementemilho")));
    a.setAno(p.getAno());
      
      Lv3p2 teste = new Lv3p2 ();
     
       teste = dao.buscar(p.getAno(), pro);
        if (teste == null) {
            dao.inserir(a);
        } else {
            dao.atualizar(a);
        }
        
        p.setLv3p2(a);
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
