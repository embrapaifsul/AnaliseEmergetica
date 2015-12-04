<%-- 
    Document   : Lv2-Passo1
    Created on : 30/04/2015, 15:33:00
    Author     : Aluno
--%>

<%@page import="modelo.Lv1p4"%>
<%@page import="dao.GraficosDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv2p1DAO"%>
<%@page import="modelo.Lv2p1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Usuario u = new Usuario();
    Passos p;

    String pn = "", pnm = "", pcp = "", pai = "", pav = "";
    String agriV = "", agriI = "", floresta = "", outras = "";
    String matasnativas = "", sea = "", inaproveitavel = "";

    String link2 = "", link3 = "", link4 = "", link5 = "";

    if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv2p1() != null) {
            pn = p.getLv2p1().getPastagemnativa().toString();
            pnm = p.getLv2p1().getPastagemnativamelhorada().toString();
            pcp = p.getLv2p1().getPastagemcultivadaperene().toString();
            pai = p.getLv2p1().getPastagemanuaisdeinverno().toString();
            pav = p.getLv2p1().getPastagemanuaisdeverao().toString();

            agriV = p.getLv2p1().getAgriculturav().toString();
            agriI = p.getLv2p1().getAgriculturai().toString();

            sea = p.getLv2p1().getSea().toString();
            inaproveitavel = p.getLv2p1().getInaproveitavel().toString();

            outras = p.getLv2p1().getOutrasplantadas().toString();
            floresta = p.getLv2p1().getFlorestaplantadas().toString();
            matasnativas = p.getLv2p1().getMatasnativas().toString();
        }

        if (p.getLv2p2() == null) {
            link2 = " class='inativo' ";
            link3 = " class='inativo' ";
            link4 = " class='inativo' ";
            link5 = " class='inativo' ";

        } else {
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
        }
    } else {
        p = new Passos();
        session.setAttribute("Passos", p);

    }

    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

    GraficosDAO daog = new GraficosDAO();
    Lv2p1 graf = daog.graficolv2p1(pro);


%>

<%@ include file="cabecalho.jsp" %>

<%             String exibegraf = "none";
    if (graf != null) {
        exibegraf = "block";
%>
<style type="text/css">
    #container,#container2{
        min-width: 300px;
        max-width: 600px;
        margin: 0 auto;
    }
</style>
<script type="text/javascript">
    $(function () {
        var data = {
            "Area da Pecuária": {
                "Pastagem Nativa": {
                    "Quantidade": "<%=graf.getPastagemnativa()%>"

                },
                "Pastagem Nativa Melhorada": {
                    "Quantidade": "<%=graf.getPastagemnativamelhorada()%>"

                },
                "Pastagem Cultivada Perene": {
                    "Quantidade": "<%=graf.getPastagemcultivadaperene()%>"

                },
                "Pastagem Anuais": {
                    "Quantidade": "<%=graf.getPastagemanuaisdeinverno() + graf.getPastagemanuaisdeverao()%>"

                }
            },
            "Área Inaproveitável": {
                "Matas Nativas": {
                    "Quantidade": "<%=graf.getMatasnativas()%>"

                },
                "Sede,Estradas,Açudes": {
                    "Quantidade": "<%=graf.getSea()%>"
                },
                "Inaproveitável (Banhados, pedrais, Etc)": {
                    "Quantidade": "<%=graf.getInaproveitavel()%>"
                }
            },
            "Área Aproveitável": {
                "Agricultura": {
                    "Quantidade": "<%=graf.getAgriculturai() + graf.getAgriculturav()%>"
                },
                "Floresta Plantadas": {
                    "Quantidade": "<%=graf.getFlorestaplantadas()%>"
                },
                "Outras Culturas": {
                    "Quantidade": "<%=graf.getOutrasplantadas()%>"
                }
            }




        };
        var points = [],
                region_p,
                region_val,
                region_i,
                country_p,
                country_i,
                cause_p,
                cause_i,
                cause_name = [];
        cause_name['Communicable & other Group I'] = 'Communicable diseases';
        cause_name['Noncommunicable diseases'] = 'Non-communicable diseases';
        cause_name['Injuries'] = 'Injuries';
        region_i = 0;
        for (var region in data) {
            region_val = 0;
            region_p = {
                id: "id_" + region_i,
                name: region,
                color: Highcharts.getOptions().colors[region_i]
            };
            country_i = 0;
            for (var country in data[region]) {
                country_p = {
                    id: region_p.id + "_" + country_i,
                    name: country,
                    parent: region_p.id
                };
                points.push(country_p);
                cause_i = 0;
                for (var cause in data[region][country]) {
                    cause_p = {
                        id: country_p.id + "_" + cause_i,
                        name: cause_name[cause],
                        parent: country_p.id,
                        value: Math.round(+data[region][country][cause])
                    };
                    region_val += cause_p.value;
                    points.push(cause_p);
                    cause_i++;
                }
                country_i++;
            }
            region_p.value = Math.round(region_val);
            points.push(region_p);
            region_i++;
        }
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container'
            },
            series: [{
                    type: "treemap",
                    layoutAlgorithm: 'squarified',
                    allowDrillToNode: true,
                    dataLabels: {
                        enabled: false
                    },
                    levelIsConstant: false,
                    levels: [{
                            level: 1,
                            dataLabels: {
                                enabled: true
                            },
                            borderWidth: 3
                        }],
                    data: points
                }],
            subtitle: {
                text: ''
            },
            title: {
                text: 'Area da Fazenda'
            }
        });
    });



