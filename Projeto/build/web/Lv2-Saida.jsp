<%-- 
    Document   : Lv2-Saida
    Created on : 30/04/2015, 15:34:23
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv2p4DAO"%>
<%@page import="modelo.Lv2p4"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

%>
<%    Lv2p4 d = new Lv2p4();

    d.setMedicamento(Double.parseDouble(request.getParameter("medicamentos")));
    d.setCarrapaticida(Double.parseDouble(request.getParameter("carrapaticidas")));
    d.setSal(Double.parseDouble(request.getParameter("sal")));
    d.setRacao(Double.parseDouble(request.getParameter("racoes")));
    d.setCompradebovinos(Double.parseDouble(request.getParameter("comprabovinos")));
    d.setUntesilosdeusogeral(Double.parseDouble(request.getParameter("utensilios")));
    d.setSemem(Double.parseDouble(request.getParameter("semen")));
    d.setMaodeobrafixa(Double.parseDouble(request.getParameter("maodeobrafixa")));
    d.setMaodeobravariavel(Double.parseDouble(request.getParameter("maodeobravariavel")));
    d.setSemente(Double.parseDouble(request.getParameter("sementes")));
    d.setDefensivoagriparapastagem(Double.parseDouble(request.getParameter("defensivospastagens")));
    d.setAdubosparapastagem(Double.parseDouble(request.getParameter("adubos")));
    d.setCombustivel(Double.parseDouble(request.getParameter("combustiveis")));
    d.setReparosmaquina(Double.parseDouble(request.getParameter("reparomaquinas")));
    d.setReparobanfeitoria(Double.parseDouble(request.getParameter("reparosbemfeitorias")));
    d.setFrete(Double.parseDouble(request.getParameter("fretes")));
    d.setArrendamentocamponativo(Double.parseDouble(request.getParameter("arrendamentosnativo")));
    d.setArrendamentopastagemcultivada(Double.parseDouble(request.getParameter("arrendamentoscultivadas")));
    d.setImposto(Double.parseDouble(request.getParameter("impostos")));
    d.setOutradespesas(Double.parseDouble(request.getParameter("outras")));
    d.setPropriedade_id(pro.getId());
    d.setAno(p.getAno());

    Lv2p4DAO dao = new Lv2p4DAO();
    dao.inserir(d);
    p.setLv2p4(d);
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
                                <li><a href="AnoLv2.jsp"> Data </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                                <li class="active"> Resultados </li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                    <span class="sr-only">100% Completo</span>
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

                <aside class="span3"></aside>

                <aside class="span9">

                    <h2> Custo de Produção </h2>
                    <br/>

                    <form name="Passo4" action="InicioPropriedade.jsp" class="form-horizontal" method ="post" onSubmit="return passo4();">
                        <div class="control-group">
                            <label class="control-label">Área Média da Pecuária:</label>
                            <div class="controls">
                                <input type="text" name="areamedia" class="uneditable-input" value="<%=p.areamedia()%>">
                                <span class="help-inline">Hectare</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Área Aproveitável da propriedade:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="areaaproveitavel" class="uneditable-input" value="<%=p.areaaproveitavel()%>">
                                <span class="help-inline">Hectare</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Percentual do Rebanho com atividade de Cria:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="percentualrebanho" class="uneditable-input" value="<%=p.percentualrebanhocomcria()%>">
                                <span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Lotação Média da Propriedade:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="lotaçaomedia"  class="uneditable-input" value="<%=p.lotacaomedia2()%>">
                                <span class="help-inline">Cabeça(s) por hectare</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Receita Total das Atividades:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="receitaatividades"  class="uneditable-input" value="<%=p.totalreceita()%>">
                                <span class="help-inline">R$</span>     
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Receita por Hectare:</label>
                            <div class="controls">
                                <input type="text" name="receitahectare"  class="uneditable-input" value="<%=p.receitahectar2()%>">
                                <span class="help-inline">R$/Hectare</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Total dos Custos de Produção:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="totalproduçao"  class="uneditable-input" value="<%=p.custotalproducao()%>">
                                <span class="help-inline">R$</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Custo de Atividade de Cria:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="custocria"  class="uneditable-input" value="<%=p.custoatividadecria1()%>">
                                <span class="help-inline">R$</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Custo de Produção por Hectar:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="custohectar"  class="uneditable-input" value="<%=p.custoproducaohectar1()%>">
                                <span class="help-inline">R$/Hectare</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Custo de Produção por Terneiro(a) Desmamado:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="custodesmamado"  class="uneditable-input" value="<%=p.custoterneiro()%>">
                                <span class="help-inline">R$/Terneiro(a)</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Ir Para o Inicio" />
                            </div>
                        </div>
                    </form>               

                </aside>

            </div>
        </div>
        <footer class="footer">
            <div class="container">
            </div>
        </footer>
    </body>
</html>
