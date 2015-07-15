<%@page import="dao.GraficosDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv1p3DAO"%>
<%@page import="modelo.Lv1p3"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv1p4DAO"%>
<%@page import="modelo.Lv1p4"%>
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
    
   GraficosDAO daog = new GraficosDAO ();
    Lv1p4 graf = daog.graficolv1p4(pro);
   


%>
<%
        Lv1p3 lv1p3 = new Lv1p3();
        lv1p3.setReceita_anual(Double.parseDouble(request.getParameter("bovinosanual")));
        lv1p3.setPropiedade_id(pro.getId());
        lv1p3.setAno(p.getAno());

        Lv1p3DAO dao = new Lv1p3DAO();
        dao.inserir(lv1p3);
        p.setLv1p3(lv1p3);
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
        <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="bootstrap/TesteJavaScript.js"></script>
        <%
         String exibegraf = "none";
         if(graf!=null)
    {
        exibegraf="block";
%>
        <style type="text/css">
${demo.css}
		</style>


		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: 'Percentual dos Custos'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Custos',
            data: [
                ['Medicamentos',  <%=graf.getMadicamento()%> ],
                    ['Mão-de-obra',   <%=graf.getMao_de_obra()%>],                    
                    ['Maquinas',   <%=graf.getMaquinas()%>],
                    ['Pastagem',   <%=graf.getPastagem()%>],
                    ['Outros',   <%=graf.getOutros()%>]
            ]
        }]
    });
});


		</script>
<%
    }
%>
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
                                <li><a href="Lv1-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li class="alert-error"> Passo 4 </li><span class="divider"> / </span>
                                <li><a href="Lv1-Saida.jsp"> Resultados </a></li>
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

                

                <aside class="span6">

                    <h2> Custo de Produção </h2>
                    <br/>

                    <form name="Passo4" action="Lv1-Saida.jsp" class="form-horizontal" method ="post" onSubmit="return passo4();">
                        <div class="control-group">
                            <label class="control-label">Medicamentos:</label>
                            <div class="controls">
                                <input type="text" name="medicamentos">
                                <span>
                                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Medicamento: Vacinas, carrapaticidas, Vermífugos e outros medicamentos;"><i class="icon-info-sign"></i></button>
                                </span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-De-Obra:</label>
                            <div class="controls">
                                <input type="text" name="maodeobra">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Mão de obra: Mão de obra fixa e variável;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Maquinas e Benfeitorias:</label>
                            <div class="controls">
                                <input type="text" name="maquinas">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Máquinas: Reparos, combustíveis e lubrificantes;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem e Suplementos:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="dispesas">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Pastagens: Sal comum e mineral, rações, sementes, calcário, adubo e defensivos agrícolas;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Outras Dispesas:</label>
                            <div class="controls">
                                <input type="text" name="outros">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Outros: arrendamento, sêmen, utensílios em geral, fretes, taxas e comissões;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Resultados" />
                            </div>
                        </div>
                    </form>               

                </aside>

               <aside class="span6">
                    
                    
                    <div class="tabbable tabs-left">
                            <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab"> Resultados </a></li>
                            <li style="display:<%=exibegraf%>"><a href="#tab2" data-toggle="tab"> Greficos </a></li>                            
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                 <jsp:include page="bootstrap/resultado.jsp" >
                                <jsp:param name="passo" value="4" />
                                </jsp:include>
                            </div>
                            <div class="tab-pane" id="tab2">
                                <script src="js/highcharts.js"></script>
                                 <script src="js/modules/exporting.js"></script>                                 
                                <div id="container" style="min-width: 310px; height: 200px; max-width: 300px; margin: 0 auto"></div>
                            </div>
                           
                        </div>
                        </div>
                                                  
                     
                    
                </aside>

            </div>
        </div>

    </body>
    
</html>
