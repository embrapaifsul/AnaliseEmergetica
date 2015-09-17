<%-- 
    Document   : Lv2-Passo2
    Created on : 30/04/2015, 15:33:14
    Author     : Aluno
--%>

<%@page import="dao.GraficosDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv2p1DAO"%>
<%@page import="modelo.Lv2p1"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv2p2DAO"%>
<%@page import="modelo.Lv2p2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = new Usuario();
    Passos p = new Passos();

    String vacasdecria1 = "", vacasdecria2 = "", vacasdecria3 = "", vacasdecria4 = "";
    String vacasdedescarte1 = "", vacasdedescarte2 = "", vacasdedescarte3 = "", vacasdedescarte4 = "";
    String terneiros1 = "", terneiros2 = "", terneiros3 = "", terneiros4 = "";
    String terneiras1 = "", terneiras2 = "", terneiras3 = "", terneiras4 = "";
    String novilhos1 = "", novilhos2 = "", novilhos3 = "", novilhos4 = "";
    String novilhas1 = "", novilhas2 = "", novilhas3 = "", novilhas4 = "";
    String novilhos11 = "", novilhos22 = "", novilhos33 = "", novilhos44 = "";
    String novilhas11 = "", novilhas22 = "", novilhas33 = "", novilhas44 = "";
    String novilhos111 = "", novilhos222 = "", novilhos333 = "", novilhos444 = "";
    String touros1 = "", touros2 = "", touros3 = "", touros4 = "";

    String link3, link4, link5;
    link3 = "";
    link4 = "";
    link5 = "";

    if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv2p2() != null) {
            vacasdecria1 = p.getLv2p2().getVacadecriajanmar().toString();
            vacasdecria2 = p.getLv2p2().getVacadecriaabrjun().toString();
            vacasdecria3 = p.getLv2p2().getVacadedescartejulset().toString();
            vacasdecria4 = p.getLv2p2().getVacadecriaoutdez().toString();
            vacasdedescarte1 = p.getLv2p2().getVacadedescartejanmar().toString();
            vacasdedescarte2 = p.getLv2p2().getVacadedescarteabrjun().toString();
            vacasdedescarte3 = p.getLv2p2().getVacadedescartejulset().toString();
            vacasdedescarte4 = p.getLv2p2().getVacadedescarteoutdez().toString();
            terneiros1 = p.getLv2p2().getTerneirosjanmar().toString();
            terneiros2 = p.getLv2p2().getTerneirosabrjun().toString();
            terneiros3 = p.getLv2p2().getTerneirosjulset().toString();
            terneiros4 = p.getLv2p2().getTerneirosoutdez().toString();
            terneiras1 = p.getLv2p2().getTerneirasjanmar().toString();
            terneiras2 = p.getLv2p2().getTerneirasabrjun().toString();
            terneiras3 = p.getLv2p2().getTerneirasjulset().toString();
            terneiras4 = p.getLv2p2().getTerneirasoutdez().toString();
            novilhos1 = p.getLv2p2().getNovilho1324janmar().toString();
            novilhos2 = p.getLv2p2().getNovilho1324abrjun().toString();
            novilhos3 = p.getLv2p2().getNovilho1324julset().toString();
            novilhos4 = p.getLv2p2().getNovilho1324outdez().toString();
            novilhas1 = p.getLv2p2().getNovilha1324janmar().toString();
            novilhas2 = p.getLv2p2().getNovilha1324abrjun().toString();
            novilhas3 = p.getLv2p2().getNovilha1324julset().toString();
            novilhas4 = p.getLv2p2().getNovilha1324outdez().toString();
            novilhos11 = p.getLv2p2().getNovilho2536janmar().toString();
            novilhos22 = p.getLv2p2().getNovilho2536abrjun().toString();
            novilhos33 = p.getLv2p2().getNovilho2536julset().toString();
            novilhos44 = p.getLv2p2().getNovilho2536outdez().toString();
            novilhas11 = p.getLv2p2().getNovilha2536janmar().toString();
            novilhas22 = p.getLv2p2().getNovilha2536abrjun().toString();
            novilhas33 = p.getLv2p2().getNovilha2536julset().toString();
            novilhas44 = p.getLv2p2().getNovilha2536outdez().toString();
            novilhos111 = p.getLv2p2().getNovilho36janmar().toString();
            novilhos222 = p.getLv2p2().getNovilho36abrjun().toString();
            novilhos333 = p.getLv2p2().getNovilho36julset().toString();
            novilhos444 = p.getLv2p2().getNovilho36outdez().toString();
            touros1 = p.getLv2p2().getTourojanmar().toString();
            touros2 = p.getLv2p2().getTouroabrjun().toString();
            touros3 = p.getLv2p2().getTourojulset().toString();
            touros4 = p.getLv2p2().getTourooutdez().toString();

        }

        if (p.getLv2p3() == null) {
            link3 = " class='inativo' ";
            link4 = " class='inativo' ";
            link5 = " class='inativo' ";
        } else {
            if (p.getLv2p4() == null) {
                link4 = " class='inativo' ";
                link5 = " class='inativo' ";
            }
        }

    } else {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);

    }

    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

