<%@page import="dao.PropriedadeDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();

    String ano = "";

    String link1, link2, link3, link4, link5;
    link1 = "";
    link2 = "";
    link3 = "";
    link4 = "";
    link5 = "";

    if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getAno() != null) {
            ano = p.getAno();
        }
        if (p.getLv3p1() == null) {
            link1 = " class='inativo' ";
            link2 = " class='inativo' ";
            link3 = " class='inativo' ";
            link4 = " class='inativo' ";
            link5 = " class='inativo' ";

        } else {
            if (p.getLv3p2() == null) {
                link2 = " class='inativo' ";
                link3 = " class='inativo' ";
                link4 = " class='inativo' ";
                link5 = " class='inativo' ";

            } else {
                if (p.getLv1p3() == null) {
                    link3 = " class='inativo' ";
                    link4 = " class='inativo' ";
                    link5 = " class='inativo' ";

                } else {
                    if (p.getLv1p4() == null) {
                        link4 = " class='inativo' ";
                        link5 = " class='inativo' ";
                    }
                }
            }
        }

    } else {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);

        if (p.getLv3p1() == null) {
            link1 = " class='inativo' ";
            link2 = " class='inativo' ";
            link3 = " class='inativo' ";
            link4 = " class='inativo' ";
            link5 = " class='inativo' ";

        } else {
            if (p.getLv3p2() == null) {
                link2 = " class='inativo' ";
                link3 = " class='inativo' ";
                link4 = " class='inativo' ";
                link5 = " class='inativo' ";

            } else {
                if (p.getLv1p3() == null) {
                    link3 = " class='inativo' ";
                    link4 = " class='inativo' ";
                    link5 = " class='inativo' ";

                } else {
                    if (p.getLv1p4() == null) {
                        link4 = " class='inativo' ";
                        link5 = " class='inativo' ";
                    }
                }
            }
        }

    }

    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        if (request.getParameter("pid") != null) {
            pro.setId(Integer.parseInt(request.getParameter("pid")));
            PropriedadeDAO dao = new PropriedadeDAO();
            pro = dao.loginpro(pro);
            session.setAttribute("Propriedade", pro);
        }

    } else {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a  class="brand">Fazenda</a>

                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a>Nivel: 3</a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a href="InicioPropriedade.jsp">Usuario: <%=u.getLogin()%></a></li>
                        </ul>
                    </div>

                    <form action="index.jsp" class="navbar-form pull-right">
                        <button class="btn btn-inverse"> Sair </button>
                    </form>

                </div>
            </div>
        </nav>

        <header class="page-header"></header> 

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span6">
                    <section id="breadcrumbs">
                        <h3> Progresso </h3>

                        <div class="breadcrumb flat">
                            <a class="active"> Data </a>
                            <a href="Lv3-Passo1.jsp" <%=link1%>> Passo 1 </a>
                            <a href="Lv3-Passo2.jsp" <%=link2%>> Passo 2 </a>
                            <a href="Lv3-Passo3.jsp" <%=link3%>> Passo 3 </a>
                            <a href="Lv3-Passo4.jsp" <%=link4%>> Passo 4 </a>
                            <a href="Lv3-Saida.jsp" <%=link5%>> Resultados </a>
                        </div>

                    </section>                
                </aside>

                <aside class="span5">
                    <br/>
                    <br/>
                    <br/>
                    <div class="ficanaesquerda">
                        <h4>Propriedade: <%=pro.getNome()%></h4>
                    </div>
                </aside>

                <aside class="span1"></aside>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span11">
                    <section id="breadcrumbs">
                        <header class="page-header">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                    <span class="sr-only">0% Completo</span>
                                </div>
                            </div>
                    </section><br/>
                </aside>

            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span1"></aside>

                <aside class="span6">
                    <h2> Data </h2>
                    <br/>
                    <form name="AnoLv3" action="VerificarLv.jsp" class="form-horizontal" method ="post">
                        <div class="control-group">
                            <label class="control-label">Ano da Análise:</label>
                            <div class="controls">

                                <input type="number" name="data" value="<%=ano%>" required>
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

