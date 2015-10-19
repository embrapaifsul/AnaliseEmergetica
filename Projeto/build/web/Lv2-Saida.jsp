<%-- 
    Document   : Lv2-Saida
    Created on : 30/04/2015, 15:34:23
    Author     : Aluno
--%>

<%@page import="dao.Lv2ResultadoDAO"%>
<%@page import="modelo.Lv2Resultado"%>
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
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

%>
<%    if (request.getParameter("medicamentos") != null
            || request.getParameter("carrapaticidas") != null
            || request.getParameter("sal") != null
            || request.getParameter("racoes") != null
            || request.getParameter("comprabovinos") != null
            || request.getParameter("utensilios") != null
            || request.getParameter("semen") != null
            || request.getParameter("maodeobrafixa") != null
            || request.getParameter("maodeobravariavel") != null
            || request.getParameter("sementes") != null
            || request.getParameter("defensivospastagens") != null
            || request.getParameter("adubos") != null
            || request.getParameter("combustiveis") != null
            || request.getParameter("reparomaquinas") != null
            || request.getParameter("reparosbemfeitorias") != null
            || request.getParameter("fretes") != null
            || request.getParameter("arrendamentosnativo") != null
            || request.getParameter("arrendamentoscultivadas") != null
            || request.getParameter("impostos") != null
            || request.getParameter("outras") != null) {
        Lv2p4 d = new Lv2p4();
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
    }

        Lv2Resultado res = new Lv2Resultado();
        Lv2ResultadoDAO resdao = new Lv2ResultadoDAO();
        
        res.setAreaaproveitavel(p.areaaproveitavel());
        res.setAreamedia(p.areamedia());
        res.setCustoatividadecria1(p.custoatividadecria1());
        res.setCustoproducaohectar1(p.custoproducaohectar1());
        res.setCustotalproducao(p.custotalproducao());
        res.setCustoterneiro(p.custoterneiro());
        res.setLotacaomedia2(p.lotacaomedia2());
        res.setPercentualrebanhocomcria(p.percentualrebanhocomcria());
        res.setReceitahectar2(p.receitahectar2());
        res.setTotalreceita(p.totalreceita());
        res.setAno(p.getAno());
        res.setPropriedade_id(pro.getId());
        
        resdao.inserir(res);
%>

<%@ include file="cabecalho.jsp" %>
</head>
<body>

    <%@ include file="barranavegacao2.jsp" %>

    <div class="container-fluid">
        <div class="row-fluid">

            <aside class="span11">
                <section id="breadcrumbs">
                    <header class="page-header">
                        <h3> Progresso </h3>

                        <ul class="breadcrumb">                
                            <li><a href="AnoLv2.jsp"> Data </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                            <li class="alert-info"> Resultados </li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                <span class="sr-only">100% Completo</span>
                            </div>
                        </div>
                    </header>
                </section><br/><br/>
            </aside>

            <aside class="span1"></aside>

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
                            <input type="text" name="areamedia" class="uneditable-input" value="<%=  String.format("%.2f", p.areamedia())%>">
                            <span class="help-inline">Hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Área Aproveitável da propriedade:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="areaaproveitavel" class="uneditable-input" value="<%=  String.format("%.2f", p.areaaproveitavel())%>">
                            <span class="help-inline">Hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Percentual do Rebanho com atividade de Cria:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="percentualrebanho" class="uneditable-input" value="<%=  String.format("%.2f", p.percentualrebanhocomcria())%>">
                            <span class="help-inline">%</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Lotação Média da Propriedade:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="lotaçaomedia"  class="uneditable-input" value="<%=  String.format("%.2f", p.lotacaomedia2())%>">
                            <span class="help-inline">Cabeça(s) por hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Receita Total das Atividades:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="receitaatividades"  class="uneditable-input" value="<%=  String.format("%.2f", p.totalreceita())%>">
                            <span class="help-inline">R$</span>     
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Receita por Hectare:</label>
                        <div class="controls">
                            <input type="text" name="receitahectare"  class="uneditable-input" value="<%=  String.format("%.2f", p.receitahectar2())%>">
                            <span class="help-inline">R$/Hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Total dos Custos de Produção:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="totalproduçao"  class="uneditable-input" value="<%=  String.format("%.2f", p.custotalproducao())%>">
                            <span class="help-inline">R$</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Custo de Atividade de Cria:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="custocria"  class="uneditable-input" value="<%=  String.format("%.2f", p.custoatividadecria1())%>">
                            <span class="help-inline">R$</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Custo de Produção por Hectar:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="custohectar"  class="uneditable-input" value="<%=  String.format("%.2f", p.custoproducaohectar1())%>">
                            <span class="help-inline">R$/Hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Custo de Produção por Terneiro(a) Desmamado:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="custodesmamado"  class="uneditable-input" value="<%=  String.format("%.2f", p.custoterneiro())%>">
                            <span class="help-inline">R$/Terneiro(a)</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="submit" class="btn" value="Ir Para o Inicio" />
                            <a href="Lv2-Comparacao.jsp" class="btn"> Comparar </a>
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