</script>


<%
    }
%>
<script>
    function calcularTodaArea()
    {

        var pn = document.getElementById('pn');
        var pnm = document.getElementById('pnm');
        var pcp = document.getElementById('pcp');
        var pai = document.getElementById('pai');
        var pav = document.getElementById('pav');
        var agriV = document.getElementById('agriV');
        var agriI = document.getElementById('agriI');
        var florestas = document.getElementById('florestas');
        var outras = document.getElementById('outras');
        var matasnativas = document.getElementById('matasnativas');
        var sea = document.getElementById('sea');
        var inaproveitavel = document.getElementById('inaproveitavel');
        var TAREA = document.getElementById('TAREA');
        var taprov = document.getElementById('taprov');
        var areat = document.getElementById('areat');

        if (pn.value == "")
        {
            pn.value = 0.0;
        }
        else if (pnm.value == "")
        {
            pnm.value = 0.0;
        }
        else if (pcp.value == "")
        {
            pcp.value = 0.0;
        }
        else if (pai.value == "")
        {
            pai.value = 0.0;
        }
        else if (pav.value == "")
        {
            pav.value = 0.0;
        }
        if (agriV.value == "")
        {
            agriV.value = 0.0;
        }
        else if (agriI.value == "")
        {
            agriI.value = 0.0;
        }
        else if (florestas.value == "")
        {
            florestas.value = 0.0;
        }
        else if (outras.value == "")
        {
            outras.value = 0.0;
        }
        if (matasnativas.value == "")
        {
            matasnativas.value = 0.0;
        }
        else if (sea.value == "")
        {
            sea.value = 0.0;
        }
        else if (inaproveitavel.value == "")
        {
            inaproveitavel.value = 0.0;
        }

        TAREA.innerHTML = parseInt(pn.value) +
                parseInt(pnm.value) +
                parseInt(pcp.value) +
                parseInt(pai.value) +
                parseInt(pav.value);

        taprov.innerHTML = parseInt(pn.value) +
                parseInt(pnm.value) +
                parseInt(pcp.value) +
                parseInt(pai.value) +
                parseInt(pav.value) +
                parseInt(agriV.value) +
                parseInt(agriI.value) +
                parseInt(florestas.value) +
                parseInt(outras.value);

        areat.innerHTML = parseInt(pn.value) +
                parseInt(pnm.value) +
                parseInt(pcp.value) +
                parseInt(pai.value) +
                parseInt(pav.value) +
                parseInt(agriV.value) +
                parseInt(agriI.value) +
                parseInt(florestas.value) +
                parseInt(outras.value) +
                parseInt(matasnativas.value) +
                parseInt(sea.value) +
                parseInt(inaproveitavel.value);
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
                            <li class="alert-info"> Passo 1 </li><span class="divider"> / </span>
                            <li><a href="Lv2-Passo2.jsp" <%=link2%>> Passo 2 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo3.jsp" <%=link3%>> Passo 3 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo4.jsp" <%=link4%>> Passo 4 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Saida.jsp" <%=link5%>> Resultados </a></li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                                <span class="sr-only">20% Completo</span>
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



            <aside class="span8">
                <h2> Informações </h2>
                <br/>
                <form name="Passo1" action="Lv2-Passo2.jsp" class="form-horizontal" method ="post" onSubmit="return passo1();">
                    <div class="control-group">
                        <label class="control-label">Pastagem Nativa:</label>
                        <div class="controls">
                            <input type="text" name="pn" id="pn" value="<%=pn%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Pastagem Nativa Melhorada:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="pnm" id="pnm" value="<%=pnm%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Pastagem Cultivada Perene:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="pcp" id="pcp" value="<%=pcp%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Pastagem Anuais de Inverno:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="pai" id="pai" value="<%=pai%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Pastagem Anuais de Verão:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="pav" id="pav" value="<%=pav%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><b>TOTAL ÁREA DA PECUÁRIA:</b></label>
                        <div class="controls">
                            <br/>
                            <span class="uneditable-input" name="TAREA" id="TAREA"></span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Agricultura:</label>
                        <div class="controls">
                            <input type="text" name="agriV" placeholder="No Verão" id="agriV" value="<%=agriV%>">
                            <input type="text" name="agriI" placeholder="No Inverno" id="agriI" value="<%=agriI%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Florestas Plantadas:</label>
                        <div class="controls">
                            <input type="text" name="florestas" id="florestas" value="<%=floresta%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Outras Culturas:</label>
                        <div class="controls">
                            <input type="text" name="outras" id="outras" value="<%=outras%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><b>TOTAL ÁREA APROVEITÁVEL:</b></label>
                        <div class="controls">
                            <br/>
                            <span class="uneditable-input" name="TAPROV" id="taprov" ></span> 
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Matas Nativas:</label>
                        <div class="controls">
                            <input type="text" name="matasnativas" value="<%=matasnativas%>" id="matasnativas">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Sede, estradas, Açudes:</label>
                        <div class="controls">
                            <input type="text" name="sea" value="<%=sea%>" id="sea">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Inaproveitável (banhados, pedras, etc):</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="inaproveitavel" value="<%=inaproveitavel%>" id="inaproveitavel">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><b>ÁREA TOTAL:</b></label>
                        <div class="controls">
                            <span name="AREAT" class="uneditable-input" id="areat"></span>   
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="button" onclick="calcularTodaArea();" class="btn" value="Calcular" />
                               <% if (graf != null) { %>

                            <a href="#MeuModal" class="btn btn-primary" role="button" data-toggle="modal"> Grafico </a>

                            <%}%>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="submit" class="btn" value="Proximo Passo" />
                           
                        </div>
                       
                    </div>
                </form>               

            </aside>
            

        </div>
    </div>
                     <section id="MeuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="meuModelLabel" aria-hidden="true">
                <header class="modal-header">
                    <button class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h3 id="meuModelLabel"> Aréa da Propriedade</h3>
                </header>
                <section class="modal-body">
             
                <div style="display:<%=exibegraf%>">
                    <script src="js/highcharts.js"></script>
                    <script src="js/modules/heatmap.js"></script>
                    <script src="js/modules/treemap.js"></script>
                    <div id="container"></div>
                </div>



                </section>
            </section>       
    <footer class="footer">
        <div class="container">
        </div>
    </footer>
</body>

</html>