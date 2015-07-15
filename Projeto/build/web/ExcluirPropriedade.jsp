<%-- 
    Document   : ExcluirPropriedade
    Created on : 01/06/2015, 14:56:03
    Author     : Renan
--%>

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
        PropriedadeDAO dao = new PropriedadeDAO();
        Propriedade pro = new Propriedade();
        pro.setId(Integer.parseInt(request.getParameter("pid")));
        Boolean ret = dao.excluir(pro);
        if (ret == true) {
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
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                    <p><%=msg%></p>
                    <a href = "InicioPropriedade.jsp">Voltar para Listagem</a><br/>
                </aside>

                <aside class="span8">
                    <h1>Exclusão Propriedade</h1>
                </aside>

            </div>
        </div>

        <footer class="footer">
            <div class="container"></div>
        </footer>   

    </body>
</html>
