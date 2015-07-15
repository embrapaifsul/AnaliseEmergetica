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
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null  ){
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
%>

<%    Lv1p2 e = new Lv1p2();
    Lv1p2DAO dao = new Lv1p2DAO();
    
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
                                <li><a href="AnoLv1.jsp"> Data </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li class="alert-error"> Passo 3 </li><span class="divider"> / </span>
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
                                <input type="text" name="bovinosanual">
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Proximo Passo" />
                            </div>
                        </div>
                    </form>               

                </aside>

                <jsp:include page="bootstrap/resultado.jsp" >
                    <jsp:param name="passo" value="3" />

                </jsp:include>


                <aside class="span2"></aside>  

            </div>
        </div>

    </body>

</html>
