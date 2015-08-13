<%-- 
    Document   : Lv1-Passo1
    Created on : 28/04/2015, 16:00:56
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Lv1p1"%>


<%
    Usuario u = new Usuario();
    Passos p;
    String areapecuaria="";
    if (session.getAttribute("Passos") != null) {
        p = (Passos)session.getAttribute("Passos");
        if(p.getLv1p1() !=null)
        {
            areapecuaria = p.getLv1p1().getArea_apro().toString();
        }
    }
    else
    {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);
        
    }
    
    Propriedade pro = new Propriedade ();
    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    p.setAno(request.getParameter("data"));

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
                            <li><a>Propriedade: <%=pro.getNome()%></a></li>
                            <li><a></a></li>
                            <li><a>Ano: <%=p.getAno()%></a></li>
                            <li><a></a></li>
                            <li><a>Nivel: 1</a></li>
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

                <aside class="span11">
                    <section id="breadcrumbs">
                        <header class="page-header">
                            <h3> Progresso </h3>

                            <ul class="breadcrumb">
                                <li><a href="AnoLv1.jsp"> Data </a><span class="divider"> / </span></li>
                                <li class="alert-info"> Passo 1 </li><span class="divider"> / </span>
                                <li><a href="Lv1-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Saida.jsp"> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                                    <span class="sr-only">20% Completo</span>
                                </div>
                            </div>
                        </header>
                        
                    </section><br/><br/>
                </aside>

                <aside class="span2"></aside>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span1"></aside>

                <aside class="span6">
                    <h2> Informações </h2>
                    <br/>
                    <form name="Passo1" action="Lv1-Passo2.jsp" class="form-horizontal" method ="post" onSubmit="return passo1();">
                        <div class="control-group">
                            <label class="control-label">Área média da Pecuária Aproveitavel:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="areapecuaria" value="<%=areapecuaria%>">
                                <span class="help-inline">Hectares</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Proximo Passo" />
                            </div>
                        </div>
                    </form>               

                </aside>

                <aside class="span2">
                    <div class="panel-group">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h5 class="panel-title">Passo 1</h5>
                            </div>
                            <div class="panel-body">
                                <div class="control-group">
                                    <label class="control-label"><h6><b>Área média da Pecuária Aproveitavel: </b><span id="a"></span><span class="help-inline">Hectares</span></h6>
                                </div>
                                <br/><br/><br/><br/><br/>
                            </div>
                        </div>
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h5 class="panel-title">Passo 3</h5>
                            </div>
                            <div class="panel-body">
                                <div class="control-group">
                                    <label class="control-label"><h6><b>Receita por Hectare: </b><span id="c"></span><span class="help-inline">R$/Hectare</span></h6>
                                </div>
                                <br/><br/><br/><br/><br/>
                            </div>
                        </div>
                    </div>
                </aside>
                <aside class="span2">
                    <div class="panel-group">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h5 class="panel-title">Passo 2</h5>
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                                    <div class="control-group">
                                        <label class="control-label"><h6><b>Rebanho com atividade de Cria: </b><span id="a"></span><span class="help-inline">%</span></h6>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"><h6><b>Lotação Média da Propriedade: </b><span id="b"></span><span class="help-inline">Cabeça(s) por hectare</span></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="panel panel-danger">
                                <div class="panel-heading">
                                    <h5 class="panel-title">Passo 4</h5>
                                </div>
                                <div class="panel-body">
                                    <div class="control-group">
                                        <label class="control-label"><h6><b>Total dos Custos de Produção: </b><span id="d"></span><span class="help-inline">R$</span></h6>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"><h6><b>Custo de Atividade de Cria: </b><span id="e"></span><span class="help-inline">R$</span></h6>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"><h6><b>Custo de Produção por Hectar: </b><span id="f"></span><span class="help-inline">R$/Hectare</span></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                </aside>

            </div>
        </div>

    </body>

</html>