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
    
    String medicamentos="";
    String maodeobra="";
    String maquinas="";
    String dispesas="";
    String outros="";
    
    String link5;
    link5="";
    
    if (session.getAttribute("Passos") != null) {
        p = (Passos)session.getAttribute("Passos");
        if(p.getLv1p4() !=null)
        {
            medicamentos = p.getLv1p4().getMadicamento().toString();
            maodeobra = p.getLv1p4().getMao_de_obra().toString();
            maquinas = p.getLv1p4().getMaquinas().toString();
            dispesas = p.getLv1p4().getPastagem().toString();
            outros = p.getLv1p4().getOutros().toString();
        }
        if (p.getLv1p4() == null) {
                link5 = " class='inativo' ";
        }
    }
    else
    {
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

    GraficosDAO daog = new GraficosDAO();
    String ano = p.getAno();
    Lv1p4 graf = daog.graficolv1p4(pro,ano);


%>
<%
    if(request.getParameter("bovinosanual")!=null)
    {
        
    
    
    Lv1p3 lv1p3 = new Lv1p3();
    lv1p3.setReceita_anual(Double.parseDouble(request.getParameter("bovinosanual")));
    lv1p3.setPropiedade_id(pro.getId());
    lv1p3.setAno(p.getAno());

    Lv1p3DAO dao = new Lv1p3DAO();
    dao.inserir(lv1p3);
    p.setLv1p3(lv1p3);
    }
%>
    <%@ include file="cabecalho.jsp" %>
        <script>
            function calcular()
            {
                var medicamentos = document.getElementById('medicamentos');
                var maodeobra = document.getElementById('maodeobra');
                var maquinas =  document.getElementById('maquinas');
                var dispesas = document.getElementById('dispesas');
                var outros = document.getElementById('outros');
                var total = document.getElementById('total');
                
                if (medicamentos == null)
                {
                    medicamentos = 0;
                }
                if (maodeobra == null)
                {
                    maodeobra = 0;
                }
                if (maquinas == null)
                {
                    maquinas = 0;
                }
                if (dispesas == null)
                {
                    dispesas = 0;
                }
                if (outros == null)
                {
                    outros = 0;
                }
                
                total.innerHTML = parseInt(medicamentos.value) +
                                   parseInt(maodeobra.value) +
                                   parseInt(maquinas.value) +
                                   parseInt(dispesas.value) +
                                   parseInt(outros.value);
            }
            
        </script>
        <%
            String exibegraf = "none";
            if (graf != null) {
                exibegraf = "block";
        %>
        <style type="text/css">
            ${demo.css}
        </style>


        <script type="text/javascript">
            $(function() {
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
                                ['Medicamentos', <%=graf.getMadicamento()%>],
                                ['Mão-de-obra', <%=graf.getMao_de_obra()%>],
                                ['Maquinas', <%=graf.getMaquinas()%>],
                                ['Pastagem', <%=graf.getPastagem()%>],
                                ['Outros', <%=graf.getOutros()%>]
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
                                <li><a href="Lv1-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li><a href="Lv1-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li class="alert-info"> Passo 4 </li><span class="divider"> / </span>
                                <li><a href="Lv1-Saida.jsp" <%=link5%>> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                    <span class="sr-only">80% Completo</span>
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

                <aside class="span1"></aside>

                <aside class="span6">

                    <h2> Custo de Produção </h2>
                    <br/>

                    <form name="Passo4" action="Lv1-Saida.jsp" class="form-horizontal" method ="post" onSubmit="return passo4();">
                        <div class="control-group">
                            <label class="control-label">Medicamentos:</label>
                            <div class="controls">
                                <input type="text" id="medicamentos" name="medicamentos" value="<%=medicamentos%>" >
                                <span>
                                    <button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Medicamento: Vacinas, carrapaticidas, Vermífugos e outros medicamentos;"><i class="icon-info-sign"></i></button>
                                </span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-De-Obra:</label>
                            <div class="controls">
                                <input type="text" id="maodeobra" name="maodeobra" value="<%=maodeobra%>" >
                                <button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Mão de obra: Mão de obra fixa e variável;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Maquinas e Benfeitorias:</label>
                            <div class="controls">
                                <input type="text" id="maquinas" name="maquinas" value="<%=maquinas%>" >
                                <button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Máquinas: Reparos, combustíveis e lubrificantes;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem e Suplementos:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" id="dispesas" name="dispesas" value="<%=dispesas%>" >
                                <button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Pastagens: Sal comum e mineral, rações, sementes, calcário, adubo e defensivos agrícolas;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Outras Despesas:</label>
                            <div class="controls">
                                <input type="text" id="outros" name="outros" value="<%=outros%>">
                                <button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Outros: arrendamento, sêmen, utensílios em geral, fretes, taxas e comissões;"><i class="icon-info-sign"></i></button>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="button" onclick="calcular();" class="btn" value="Calcular" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><b>TOTAL CUSTOS DE PRODUÇÃO:</b></label>
                            <div class="controls">
                                <br/>
                                <span class="uneditable-input" name="total" id="total" ></span> 
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Resultados" />
                                <% if (graf != null) { %>
                                     
                       <a href="#MeuModal" class="btn btn-primary" role="button" data-toggle="modal"> Grafico </a>
                   
                                     <%}%>
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
                                                    <label class="control-label"><h6><b>Área média da Pecuária Aproveitavel: </b><span id="a"><%=  String.format("%.2f", p.getLv1p1().getArea_apro())%></span><span class="help-inline">Hectares</span></h6>
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
                                                    <label class="control-label"><h6><b>Receita por Hectare: </b><span id="c"><%=  String.format("%.2f", p.getLv1p3().getReceita_anual())%></span><span class="help-inline">R$/Hectare</span></h6>
                                                </div>
                                                <br/><br/><br/><br/><br/>
                                            </div>
                                        </div>
                                    </div>
                                </aside>
                                <aside class="span2">
                                    <div>
                                        <div class="panel-group">
                                            <div class="panel panel-warning">
                                                <div class="panel-heading">
                                                    <h5 class="panel-title">Passo 2</h5>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="panel-body">
                                                        <div class="control-group">
                                                            <label class="control-label"><h6><b>Rebanho com atividade de Cria: </b><span id="a"><%=  String.format("%.2f", p.percentualcria())%></span><span class="help-inline">%</span></h6>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label"><h6><b>Lotação Média da Propriedade: </b><span id="b"><%=  String.format("%.2f", p.lotacaomedia())%></span><span class="help-inline">Cabeça(s) por hectare</span></h6>
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
                                    </div>
                                </aside>
                            
                    

                    


                
                   <section id="MeuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="meuModelLabel" aria-hidden="true">
                             <header class="modal-header">
                                 <button class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                 <h3 id="meuModelLabel"> Custos</h3>
                             </header>
                             <section class="modal-body">
                                 
                                <script src="js/highcharts.js"></script>
                                 <script src="js/modules/exporting.js"></script>                                 
                                <div id="container" style="min-width: 410px; height: 300px; max-width: 400px; margin: 0 auto"></div>
                            
                             </section>
                        </section>                      
                     
            </div>
        </div>

    </body>

</html>