%>
<%    if (request.getParameter("pn") != null
            || request.getParameter("pnm") != null
            || request.getParameter("pcp") != null
            || request.getParameter("pai") != null
            || request.getParameter("pav") != null
            || request.getParameter("agriV") != null
            || request.getParameter("agriI") != null
            || request.getParameter("florestas") != null
            || request.getParameter("outras") != null
            || request.getParameter("matasnativas") != null
            || request.getParameter("sea") != null
            || request.getParameter("inaproveitavel") != null) {
        Lv2p1 a = new Lv2p1();
        a.setPastagemnativa(Double.parseDouble(request.getParameter("pn")));
        a.setPastagemnativamelhorada(Double.parseDouble(request.getParameter("pnm")));
        a.setPastagemcultivadaperene(Double.parseDouble(request.getParameter("pcp")));
        a.setPastagemanuaisdeinverno(Double.parseDouble(request.getParameter("pai")));
        a.setPastagemanuaisdeverao(Double.parseDouble(request.getParameter("pav")));
        a.setAgriculturav(Double.parseDouble(request.getParameter("agriV")));
        a.setAgriculturai(Double.parseDouble(request.getParameter("agriI")));
        a.setFlorestaplantadas(Double.parseDouble(request.getParameter("florestas")));
        a.setOutrasplantadas(Double.parseDouble(request.getParameter("outras")));
        a.setMatasnativas(Double.parseDouble(request.getParameter("matasnativas")));
        a.setSea(Double.parseDouble(request.getParameter("sea")));
        a.setInaproveitavel(Double.parseDouble(request.getParameter("inaproveitavel")));
        a.setPropriedade_id(pro.getId());
        a.setAno(p.getAno());

        Lv2p1DAO dao = new Lv2p1DAO();
        dao.inserir(a);
        p.setLv2p1(a);

    }

    GraficosDAO daog = new GraficosDAO();
    Lv2p2 graf = daog.graficolv2p2(pro);


%>

<%@ include file="cabecalho.jsp" %>

