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
    if (session.getAttribute("Passos") != null) {
        p = (Passos)session.getAttribute("Passos");
    }
    else
    {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);
        
    }
    
    Propriedade pro = new Propriedade ();
    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    p.setAno(request.getParameter("data"));
    
       GraficosDAO daog = new GraficosDAO ();
     Lv2p1 graf = daog.graficolv2p1(pro);
     
  
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
				"Quantidade": "<%=graf.getPastagemanuaisdeinverno() + graf.getPastagemanuaisdeverao ()%>"
					
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
                    "Área da Aproveitável": {
			"Agricultura": {
				"Quantidade": "<%=graf.getAgriculturai() + graf.getAgriculturav ()%>"					
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
		region_p.value = Math.round(region_val );
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
            function calcularPastagem()
            {
               if(pn.value == "")
               {
                   pn.focus();
               }
               else if(pnm.value == "")
               {
                   pnm.focus();
               }
               else if(pcp.value == "")
               {
                   pcp.focus();
               }
               else if(pai.value == "")
               {
                   pai.focus();
               }
               else if(pav.value == "")
               {
                   pav.focus();
               }
               TAREA.innerHTML = parseInt(pn.value) + parseInt(pnm.value) + parseInt(pcp.value) + parseInt(pai.value) + parseInt(pav.value);   
            }
            function calcularAreaAproveitavel()
            {
               if(agriV.value == "")
               {
                   agriV.focus();
               }
               else if(agriI.value == "")
               {
                   agriI.focus();
               }
               else if(florestas.value == "")
               {
                   florestas.focus();
               }
               else if(outras.value == "")
               {
                   outras.focus();
               } 
               taprov.innerHTML = parseInt(pn.value) + 
                              parseInt(pnm.value) + 
                              parseInt(pcp.value) + 
                              parseInt(pai.value) + 
                              parseInt(pav.value) +
                              parseInt(agriV.value) +
                              parseInt(agriI.value) +
                              parseInt(florestas.value) +
                              parseInt(outras.value);
            }
            function calcularTodaArea()
            {
               if(matasnativas.value == "")
               {
                   matasnativas.focus();
               }
               else if(sea.value == "")
               {
                   sea.focus();
               }
               else if(inaproveitavel.value == "")
               {
                   inaproveitavel.focus();
               }
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
                                <li class="active"> Passo 1 <span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Saida.jsp"> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                                    <span class="sr-only">20% Completo</span>
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

               

                <aside class="span8">
                    <h2> Informações </h2>
                    <br/>
                    <form name="Passo1" action="Lv2-Passo2.jsp" class="form-horizontal" method ="post" onSubmit="return passo1();">
                        <div class="control-group">
                            <label class="control-label">Pastagem Nativa:</label>
                            <div class="controls">
                                <input type="text" name="pn" id="pn" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem Nativa Melhorada:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="pnm" id="pnm" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem Cultivada Perene:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="pcp" id="pcp" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem Anuais de Inverno:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="pai" id="pai" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem Anuais de Verão:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="pav" id="pav" required onblur="calcularPastagem();">
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
                                <input type="text" name="agriV" placeholder="No Verão" id="agriV" required>
                                <input type="text" name="agriI" placeholder="No Inverno" id="agriI" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Florestas Plantadas:</label>
                            <div class="controls">
                                <input type="text" name="florestas" id="florestas" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Outras Culturas:</label>
                            <div class="controls">
                                <input type="text" name="outras" id="outras" required onblur="calcularAreaAproveitavel()">
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
                                <input type="text" name="matasnativas" required id="matasnativas">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sede, estradas, Açudes:</label>
                            <div class="controls">
                                <input type="text" name="sea" required id="sea">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Inaproveitável (banhados, pedras, etc):</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="inaproveitavel" required id="inaproveitavel" onblur="calcularTodaArea()">
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
                                <input type="submit" class="btn" value="Proximo Passo" />
                            </div>
                        </div>
                    </form>               

                </aside>
                <asidde class="span4">
                    <div style="display:<%=exibegraf%>">
                    <script src="js/highcharts.js"></script>
                    <script src="js/modules/heatmap.js"></script>
                    <script src="js/modules/treemap.js"></script>
                    <div id="container"></div>
                    </div>
                    
                   
                </asidde>

            </div>
        </div>
        <footer class="footer">
            <div class="container">
            </div>
        </footer>
    </body>

</html>
