<%-- 
    Document   : ExcluirPropriedade
    Created on : 01/06/2015, 14:56:03
    Author     : Renan
--%>

<%@page import="dao.Lv2p4DAO"%>
<%@page import="modelo.Lv2p4"%>
<%@page import="dao.Lv2p3DAO"%>
<%@page import="modelo.Lv2p3"%>
<%@page import="modelo.Lv2p2"%>
<%@page import="dao.Lv2p2DAO"%>
<%@page import="dao.Lv2p1DAO"%>
<%@page import="modelo.Lv2p1"%>
<%@page import="dao.Lv1p4DAO"%>
<%@page import="modelo.Lv1p4"%>
<%@page import="dao.Lv1p3DAO"%>
<%@page import="modelo.Lv1p3"%>
<%@page import="dao.Lv1p2DAO"%>
<%@page import="modelo.Lv1p2"%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Lv1p1"%>
<%@page import="dao.PropriedadeDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = new Usuario();

    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
    } else {
        response.sendRedirect("index.jsp");
    }

    String msg = null;

    if (request.getParameter("pid") == null) {
        msg = "Item não enviado";
    } else {
        
        Lv1p1 lv1p1 = new Lv1p1();
        Lv1p1DAO lv1p1DAO = new Lv1p1DAO(); 
        lv1p1.setPropiedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret1 = lv1p1DAO.excluir(lv1p1);
        
        Lv1p2 lv1p2 = new Lv1p2();
        Lv1p2DAO lv1p2DAO = new Lv1p2DAO();
        lv1p2.setPropiedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret2 = lv1p2DAO.excluir(lv1p2);
        
        Lv1p3 lv1p3 = new Lv1p3();
        Lv1p3DAO lv1p3DAO = new Lv1p3DAO();
        lv1p3.setPropiedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret3 = lv1p3DAO.excluir(lv1p3);
        
        Lv1p4 lv1p4 = new Lv1p4();
        Lv1p4DAO lv1p4DAO = new Lv1p4DAO();
        lv1p4.setPropiedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret4 = lv1p4DAO.excluir(lv1p4);
        
        Lv2p1 lv2p1 = new Lv2p1();
        Lv2p1DAO lv2p1DAO = new Lv2p1DAO(); 
        lv2p1.setPropriedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret11 = lv2p1DAO.excluir(lv2p1);
        
        Lv2p2 lv2p2 = new Lv2p2();
        Lv2p2DAO lv2p2DAO = new Lv2p2DAO();
        lv2p2.setPropriedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret22 = lv2p2DAO.excluir(lv2p2);
        
        Lv2p3 lv2p3 = new Lv2p3();
        Lv2p3DAO lv2p3DAO = new Lv2p3DAO();
        lv2p3.setPropriedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret33 = lv2p3DAO.excluir(lv2p3);
        
        Lv2p4 lv2p4 = new Lv2p4();
        Lv2p4DAO lv2p4DAO = new Lv2p4DAO();
        lv2p4.setPropriedade_id(Integer.parseInt(request.getParameter("pid")));
        Boolean ret44 = lv2p4DAO.excluir(lv2p4);
        
        PropriedadeDAO dao = new PropriedadeDAO();
        Propriedade pro = new Propriedade();
        pro.setId(Integer.parseInt(request.getParameter("pid")));
        Boolean ret = dao.excluir(pro);
        
        if (ret == true 
              //  && ret1 == true
              //  && ret2 == true
              //  && ret3 == true
              //  && ret4 == true
              //  && ret11 == true
              //  && ret22 == true
              //  && ret33 == true
              //  && ret44 == true
           ) {
            msg = "Excluido com Sucesso";
        } else {
            msg = "Erro ao Excluir";
        }
    }


%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8"/>
        <meta name="description" content="Fazenda"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <title>Fazenda</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css">
        <link rel="stylesheet" href="bootstrap/style.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="bootstrap/TesteJavaScript.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-fixed-top navbar-inverse">
            <div class="navbar-inner">
                <div class="container">
                    <!-- .btn-navbar está classe é usada como alternador para o conteudo coplapsavel-->
                    <button class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="Inicio.jsp" class="brand">Fazenda</a>

                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a href="index.jsp"> Usuario </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span4">
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                    <p class="alert-error"><%=msg%></p>
                    <a href = "index.jsp">Voltar para Listagem</a><br/>
                </aside>

                <aside class="span8">
                    <h1>Exclusão Propriedade</h1>
                </aside>

            </div>
        </div>
    </body>
</html>
