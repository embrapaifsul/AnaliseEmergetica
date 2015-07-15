<%-- 
    Document   : Lv1-Passo2
    Created on : 28/04/2015, 16:00:25
    Author     : Aluno
--%>



<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Lv1p1"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv1p2DAO"%>
<%@page import="modelo.Lv1p2"%>
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
<%    Lv1p1 lv1p1 = new Lv1p1();
    lv1p1.setArea_apro(Double.parseDouble(request.getParameter("areapecuaria")));
    lv1p1.setAno(p.getAno());
    lv1p1.setPropiedade_id(pro.getId());

    Lv1p1DAO dao = new Lv1p1DAO();
    dao.inserir(lv1p1);
    p.setLv1p1(lv1p1);
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
        <script>
            function calcular()
            {
                var rebanho = document.getElementById('rebanho');
                var cria = document.getElementById('cria');
                var vacasdecria =  document.getElementById('vacasdecria');
                var vacasdedescarte = document.getElementById('vacasdedescarte');
                var terneiros = document.getElementById('terneiros');
                var terneiras = document.getElementById('terneiras');
                var novilhos1 = document.getElementById('novilhos1');
                var novilhas1 = document.getElementById('novilhas1');
                var novilhos2 = document.getElementById('novilhos2');
                var novilhas2 = document.getElementById('novilhas2');
                var novilhos3 = document.getElementById('novilhos3');
                var touros = document.getElementById('touros');
                
                
                rebanho.innerHTML = parseInt(vacasdecria.value) +
                        parseInt(vacasdedescarte.value) +
                        parseInt(terneiros.value) +
                        parseInt(terneiras.value) +
                        parseInt(novilhos1.value) +
                        parseInt(novilhas1.value) +
                        parseInt(novilhos2.value) +
                        parseInt(novilhas2.value) +
                        parseInt(novilhos3.value) +
                        parseInt(touros.value);


                cria.innerHTML = parseInt(vacasdecria.value) +
                        parseInt(vacasdedescarte.value) +
                        parseInt(terneiros.value) +
                        parseInt(terneiras.value) +
                        parseInt(touros.value);
            }

        </script>
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
                                <li class="alert-error"> Passo 2 </li><span class="divider"> / </span>
                                <li><a href="Lv1-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Saida.jsp"> Resultados </a></li>
                            </ul>
                            
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                    <span class="sr-only">40% Completo</span>
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
                    <h2> Rebanho Bovino </h2>
                    <br/>

                    <form name="passo2" action="Lv1-Passo3.jsp" class="form-horizontal" method ="post" onSubmit="return passo2();">
                        <div class="control-group">
                            <label class="control-label">Vacas de Cria:</label>
                            <div class="controls">
                                <input type="text" name="vacasdecria" id="vacasdecria">
                            </div> 
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas de Descarte:</label>
                            <div class="controls">
                                <input type="text" name="vacasdedescarte" id="vacasdedescarte">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Terneiros:</label>
                            <div class="controls">
                                <input type="text" name="terneiros" id="terneiros">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Terneiras:</label>
                            <div class="controls">
                                <input type="text" name="terneiras" id="terneiras">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos 13-24:</label>
                            <div class="controls">
                                <input type="text" name="novilhos1" id="novilhos1">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhas 13-24:</label>
                            <div class="controls">
                                <input type="text" name="novilhas1" id="novilhas1">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos 25-36:</label>
                            <div class="controls">
                                <input type="text" name="novilhos2" id="novilhos2">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhas 25-36:</label>
                            <div class="controls">
                                <input type="text" name="novilhas2" id="novilhas2">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos > 36:</label>
                            <div class="controls">
                                <input type="text" name="novilhos3" id="novilhos3">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Touros:</label>
                            <div class="controls">
                                <input type="text" name="touros" id="touros">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><b>TOTAL REBANHO BOVINO:</b></label>
                            <div class="controls">
                                <br/>
                                <span class="uneditable-input" name="rebanho" id="rebanho" ></span> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><b>TOTAL REBANHO COM ATIVIDADE DE CRIA :</b></label>
                            <div class="controls">
                                <br/>
                                <span class="uneditable-input" name="cria" id="cria" ></span> 
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="button" onclick="calcular();" class="btn" value="Calcular" />
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
                    <jsp:param name="passo" value="2" />

                </jsp:include>


                <aside class="span2"></aside>

            </div>
        </div>

    </body>
</html>
