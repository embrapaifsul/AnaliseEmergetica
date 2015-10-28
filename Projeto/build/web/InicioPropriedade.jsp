
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.PropriedadeDAO"%>
<%@page import="modelo.Lv1p1"%>


<%
    Usuario u = new Usuario();

    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");

    } else {
        response.sendRedirect("index.jsp");
    }
%>
<%
    session.setAttribute("Passos", null);

    PropriedadeDAO dao = new PropriedadeDAO();

    List<Propriedade> lista;

    lista = dao.listar(u);
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
                            <li><a></a></li>
                            <li><a>Usuario: <%=u.getLogin()%></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <header class="page-header"></header>


        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span1"></aside>

                <aside class="span9">
                    <h1>Propriedades</h1>
                    <br/>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Identificação<button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Identificar sua propriedade no sistema."><i class="icon-info-sign"></i></button></th>
                                <th>Cidade</th>
                                <th>UF</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Propriedade registro : lista) {
                            %>
                            <tr class="success">                                  
                                <td><a class="btn btn-link" href="AnoLv1.jsp?pid=<%=registro.getId()%>"><%=registro.getNome()%></a></td>
                                <td><%=registro.getCidade()%></td>
                                <td><%=registro.getUf()%></td>
                                <td>
                                    <a class="btn" href="ExcluirPropriedade.jsp?pid=<%=registro.getId()%>"> Excluir </a></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <br/><br/>                 
                    <a href="CadastroPropriedade.jsp" class="btn"> Nova Propriedade </a>

                </aside>

                <aside class="span2"></aside>
            </div>
        </div>

    </body>
</html>
