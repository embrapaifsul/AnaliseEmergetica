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
    
    String vacasdecria="";
    String vacasdedescarte="";
    String terneiros="";
    String terneiras="";
    String novilhos1="";
    String novilhos2="";
    String novilhos3="";
    String novilhas1="";
    String novilhas2="";
    String touros="";
    
    if (session.getAttribute("Passos") != null) {
        p = (Passos)session.getAttribute("Passos");
        if(p.getLv1p2() !=null)
        {
            vacasdecria = p.getLv1p2().getVacadecria().toString();
            vacasdedescarte = p.getLv1p2().getVacadedescarte().toString();
            terneiros = p.getLv1p2().getTerneiro().toString();
            terneiras = p.getLv1p2().getTerneira().toString();
            novilhos1 = p.getLv1p2().getNovilho1324().toString();
            novilhos2 = p.getLv1p2().getNovilho2536().toString();
            novilhos3 = p.getLv1p2().getNovilho36().toString();
            novilhas1 = p.getLv1p2().getNovilha1324().toString();
            novilhas2 = p.getLv1p2().getNovilha2536().toString();
            touros = p.getLv1p2().getTouro().toString();
        }
    }
    else
    {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);
        
    }
    
    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null  ){
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

%>
<%  
    if(request.getParameter("areapecuaria")!=null)
    {
        Lv1p1 lv1p1 = new Lv1p1();
        lv1p1.setArea_apro(Double.parseDouble(request.getParameter("areapecuaria")));
        lv1p1.setAno(p.getAno());
        lv1p1.setPropiedade_id(pro.getId());

        Lv1p1DAO dao = new Lv1p1DAO();
        dao.inserir(lv1p1);
        p.setLv1p1(lv1p1);
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
                                <li class="alert-info"> Passo 2 </li><span class="divider"> / </span>
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
                            <label class="control-label">&nbsp;</label>
                            <div class="controls">
                                <div class="nomeio">MACHOS</div>
                                 <div class="nomeio"> FEMEAS</div>
                            </div> 
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas de Cria:</label>
                            <div class="controls">
                                <span class="uneditable-input"></span> 
                                <input type="text" name="vacasdecria" id="vacasdecria" value="<%=vacasdecria%>">
                            </div> 
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas de Descarte:</label>
                            <div class="controls">
                                <span class="uneditable-input"></span> 
                                <input type="text" name="vacasdedescarte" id="vacasdedescarte" value="<%=vacasdedescarte%>">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Terneiros(as):</label>
                            <div class="controls">
                                <input type="text" name="terneiros" id="terneiros" value="<%=terneiros%>">
                                <input type="text" name="terneiras" id="terneiras" value="<%=terneiras%>">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">De 13 á 24 meses:</label>
                            <div class="controls">
                                <input type="text" name="novilhos1" id="novilhos1" value="<%=novilhos1%>">
                                <input type="text" name="novilhas1" id="novilhas1" value="<%=novilhas1%>">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">De 25 á 36 meses:</label>
                            <div class="controls">
                                <input type="text" name="novilhos2" id="novilhos2" value="<%=novilhos2%>">
                                <input type="text" name="novilhas2" id="novilhas2" value="<%=novilhas2%>">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mais de 36 meses:</label>
                            <div class="controls">
                                <input type="text" name="novilhos3" id="novilhos3" value="<%=novilhos3%>">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Touros:</label>
                            <div class="controls">
                                <input type="text" name="touros" id="touros" value="<%=touros%>">
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
