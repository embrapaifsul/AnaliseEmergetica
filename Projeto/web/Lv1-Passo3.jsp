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

    String link4, link5;
    link4 = "";
    link5 = "";

    if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv1p3() != null) {
            custo = p.getLv1p3().getReceita_anual().toString();
        }
        if (p.getLv1p4() == null) {
            link4 = " class='inativo' ";
            link5 = " class='inativo' ";
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

    if (request.getParameter("vacasdecria") != null
            || request.getParameter("vacasdedescarte") != null
            || request.getParameter("terneiros") != null
            || request.getParameter("terneiras") != null
            || request.getParameter("novilhos1") != null
            || request.getParameter("novilhas1") != null
            || request.getParameter("novilhos2") != null
            || request.getParameter("novilhas2") != null
            || request.getParameter("novilhos3") != null
            || request.getParameter("touros") != null) {

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
        if (request.getParameter("novilhas3").equals("")) {
            e.setNovilha36(0);
        } else {
            e.setNovilha36(Integer.parseInt(request.getParameter("novilhas3")));
        }

        if (request.getParameter("touros").equals("")) {
            e.setTouro(00);
        } else {
            e.setTouro(Integer.parseInt(request.getParameter("touros")));
        }

        e.setAno(p.getAno());

        Lv1p2 teste;
        teste = dao.buscar(p.getAno(), pro);
        if (teste == null) {
            dao.inserirNao(e);
        } else {
            dao.atualizar(e);
        }

        p.setLv1p2(e);

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
                            <a class="active"> Passo 3 </a>
                            <a href="Lv1-Passo4.jsp" <%=link4%>> Passo 4 </a>
                            <a href="Lv1-Saida.jsp" <%=link5%>> Resultados </a>
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


        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span11">
                    <section id="breadcrumbs">
                        <header class="page-header">
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
                            <input type="number" name="bovinosanual" value="<%=custo%>" required>
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
                                <label class="control-label"><h6><b>Área média da Pecuária Aproveitavel: </b></h6><span id="a"><h2><%= String.format("%.2f", p.getLv1p1().getArea_apro())%></h2></span><h6><span class="help-inline">Hectares</span></h6>
                            </div>
                            <br/><br/><br/><br/><br/><br/>
                        </div>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h5 class="panel-title">Passo 3</h5>
                        </div>
                        <div class="panel-body">
                            <img class="menorr2" src="images/tvy1d9k9.bmp" alt="..." class="img-rounded">
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
                                <div class="control-group">
                                    <label class="control-label"><h6><b>Rebanho com atividade de Cria: </b></h6><span id="a"><h2><%= String.format("%.2f", p.percentualcria())%></h2></span><h6><span class="help-inline">%</span></h6>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><h6><b>Lotação Média da Propriedade: </b></h6><span id="b"><h2><%= String.format("%.2f", p.lotacaomedia())%></h2></span><h6><span class="help-inline">Cabeça(s) por hectare</span></h6>
                                </div>
                        </div>
                    </div>
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h5 class="panel-title">Passo 4</h5>
                        </div>
                        <div class="panel-body">
                            <img class="menorr2" src="images/ujg8h7w6.bmp" alt="..." class="img-rounded">    
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </div>

</body>

</html>