<%              String exibegraf = "none";
    if (graf != null) {

        Integer janmar = graf.getVacadecriajanmar() + graf.getVacadedescartejanmar() + graf.getTerneirasjanmar() + graf.getTerneirosjanmar() + graf.getNovilho1324janmar() + graf.getNovilha1324janmar() + graf.getNovilho2536janmar() + graf.getNovilha2536janmar() + graf.getNovilho36janmar() + graf.getTourojanmar();
        Integer abrjun = graf.getVacadecriaabrjun() + graf.getVacadedescarteabrjun() + graf.getTerneirasabrjun() + graf.getTerneirosabrjun() + graf.getNovilho1324abrjun() + graf.getNovilha1324abrjun() + graf.getNovilho2536abrjun() + graf.getNovilha2536abrjun() + graf.getNovilho36abrjun() + graf.getTouroabrjun();
        Integer julset = graf.getVacadecriajulset() + graf.getVacadedescartejulset() + graf.getTerneirasjulset() + graf.getTerneirosjulset() + graf.getNovilho1324julset() + graf.getNovilha1324julset() + graf.getNovilho2536julset() + graf.getNovilha2536julset() + graf.getNovilho36julset() + graf.getTourojulset();
        Integer outdez = graf.getVacadecriaoutdez() + graf.getVacadedescarteoutdez() + graf.getTerneirasoutdez() + graf.getTerneirosoutdez() + graf.getNovilho1324outdez() + graf.getNovilha1324outdez() + graf.getNovilho2536outdez() + graf.getNovilha2536outdez() + graf.getNovilho36outdez() + graf.getTourooutdez();

        exibegraf = "block";
%>
<style type="text/css">

</style>
<script type="text/javascript">


    $(function () {
        $('#container').highcharts({
            title: {
                text: 'Rebanho Bovino',
                x: -20 //center
            },
            xAxis: {
                categories: ['Jan-Mar', 'Apr-Jun',
                    'Jul-Set', 'Out-Dez']
            },
            yAxis: {
                title: {
                    text: 'Cabeças'
                },
                plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
            },
            tooltip: {
                valueSuffix: ' Cabeças'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                    name: 'Rebanho',
                    data: [312, 321, 341, 351]
                }]
        });
    });
</script>
<%
    }
