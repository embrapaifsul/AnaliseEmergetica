<%-- 
    Document   : Lv1-Passo1
    Created on : 28/04/2015, 16:00:56
    Author     : Aluno
--%>

<%@page import="modelo.Lv1Resultado"%>
<%@page import="dao.Lv1ResultadoDAO"%>
<%@page import="dao.PropriedadeDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Lv1p1"%>


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

    
    Lv1Resultado res = new Lv1Resultado();
    Lv1ResultadoDAO dao = new Lv1ResultadoDAO();
    
    res = dao.media();
   
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
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <style type="text/css">
            ${demo.css}
        </style>
        <script type="text/javascript">
            $(function () {
                $('#container1').highcharts({
                    data: {
                        table: 'datatable1'
                    },
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Área'
                    },
                    yAxis: {
                        allowDecimals: false,
                        title: {
                            text: 'Dados'
                        }
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.point.y + ' ' + this.point.name.toLowerCase();
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $('#container2').highcharts({
                    data: {
                        table: 'datatable2'
                    },
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Bovinos'
                    },
                    yAxis: {
                        allowDecimals: false,
                        title: {
                            text: 'Dados'
                        }
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.point.y + ' ' + this.point.name.toLowerCase();
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $('#container3').highcharts({
                    data: {
                        table: 'datatable3'
                    },
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Custo'
                    },
                    yAxis: {
                        allowDecimals: false,
                        title: {
                            text: 'Dados'
                        }
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.point.y + ' ' + this.point.name.toLowerCase();
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $('#container4').highcharts({
                    data: {
                        table: 'datatable4'
                    },
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Gasto'
                    },
                    yAxis: {
                        allowDecimals: false,
                        title: {
                            text: 'Dados'
                        }
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.point.y + ' ' + this.point.name.toLowerCase();
                        }
                    }
                });
            });
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
                    <a class="brand">Fazenda</a>

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
                            <li><a>Nivel: 1</a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a>Usuario: <%=u.getLogin()%></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <header class="page-header"></header> 
        

        <script src="js/highcharts.js"></script>
        <script src="js/modules/data.js"></script>
        <script src="js/modules/exporting.js"></script>

        
        <div class="container-fluid">
            <br/><br/>
            <div class="row-fluid">
                <aside class="span1">
                </aside>
                <aside class="span6">
                    <h3>Comparação de Dados</h3>
                    <br/><br/>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th></th>
                    <th>Você</th>
                    <th>Outros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Aréa</th>
                    <td><%=p.custohectar()%></td>
                    <td><%=res.getCustohectar()%></td>
                </tr>
                <tr>
                    <th>Bovinos</th>
                    <td><%=p.lotacaomedia()%></td>
                    <td><%=res.getLotacaomedia()%></td>
                </tr>    
                <tr>
                    <th>Custo</th>
                    <td><%=p.receitahectar()%></td>
                    <td><%=res.getReceitahectar()%></td>
                </tr>
                <tr>
                    <th>Gasto</th>
                    <td><%=p.totalcustoproducao()%></td>
                    <td><%=res.getTotalcustoproducao()%></td>
                </tr>
            </tbody>
        </table>
                </aside>
            </div>
        </div>
        
        <div class="container-fluid">
            <br/><br/><br/><br/>
            <div class="row-fluid">
                <aside class="span6">
                    <div id="container1" style="width: 450px; height: 320px; margin: 0 auto"></div>
                </aside>
                <aside class="span6">
                    <div id="container2" style="width: 450px; height: 320px; margin: 0 auto"></div>
                </aside>
            </div>
        </div>
        <div class="container-fluid">
            <br/><br/><br/><br/>
            <div class="row-fluid">
                <aside class="span6">
                    <br/><br/>
                    <div id="container3" style="width: 450px; height: 320px; margin: 0 auto"></div>
                </aside>
                <aside class="span6">
                    <br/><br/>
                    <div id="container4" style="width: 450px; height: 320px; margin: 0 auto"></div>
                </aside>
            </div>
        </div>
        
        <table id="datatable1" class="table table-bordered" style="display:none">
            <thead>
                <tr>
                    <th>Você</th>
                    <th>Outros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Aréa</th>
                    <td><%=p.custohectar()%></td>
                    <td><%=res.getCustohectar()%></td>
                </tr>
            </tbody>
        </table>
        <table id="datatable2" class="table table-bordered" style="display:none">        
            <thead>
                <tr>
                    <th>Você</th>
                    <th>Outros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Bovinos</th>
                    <td><%=p.lotacaomedia()%></td>
                    <td><%=res.getLotacaomedia()%></td>
                </tr>
            </tbody>
        </table>
        <table id="datatable3" class="table table-bordered" style="display:none">
            <thead>
                <tr>
                    <th>Você</th>
                    <th>Outros</th>
                </tr>
            </thead>
            <tbody>    
                <tr>
                    <th>Custo</th>
                    <td><%=p.receitahectar()%></td>
                    <td><%=res.getReceitahectar()%></td>
                </tr>
            </tbody>
        </table>
        <table id="datatable4" class="table table-bordered" style="display:none">
            <thead>
                <tr>
                    <th>Você</th>
                    <th>Outros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Gasto</th>
                    <td><%=p.totalcustoproducao()%></td>
                    <td><%=res.getTotalcustoproducao()%></td>
                </tr>
            </tbody>
        </table>
           
        <div class="container-fluid">
            <div class="row-fluid">
                <aside class="span1"></aside>
                <aside class="span1">
                    <br/><br/><br/>
                    <a href="Lv1-Saida.jsp" class="btn"> Voltar </a>
                    <br/><br/><br/>
                </aside>
            </div>
        </div>
        
    </body>

</html>

