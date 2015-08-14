<%-- 
    Document   : Lv1-Passo3
    Created on : 28/04/2015, 16:03:33
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Calculos"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv1p2DAO"%>
<%@page import="modelo.Lv1p2"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv1p3DAO"%>
<%@page import="modelo.Lv1p3"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();

    String custo = "";
    if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv1p3() != null) {
            custo = p.getLv1p3().getReceita_anual().toString();
        }
    } else {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);

    }

    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

%>

<%    Lv1p2 e = new Lv1p2();
    Lv1p2DAO dao = new Lv1p2DAO();

    if (request.getParameter("vacasdecria") != null) {

        e.setPropiedade_id(pro.getId());

        if (request.getParameter("vacasdecria").equals("")) {

            e.setVacadecria(00);
        } else {
            e.setVacadecria(Integer.parseInt(request.getParameter("vacasdecria")));
        }

        if (request.getParameter("vacasdedescarte").equals("")) {
            e.setVacadedescarte(00);
        } else {
            e.setVacadedescarte(Integer.parseInt(request.getParameter("vacasdedescarte")));
        }

        if (request.getParameter("terneiros").equals("")) {
            e.setTerneiro(0);
        } else {
            e.setTerneiro(Integer.parseInt(request.getParameter("terneiros")));
        }

        if (request.getParameter("terneiras").equals("")) {
            e.setTerneira(0);
        } else {
            e.setTerneira(Integer.parseInt(request.getParameter("terneiras")));
        }

        if (request.getParameter("novilhos1").equals("")) {
            e.setNovilho1324(00);
        } else {
            e.setNovilho1324(Integer.parseInt(request.getParameter("novilhos1")));
        }

        if (request.getParameter("novilhas1").equals("")) {
            e.setNovilha1324(00);
        } else {
            e.setNovilha1324(Integer.parseInt(request.getParameter("novilhas1")));
        }

        if (request.getParameter("novilhos2").equals("")) {
            e.setNovilho2536(00);
        } else {
            e.setNovilho2536(Integer.parseInt(request.getParameter("novilhos2")));
        }

        if (request.getParameter("novilhas2").equals("")) {
            e.setNovilha2536(00);
        } else {
            e.setNovilha2536(Integer.parseInt(request.getParameter("novilhas2")));
        }

        if (request.getParameter("novilhos3").equals("")) {
            e.setNovilho36(0);
        } else {
            e.setNovilho36(Integer.parseInt(request.getParameter("novilhos3")));
        }

        if (request.getParameter("touros").equals("")) {
            e.setTouro(00);
        } else {
            e.setTouro(Integer.parseInt(request.getParameter("touros")));
        }

        e.setAno(p.getAno());

        dao.inserirNao(e);
        p.setLv1p2(e);

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

        <%@ include file="barranavegacao.jsp" %>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span11">
                    <section id="breadcrumbs">
                        <header class="page-header">
                            <h3> Progresso </h3>

                            <ul class="breadcrumb">
                                <li><a href="AnoLv1.jsp"> Data </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li class="alert-info"> Passo 3 </li><span class="divider"> / </span>
                                <li><a href="Lv1-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Saida.jsp"> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                    <span class="sr-only">60% Completo</span>
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

                    <h2> Receitas Anuais </h2>
                    <br/>

                    <form name="Passo3" action="Lv1-Passo4.jsp" class="form-horizontal" method ="post" onSubmit="return passo3();">
                        <div class="control-group">
                            <label class="control-label">Receita Anual de Bovinos:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="bovinosanual" value="<%=custo%>">
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
                                    <label class="control-label"><h6><b>Área média da Pecuária Aproveitavel: </b><span id="a"><%=p.getLv1p1().getArea_apro()%></span><span class="help-inline">Hectares</span></h6>
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
                                        <label class="control-label"><h6><b>Rebanho com atividade de Cria: </b><span id="a"><%=p.percentualcria()%></span><span class="help-inline">%</span></h6>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label"><h6><b>Lotação Média da Propriedade: </b><span id="b"><%=p.lotacaomedia()%></span><span class="help-inline">Cabeça(s) por hectare</span></h6>
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