%>
<script>
    function calcularTudo()
    {
        var vacasdecria1 = document.getElementById('vacasdecria1');
        var vacasdecria2 = document.getElementById('vacasdecria2');
        var vacasdecria3 = document.getElementById('vacasdecria3');
        var vacasdecria4 = document.getElementById('vacasdecria4');
        var vacasdedescarte1 = document.getElementById('vacasdedescarte1');
        var vacasdedescarte2 = document.getElementById('vacasdedescarte2');
        var vacasdedescarte3 = document.getElementById('vacasdedescarte3');
        var vacasdedescarte4 = document.getElementById('vacasdedescarte4');
        var terneiros1 = document.getElementById('terneiros1');
        var terneiros2 = document.getElementById('terneiros2');
        var terneiros3 = document.getElementById('terneiros3');
        var terneiros4 = document.getElementById('terneiros4');
        var terneiras1 = document.getElementById('terneiras1');
        var terneiras2 = document.getElementById('terneiras2');
        var terneiras3 = document.getElementById('terneiras3');
        var terneiras4 = document.getElementById('terneiras4');
        var novilhos1 = document.getElementById('novilhos1');
        var novilhos2 = document.getElementById('novilhos2');
        var novilhos3 = document.getElementById('novilhos3');
        var novilhos4 = document.getElementById('novilhos4');
        var novilhas1 = document.getElementById('novilhas1');
        var novilhas2 = document.getElementById('novilhas2');
        var novilhas3 = document.getElementById('novilhas3');
        var novilhas4 = document.getElementById('novilhas4');
        var novilhos11 = document.getElementById('novilhos11');
        var novilhos22 = document.getElementById('novilhos22');
        var novilhos33 = document.getElementById('novilhos33');
        var novilhos44 = document.getElementById('novilhos44');
        var novilhas11 = document.getElementById('novilhas11');
        var novilhas22 = document.getElementById('novilhas22');
        var novilhas33 = document.getElementById('novilhas33');
        var novilhas44 = document.getElementById('novilhas44');
        var novilhos111 = document.getElementById('novilhos111');
        var novilhos222 = document.getElementById('novilhos222');
        var novilhos333 = document.getElementById('novilhos333');
        var novilhos444 = document.getElementById('novilhos444');
        var touros1 = document.getElementById('touros1');
        var touros2 = document.getElementById('touros2');
        var touros3 = document.getElementById('touros3');
        var touros4 = document.getElementById('touros4');
        var total1 = document.getElementById('total1');
        var total2 = document.getElementById('total2');
        var total3 = document.getElementById('total3');
        var total4 = document.getElementById('total4');

        if (vacasdecria1.value === "")
        {
            vacasdecria1.focus();
        }
        else if (vacasdedescarte1.value === "")
        {
            vacasdedescarte1.focus();
        }
        else if (terneiros1.value === "")
        {
            terneiros1.focus();
        }
        else if (terneiras1.value === "")
        {
            terneiras1.focus();
        }
        else if (novilhos1.value === "")
        {
            novilhos1.focus();
        }
        else if (novilhas1.value === "")
        {
            novilhas1.focus();
        }
        else if (novilhos11.value === "")
        {
            novilhos11.focus();
        }
        else if (novilhas11.value === "")
        {
            novilhas11.focus();
        }
        else if (novilhos111.value === "")
        {
            novilhos111.focus();
        }
        else if (touros1.value === "")
        {
            touros1.focus();
        }
        total1.innerHTML = parseInt(vacasdecria1.value) +
                parseInt(vacasdedescarte1.value) +
                parseInt(terneiros1.value) +
                parseInt(terneiras1.value) +
                parseInt(novilhos1.value) +
                parseInt(novilhas1.value) +
                parseInt(novilhos11.value) +
                parseInt(novilhas11.value) +
                parseInt(novilhos111.value) +
                parseInt(touros1.value);

        if (vacasdecria2.value === "")
        {
            vacasdecria2.focus();
        }
        else if (vacasdedescarte2.value === "")
        {
            vacasdedescarte2.focus();
        }
        else if (terneiros2.value === "")
        {
            terneiros2.focus();
        }
        else if (terneiras2.value === "")
        {
            terneiras2.focus();
        }
        else if (novilhos2.value === "")
        {
            novilhos2.focus();
        }
        else if (novilhas2.value === "")
        {
            novilhas2.focus();
        }
        else if (novilhos22.value === "")
        {
            novilhos22.focus();
        }
        else if (novilhas22.value === "")
        {
            novilhas22.focus();
        }
        else if (novilhos222.value === "")
        {
            novilhos222.focus();
        }
        else if (touros2.value === "")
        {
            touros2.focus();
        }
        total2.innerHTML = parseInt(vacasdecria2.value) +
                parseInt(vacasdedescarte2.value) +
                parseInt(terneiros2.value) +
                parseInt(terneiras2.value) +
                parseInt(novilhos2.value) +
                parseInt(novilhas2.value) +
                parseInt(novilhos22.value) +
                parseInt(novilhas22.value) +
                parseInt(novilhos222.value) +
                parseInt(touros2.value);

        if (vacasdecria3.value === "")
        {
            vacasdecria3.focus();
        }
        else if (vacasdedescarte3.value === "")
        {
            vacasdedescarte3.focus();
        }
        else if (terneiros3.value === "")
        {
            terneiros3.focus();
        }
        else if (terneiras3.value === "")
        {
            terneiras3.focus();
        }
        else if (novilhos3.value === "")
        {
            novilhos3.focus();
        }
        else if (novilhas3.value === "")
        {
            novilhas3.focus();
        }
        else if (novilhos33.value === "")
        {
            novilhos33.focus();
        }
        else if (novilhas33.value === "")
        {
            novilhas33.focus();
        }
        else if (novilhos333.value === "")
        {
            novilhos333.focus();
        }
        else if (touros3.value === "")
        {
            touros3.focus();
        }
        total3.innerHTML = parseInt(vacasdecria3.value) +
                parseInt(vacasdedescarte3.value) +
                parseInt(terneiros3.value) +
                parseInt(terneiras3.value) +
                parseInt(novilhos3.value) +
                parseInt(novilhas3.value) +
                parseInt(novilhos33.value) +
                parseInt(novilhas33.value) +
                parseInt(novilhos333.value) +
                parseInt(touros3.value);

        if (vacasdecria4.value === "")
        {
            vacasdecria4.focus();
        }
        else if (vacasdedescarte4.value === "")
        {
            vacasdedescarte4.focus();
        }
        else if (terneiros4.value === "")
        {
            terneiros4.focus();
        }
        else if (terneiras4.value === "")
        {
            terneiras4.focus();
        }
        else if (novilhos4.value === "")
        {
            novilhos4.focus();
        }
        else if (novilhas4.value === "")
        {
            novilhas4.focus();
        }
        else if (novilhos44.value === "")
        {
            novilhos44.focus();
        }
        else if (novilhas44.value === "")
        {
            novilhas44.focus();
        }
        else if (novilhos444.value === "")
        {
            novilhos444.focus();
        }
        else if (touros4.value === "")
        {
            touros4.focus();
        }
        total4.innerHTML = parseInt(vacasdecria4.value) +
                parseInt(vacasdedescarte4.value) +
                parseInt(terneiros4.value) +
                parseInt(terneiras4.value) +
                parseInt(novilhos4.value) +
                parseInt(novilhas4.value) +
                parseInt(novilhos44.value) +
                parseInt(novilhas44.value) +
                parseInt(novilhos444.value) +
                parseInt(touros4.value);
    }
