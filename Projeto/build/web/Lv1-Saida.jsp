<%-- 
    Document   : Lv1-Saida
    Created on : 30/04/2015, 15:33:55
    Author     : Aluno
--%>

<%@page import="dao.Lv1ResultadoDAO"%>
<%@page import="modelo.Lv1Resultado"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv1p4DAO"%>
<%@page import="modelo.Lv1p4"%>
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

    if (request.getParameter("medicamentos") != null
            || request.getParameter("maodeobra") != null
            || request.getParameter("maquinas") != null
            || request.getParameter("dispesas") != null
            || request.getParameter("outros") != null) {

        Lv1p4 lv1p4 = new Lv1p4();

        lv1p4.setPropiedade_id(pro.getId());
        lv1p4.setAno(p.getAno());

        if (request.getParameter("medicamentos").equals("")) {

            lv1p4.setMadicamento(00.0);
        } else {
            lv1p4.setMadicamento(Double.parseDouble(request.getParameter("medicamentos")));
        }

        if (request.getParameter("maodeobra").equals("")) {
            lv1p4.setMao_de_obra(00.0);
        } else {
            lv1p4.setMao_de_obra(Double.parseDouble(request.getParameter("maodeobra")));
        }

        if (request.getParameter("maquinas").equals("")) {
            lv1p4.setMaquinas(00.0);
        } else {
            lv1p4.setMaquinas(Double.parseDouble(request.getParameter("maquinas")));
        }

        if (request.getParameter("dispesas").equals("")) {
            lv1p4.setPastagem(00.0);
        } else {
            lv1p4.setPastagem(Double.parseDouble(request.getParameter("dispesas")));
        }

        if (request.getParameter("outros").equals("")) {
            lv1p4.setOutros(00.0);
        } else {
            lv1p4.setOutros(Double.parseDouble(request.getParameter("outros")));
        }

        Lv1p4DAO dao = new Lv1p4DAO();
        Lv1p4 teste;
        teste = dao.buscar(p.getAno(), pro);
        if (teste == null) {
            dao.inserir(lv1p4);
        } else {
            dao.atualizar(lv1p4);
        }
        p.setLv1p4(lv1p4);

    }

    Double a = p.custohectar();
    Double a1 = p.receitahectar();
    Double a6 = p.lotacaomedia();
    Double a7 = p.totalcustoproducao();

    if (a != null
            || a1 != null
            || a6 != null
            || a7 != null) {

        Lv1Resultado res = new Lv1Resultado();
        Lv1ResultadoDAO resdao = new Lv1ResultadoDAO();

        res.setCustohectar(p.custohectar());
        res.setLotacaomedia(p.lotacaomedia());
        res.setReceitahectar(p.receitahectar());
        res.setTotalcustoproducao(p.totalcustoproducao());
        res.setAno(p.getAno());
        res.setPropriedade_id(pro.getId());

        Lv1Resultado teste;
        teste = resdao.buscar(p.getAno(), pro);
        if (teste == null) {
            resdao.inserir(res);
        } else {
            resdao.atualizar(res);
        }
    }

%>
<%@ include file="cabecalho.jsp" %>
</head>
<body>

    <%@ include file="barranavegacao.jsp" %>

    <div class="container-fluid">
        <div class="row-fluid">

            <aside class="span6">
                <section id="breadcrumbs">
                    <h3> Progresso </h3>

                    <div class="breadcrumb flat">
                        <a href="AnoLv1.jsp"> Data </a>
                        <a href="Lv1-Passo1.jsp"> Passo 1 </a>
                        <a href="Lv1-Passo2.jsp"> Passo 2 </a>
                        <a href="Lv1-Passo3.jsp"> Passo 3 </a>
                        <a href="Lv1-Passo4.jsp"> Passo 4 </a>
                        <a class="active"> Resultados </a>
                    </div>

                </section>                
            </aside>

            <aside class="span5">
                <br/>
                <br/>
                <br/>
                <div class="ficanaesquerda">
                    <h4 >Propriedade: <%=pro.getNome()%></h4>
                    <h4>Ano: <%=p.getAno()%></h4>
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

                <form name="Passo4" action="VerificarLv2.jsp" class="form-horizontal" method ="post" onSubmit="return passo4();">

                    <div class="control-group">
                        <label class="control-label">Lotação Média da Propriedade:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="lotaçaomedia"  class="uneditable-input" value="<%=  String.format("%.2f", p.lotacaomedia())%>">
                            <span class="help-inline">Cabeça(s) por hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Receita por Hectare:</label>
                        <div class="controls">
                            <input type="text" name="receitahectare"  class="uneditable-input" value="<%=  String.format("%.2f", p.receitahectar())%>">
                            <span class="help-inline">Reais por Hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Total dos Custos de Produção:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="totalproduçao"  class="uneditable-input" value="<%=  String.format("%.2f", p.totalcustoproducao())%>">
                            <span class="help-inline">Reais</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Custo de Produção por Hectar:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="custohectar"  class="uneditable-input" value="<%=  String.format("%.2f", p.custohectar())%>">
                            <span class="help-inline">Reais por Hectare</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Custo de Atividade de Cria:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="custohectar"  class="uneditable-input" value="<%=  String.format("%.2f", p.custocria())%>">
                            <span class="help-inline">Reais</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Custo de Produção por terneiro(a) desmamado:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="custohectar"  class="uneditable-input" value="<%=  String.format("%.2f", p.custoterneiro1())%>">
                            <span class="help-inline">Reais por Terneiro(a)</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="hidden" name="data2" id="data2" value="<%=p.getAno()%>" />
                            <input type="submit" class="btn" value="Próximo Nível" />
                            <a href="Lv1-Comparacao.jsp" class="btn"> Comparar </a>
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
