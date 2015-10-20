<%-- 
    Document   : Lv1-Passo1
    Created on : 28/04/2015, 16:00:56
    Author     : Aluno
--%>

<%@page import="dao.Lv2ResultadoDAO"%>
<%@page import="modelo.Lv2Resultado"%>
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

    Lv2Resultado res = new Lv2Resultado();
    Lv2ResultadoDAO dao = new Lv2ResultadoDAO();
            
    res = dao.media();
    
    res.getAreaaproveitavel();
    res.getAreamedia();
    res.getCustoatividadecria1();
    res.getCustoproducaohectar1();
    res.getCustotalproducao();
    res.getCustoterneiro();
    res.getLotacaomedia2();
    res.getPercentualrebanhocomcria();
    res.getReceitahectar2();
    res.getTotalreceita();
    
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
                $('#container').highcharts({
                    data: {
                        table: 'datatable'
                    },
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Comparação de você com os outros usuarios.'
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
                            <li><a>Nivel: 1</a></li>
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

        <br/><br/><br/>

        <script src="js/highcharts.js"></script>
        <script src="js/modules/data.js"></script>
        <script src="js/modules/exporting.js"></script>

        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        <div class="container-fluid">
            <div class="row-fluid">
                <aside class="span1"></aside>
                <aside class="span5">

                    <table id="datatable" class="table table-bordered">
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
                                <td><%=p.areamedia()%></td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <th>Bovinos</th>
                                <td><%=p.totalrebanho2()%></td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <th>Custo</th>
                                <td><%=p.totalreceita()%></td>
                                <td>11</td>
                            </tr>
                            <tr>
                                <th>Gasto</th>
                                <td><%=p.custotalproducao()%></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>

                </aside>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <aside class="span1"></aside>
                <aside class="span1">
                    <br/><br/>
                    <a href="Lv2-Saida.jsp" class="btn"> Voltar </a>
                </aside>
            </div>
        </div>

    </body>

</html>