</script>

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
                            <li class="alert-info"> Passo 2 </li><span class="divider"> / </span>
                            <li><a href="Lv2-Passo3.jsp" <%=link3%> > Passo 3 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo4.jsp" <%=link4%> > Passo 4 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Saida.jsp" <%=link5%> > Resultados </a></li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                <span class="sr-only">40% Completo</span>
                            </div>
                        </div>
                    </header>
                </section><br/>
            </aside>

            <aside class="span1"></aside>

        </div>
    </div>

    <div class="container-fluid">
        <div class="row-fluid">



            <aside class="span10">
                <h2> Rebanho Bovino </h2>
                <br/>

                <form name="passo2" action="Lv2-Passo3.jsp" class="form-horizontal" method ="post" onSubmit="return passo2();">
                    <div class="control-group">
                        <label class="control-label">Vacas de Cria:</label>
                        <div class="controls">
                            <input type="text" name="vacasdecria1" id="vacasdecria1" placeholder="Jan-Mar" value="<%=vacasdecria1%>">
                            <input type="text" name="vacasdecria2" id="vacasdecria2" placeholder="Abr-Jun" value="<%=vacasdecria2%>">
                            <input type="text" name="vacasdecria3" id="vacasdecria3" placeholder="Jul-Set" value="<%=vacasdecria3%>">
                            <input type="text" name="vacasdecria4" id="vacasdecria4" placeholder="Out-Dez" value="<%=vacasdecria4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Vacas de Descarte:</label>
                        <div class="controls">
                            <input type="text" name="vacasdedescarte1" id="vacasdedescarte1" placeholder="Jan-Mar" value="<%=vacasdedescarte1%>">
                            <input type="text" name="vacasdedescarte2" id="vacasdedescarte2" placeholder="Abr-Jun" value="<%=vacasdedescarte2%>">
                            <input type="text" name="vacasdedescarte3" id="vacasdedescarte3" placeholder="Jul-Set" value="<%=vacasdedescarte3%>">
                            <input type="text" name="vacasdedescarte4" id="vacasdedescarte4" placeholder="Out-Dez" value="<%=vacasdedescarte4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Terneiros:</label>
                        <div class="controls">
                            <input type="text" name="terneiros1" id="terneiros1" placeholder="Jan-Mar" value="<%=terneiros1%>">
                            <input type="text" name="terneiros2" id="terneiros2" placeholder="Abr-Jun" value="<%=terneiros2%>">
                            <input type="text" name="terneiros3" id="terneiros3" placeholder="Jul-Set" value="<%=terneiros3%>">
                            <input type="text" name="terneiros4" id="terneiros4" placeholder="Out-Dez" value="<%=terneiros4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Terneiras:</label>
                        <div class="controls">
                            <input type="text" name="terneiras1" id="terneiras1" placeholder="Jan-Mar" value="<%=terneiras1%>">
                            <input type="text" name="terneiras2" id="terneiras2" placeholder="Abr-Jun" value="<%=terneiras2%>">
                            <input type="text" name="terneiras3" id="terneiras3" placeholder="Jul-Set" value="<%=terneiras3%>">
                            <input type="text" name="terneiras4" id="terneiras4" placeholder="Out-Dez" value="<%=terneiras4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Novilhos 13-24:</label>
                        <div class="controls">
                            <input type="text" name="novilhos1" id="novilhos1" placeholder="Jan-Mar" value="<%=novilhos1%>">
                            <input type="text" name="novilhos2" id="novilhos2" placeholder="Abr-Jun" value="<%=novilhos2%>">
                            <input type="text" name="novilhos3" id="novilhos3" placeholder="Jul-Set" value="<%=novilhos3%>">
                            <input type="text" name="novilhos4" id="novilhos4" placeholder="Out-Dez" value="<%=novilhos4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Novilhas 13-24:</label>
                        <div class="controls">
                            <input type="text" name="novilhas1" id="novilhas1" placeholder="Jan-Mar" value="<%=novilhas1%>">
                            <input type="text" name="novilhas2" id="novilhas2" placeholder="Abr-Jun" value="<%=novilhas2%>">
                            <input type="text" name="novilhas3" id="novilhas3" placeholder="Jul-Set" value="<%=novilhas3%>">
                            <input type="text" name="novilhas4" id="novilhas4" placeholder="Out-Dez" value="<%=novilhas4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Novilhos 25-36:</label>
                        <div class="controls">
                            <input type="text" name="novilhos11" id="novilhos11" placeholder="Jan-Mar" value="<%=novilhos11%>">
                            <input type="text" name="novilhos22" id="novilhos22" placeholder="Abr-Jun" value="<%=novilhos22%>">
                            <input type="text" name="novilhos33" id="novilhos33" placeholder="Jul-Set" value="<%=novilhos33%>">
                            <input type="text" name="novilhos44" id="novilhos44" placeholder="Out-Dez" value="<%=novilhos44%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Novilhas 25-36:</label>
                        <div class="controls">
                            <input type="text" name="novilhas11" id="novilhas11" placeholder="Jan-Mar" value="<%=novilhas11%>">
                            <input type="text" name="novilhas22" id="novilhas22" placeholder="Abr-Jun" value="<%=novilhas22%>">
                            <input type="text" name="novilhas33" id="novilhas33" placeholder="Jul-Set" value="<%=novilhas33%>">
                            <input type="text" name="novilhas44" id="novilhas44" placeholder="Out-Dez" value="<%=novilhas44%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Novilhos > 36:</label>
                        <div class="controls">
                            <input type="text" name="novilhos111" id="novilhos111" placeholder="Jan-Mar" value="<%=novilhos111%>">
                            <input type="text" name="novilhos222" id="novilhos222" placeholder="Abr-Jun" value="<%=novilhos222%>">
                            <input type="text" name="novilhos333" id="novilhos333" placeholder="Jul-Set" value="<%=novilhos333%>">
                            <input type="text" name="novilhos444" id="novilhos444" placeholder="Out-Dez" value="<%=novilhos444%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Touros:</label>
                        <div class="controls">
                            <input type="text" name="touros1" id="touros1" placeholder="Jan-Mar" value="<%=touros1%>">
                            <input type="text" name="touros2" id="touros2" placeholder="Abr-Jun" value="<%=touros2%>">
                            <input type="text" name="touros3" id="touros3" placeholder="Jul-Set" value="<%=touros3%>">
                            <input type="text" name="touros4" id="touros4" placeholder="Out-Dez" value="<%=touros4%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><b>TOTAL POR PERIODO:</b></label>
                        <div class="controls">
                            <span name="total1" id="total1" placeholder="Jan-Mar" class="uneditable-input"></span>
                            <span name="total2" id="total2" placeholder="Abr-Jun" class="uneditable-input"></span>
                            <span name="total3" id="total3" placeholder="Jul-Set" class="uneditable-input"></span>
                            <span name="total4" id="total4" placeholder="Out-Dez" class="uneditable-input"></span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="button" onclick="calcularTudo();" class="btn" value="Calcular" />
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="submit" class="btn" value="Proximo Passo" />
                        </div>
                        <div>
                            <div style="display:<%=exibegraf%>">
                                <script src="js/highcharts.js"></script>
                                <script src="js/modules/exporting.js"></script>
                                <div id="container" style="min-width: 50px; height: 200px; margin: 0 auto"></div>
                            </div>
                        </div>
                    </div>   
                </form>
            </aside>
            <aside>

            </aside>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
        </div>
    </footer>
</body>

</html>