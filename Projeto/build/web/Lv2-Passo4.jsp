<%-- 
    Document   : Lv2-Passo4
    Created on : 30/04/2015, 15:34:10
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Lv2p3"%>
<%@page import="dao.Lv2p3DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv2p4DAO"%>
<%@page import="modelo.Lv2p4"%>
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
<%    Lv2p3 c = new Lv2p3();
    c.setTerneiroquant(Integer.parseInt(request.getParameter("terneiros1")));
    c.setTerneirovalor(Double.parseDouble(request.getParameter("terneiros2")));

    c.setTerneiraquant(Integer.parseInt(request.getParameter("terneiras1")));
    c.setTerneiravalor(Double.parseDouble(request.getParameter("terneiras2")));

    c.setNovilhaquant(Integer.parseInt(request.getParameter("novilhas1")));
    c.setNovilhavalor(Double.parseDouble(request.getParameter("novilhas2")));

    c.setVacadedescartequant(Integer.parseInt(request.getParameter("vacdescarte1")));
    c.setVacadedescartevalor(Double.parseDouble(request.getParameter("vacdescarte2")));

    c.setVacaprenhasquant(Integer.parseInt(request.getParameter("vacprenha1")));
    c.setVacaprenhavalor(Double.parseDouble(request.getParameter("vacprenha2")));

    c.setVacacomcriaquant(Integer.parseInt(request.getParameter("vaccria1")));
    c.setVacacomcriavalor(Double.parseDouble(request.getParameter("vaccria2")));

    c.setVacagordaquant(Integer.parseInt(request.getParameter("vacgorda1")));
    c.setVacagordavalor(Double.parseDouble(request.getParameter("vacgorda2")));

    c.setNovilhorecriaquant(Integer.parseInt(request.getParameter("novilhosrecria1")));
    c.setNovilhorecriavalor(Double.parseDouble(request.getParameter("novilhosrecria2")));

    c.setNovilhogordoquant(Integer.parseInt(request.getParameter("novilhosgordos1")));
    c.setNovilhogordovalor(Double.parseDouble(request.getParameter("novilhosgordos2")));

    c.setTorunosquant(Integer.parseInt(request.getParameter("torunos1")));
    c.setTorunovalor(Double.parseDouble(request.getParameter("torunos2")));

    c.setTouroquant(Integer.parseInt(request.getParameter("touros1")));
    c.setTourovalor(Double.parseDouble(request.getParameter("touros2")));

    c.setPropriedade_id(pro.getId());
    c.setAno(p.getAno());

    Lv2p3DAO dao = new Lv2p3DAO();
    dao.inserir(c);
    p.setLv2p3(c);
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
            function calcularValor()
            {
                if(medicamentos.value == "")
                {
                    medicamentos.focus();
                }
                else if(carrapaticidas.value == "")
                {
                    carrapaticidas.focus();
                }
                else if(sal.value == "")
                {
                    sal.focus();
                }
                else if(racoes.value == "")
                {
                    racoes.focus();
                }
                else if(comprabovinos.value == "")
                {
                    comprabovinos.focus();
                }
                else if(utensilios.value == "")
                {
                    utensilios.focus();
                }
                else if(semen.value == "")
                {
                    semen.focus();
                }
                else if(maodeobrafixa.value == "")
                {
                    maodeobrafixa.focus();
                }
                else if(maodeobravariavel.value == "")
                {
                    maodeobravariavel.focus();
                }
                else if(sementes.value == "")
                {
                    sementes.focus();
                }
                else if(defensivospastagens.value == "")
                {
                    defensivospastagens.focus();
                }
                else if(adubos.value == "")
                {
                    adubos.focus();
                }
                else if(combustiveis.value == "")
                {
                    combustiveis.focus();
                }
                else if(reparomaquinas.value == "")
                {
                    reparomaquinas.focus();
                }
                else if(reparosbemfeitorias.value == "")
                {
                    reparosbemfeitorias.focus();
                }
                else if(fretes.value == "")
                {
                    fretes.focus();
                }
                else if(arrendamentosnativo.value == "")
                {
                    arrendamentosnativo.focus();
                }
                else if(arrendamentoscultivadas.value == "")
                {
                    arrendamentoscultivadas.focus();
                }
                else if(impostos.value == "")
                {
                    impostos.focus();
                }
                else if(outras.value == "")
                {
                    outras.focus();
                }
                
                totalizando.innerHTML = parseInt(medicamentos.value) +
                                  parseInt(carrapaticidas.value) +
                                  parseInt(sal.value) +
                                  parseInt(racoes.value) +
                                  parseInt(comprabovinos.value) +
                                  parseInt(utensilios.value) +
                                  parseInt(semen.value) +
                                  parseInt(maodeobrafixa.value) +
                                  parseInt(maodeobravariavel.value) +
                                  parseInt(sementes.value) +
                                  parseInt(defensivospastagens.value) +
                                  parseInt(adubos.value) +
                                  parseInt(combustiveis.value) +
                                  parseInt(reparomaquinas.value) +
                                  parseInt(reparosbemfeitorias.value) +
                                  parseInt(fretes.value) +
                                  parseInt(arrendamentoscultivadas.value) +
                                  parseInt(impostos.value) +
                                  parseInt(outras.value) +
                                  parseInt(arrendamentosnativo.value);
                          
               medicamentos2.innerHTML = (parseInt(medicamentos.value) * 100) / totalizando.innerHTML;
               carrapaticidas2.innerHTML = (parseInt(carrapaticidas.value) * 100) / totalizando.innerHTML;
               sal2.innerHTML = (parseInt(sal.value) * 100) / totalizando.innerHTML;
               racoes2.innerHTML = (parseInt(racoes.value) * 100) / totalizando.innerHTML;
               comprabovinos2.innerHTML = (parseInt(comprabovinos.value) * 100) / totalizando.innerHTML;
               utensilios2.innerHTML = (parseInt(utensilios.value) * 100) / totalizando.innerHTML;
               semen2.innerHTML = (parseInt(semen.value) * 100) / totalizando.innerHTML;
               maodeobrafixa2.innerHTML = (parseInt(maodeobrafixa.value) * 100) / totalizando.innerHTML;
               maodeobravariavel2.innerHTML = (parseInt(maodeobravariavel.value) * 100) / totalizando.innerHTML;
               sementes2.innerHTML = (parseInt(sementes.value) * 100) / totalizando.innerHTML;
               defensivospastagens2.innerHTML = (parseInt(defensivospastagens.value) * 100) / totalizando.innerHTML;
               adubos2.innerHTML = (parseInt(adubos.value) * 100) / totalizando.innerHTML;
               reparomaquinas2.innerHTML = (parseInt(reparomaquinas.value) * 100) / totalizando.innerHTML;
               reparosbemfeitorias2.innerHTML = (parseInt(reparosbemfeitorias.value) * 100) / totalizando.innerHTML;
               fretes2.innerHTML = (parseInt(fretes.value) * 100) / totalizando.innerHTML;
               arrendamentoscultivadas2.innerHTML = (parseInt(arrendamentoscultivadas.value) * 100) / totalizando.innerHTML;
               impostos2.innerHTML = (parseInt(impostos.value) * 100) / totalizando.innerHTML;
               outras2.innerHTML = (parseInt(outras.value) * 100) / totalizando.innerHTML;
               arrendamentosnativo2.innerHTML = (parseInt(arrendamentosnativo.value) * 100) / totalizando.innerHTML;
               
               
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
                                <li class="active"> Passo 4 <span class="divider"> / </span></li>
                                <li><a href="Lv2-Saida.jsp"> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                    <span class="sr-only">80% Completo</span>
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

                <aside class="span11">

                    <h2> Custo de Produção </h2>
                    <br/>

                    <form name="" action="Lv2-Saida.jsp" class="form-horizontal" method ="post" onSubmit="return passo4();">
                        <div class="control-group">
                            <label class="control-label">Medicamentos e Vacinas:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="medicamentos" id="medicamentos" placeholder="Valor em R$(ANO)" required>
                                <span name="medicamentos2" id="medicamentos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Carrapaticidas:</label>
                            <div class="controls">
                                <input type="text" name="carrapaticidas" id="carrapaticidas" placeholder="Valor em R$(ANO)" required>
                                <span name="carrapaticidas2" id="carrapaticidas2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sal Comum e Mineral:</label>
                            <div class="controls">

                                <input type="text" name="sal" id="sal" placeholder="Valor em R$(ANO)" required>
                                <span name="sal2" id="sal2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Rações:</label>
                            <div class="controls">
                                <input type="text" name="racoes" id="racoes" placeholder="Valor em R$(ANO)" required>
                                <span name="racoes2" id="racoes2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Compra de Bovinos:</label>
                            <div class="controls">
                                <input type="text" name="comprabovinos" id="comprabovinos"  placeholder="Valor em R$(ANO)" required>
                                <span name="comprabovinos2" id="comprabovinos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Utensílios de uso geral:</label>
                            <div class="controls">
                                <input type="text" name="utensilios" id="utensilios"  placeholder="Valor em R$(ANO)" required>
                                <span name="utensilios2" id="utensilios2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sêmen e material para inseminação artificial:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="semen" id="semen"  placeholder="Valor em R$(ANO)" required>
                                <span name="semen2" id="semen2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-de-obra Fixa:</label>
                            <div class="controls">
                                <input type="text" name="maodeobrafixa" id="maodeobrafixa"  placeholder="Valor em R$(ANO)" required>
                                <span name="maodeobrafixa2" id="maodeobrafixa2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-de-obra variável:</label>
                            <div class="controls">
                                <input type="text" name="maodeobravariavel" id="maodeobravariavel" placeholder="Valor em R$(ANO)" required>
                                <span name="maodeobravariavel2" id="maodeobravariavel2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sementes:</label>
                            <div class="controls">
                                <input type="text" name="sementes" id="sementes" placeholder="Valor em R$(ANO)" required>
                                <span name="sementes2" id="sementes2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Defensivos agrícolas para pastagens:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="defensivospastagens" id="defensivospastagens"  placeholder="Valor em R$(ANO)" required>
                                <span name="defensivospastagens2" id="defensivospastagens2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Adubos para pastegens:</label>
                            <div class="controls">
                                <input type="text" name="adubos" id="adubos" placeholder="Valor em R$(ANO)" required>
                                <span name="adubos2" id="adubos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Combustíveis e Lubrificantes:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="combustiveis" id="combustiveis"  placeholder="Valor em R$(ANO)" required>
                                <span name="combustiveis2" id="combustiveis2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Reparos de máquinas:</label>
                            <div class="controls">
                                <input type="text" name="reparomaquinas" id="reparomaquinas" placeholder="Valor em R$(ANO)" required>
                                <span name="reparomaquinas2" id="reparomaquinas2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Reparos de benfeitorias:</label>
                            <div class="controls">
                                <input type="text" name="reparosbemfeitorias" id="reparosbemfeitorias" placeholder="Valor em R$(ANO)" required>
                                <span name="reparosbemfeitorias2" id="reparosbemfeitorias2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Fretes, taxas e comissão na venda de animais:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="fretes" id="fretes" placeholder="Valor em R$(ANO)" required>
                                <span name="fretes2" id="fretes2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Arrendamentos de campo nativo:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="arrendamentosnativo" id="arrendamentosnativo"  placeholder="Valor em R$(ANO)" required>
                                <span name="arrendamentosnativo2" id="arrendamentosnativo2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Arrendamentos de pastagens cultivadas:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="arrendamentoscultivadas" id="arrendamentoscultivadas" placeholder="Valor em R$(ANO)" required>
                                <span name="arrendamentoscultivadas2" id="arrendamentoscultivadas2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Impostos e Taxas:</label>
                            <div class="controls">
                                <input type="text" name="impostos" id="impostos" placeholder="Valor em R$(ANO)" required>
                                <span name="impostos2" id="impostos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Outras despesas:</label>
                            <div class="controls">
                                <input type="text" name="outras" id="outras"  placeholder="Valor em R$(ANO)" required onblur="calcularValor()">
                                <span name="outras2" id="outras2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><b>TOTAL:</b></label>
                            <div class="controls">
                                <span name="total" id="totalizando" class="uneditable-input"></span><span id="sla" class="help-inline">Valor em R$(ANO)</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Saidas" />
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
