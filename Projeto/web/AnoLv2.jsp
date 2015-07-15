<%-- 
    Document   : Lv1-Passo1
    Created on : 28/04/2015, 16:00:56
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.Lv2p1DAO"%>
<%@page import="modelo.Lv2p1"%>


<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
    
    if (session.getAttribute("Usuario") != null) 
    {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    }
    else 
    {
        response.sendRedirect("index.jsp");
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
                    <!-- .btn-navbar est� classe � usada como alternador para o conteudo coplapsavel-->
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
                            <li><a>Propriedade: <%=pro.getNome()%></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a href="index.jsp">Usuario: <%=u.getLogin()%></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <header class="page-header"></header>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span10">
                    <section id="breadcrumbs">
                        <header class="page-header">
                            <h3> Progresso </h3>
                            <ul class="breadcrumb">
                                <li class="active"> Data <span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Saida.jsp"> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                    <span class="sr-only">0% Completo</span>
                                </div>
                            </div>
                        </header>
                    </section><br/><br/>
                </aside>
                <aside class="span2"><p></aside>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span1"></aside>

                <aside class="span6">
                    <h2> Data </h2>
                    <br/>
                    <form name="AnoLv2" action="Lv2-Passo1.jsp" class="form-horizontal" method ="post">
                        <div class="control-group">
                            <label class="control-label">Ano das Informa��es:</label>
                            <div class="controls">
                                
                                <input type="text" name="data">
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Proximo Passo" />
                            </div>
                        </div>
                    </form>               

                </aside>

                <aside class="span2"><p></aside>

            </div>
        </div>

    </body>
    
</html>

