<%-- 
    Document   : CadastroUsuario
    Created on : 08/04/2015, 15:24:36
    Author     : big
--%>

<%@page import="java.util.Calendar"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.PropriedadeDAO"%>
<%@page import="modelo.Propriedade"%>
<%
    Usuario u = new Usuario();
    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<%
    Propriedade pro = new Propriedade();
    pro.setNome(request.getParameter("nomepro"));
    pro.setCidade(request.getParameter("cidade"));
    pro.setUf(request.getParameter("uf"));
    pro.setUsuario_id(u.getId());
    PropriedadeDAO dao = new PropriedadeDAO();
    Boolean ret = dao.inserir(pro);

    Propriedade pro1 = dao.loginpro2(pro);

    //Vou criar um novo "Passos"
    Passos passos = new Passos();
    Integer year = Calendar.getInstance().get(Calendar.YEAR);
    year--;
    passos.setAno(year.toString());

    session.setAttribute("Passos", passos);
    session.setAttribute("Propriedade", pro1);

    String msg;
    if (ret == true) {
        msg = "Registro Cadastrado com Sucesso";
        response.sendRedirect("Lv1-Passo1.jsp");
    } else {
        msg = "Erro ao Cadastrar";
    }

%>
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
                    <!-- .btn-navbar est� classe � usada como alternador para o conteudo coplapsavel-->
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
                            <li><a></a></li>
                            <li><a href="InicioPropriedade.jsp"> Usuario </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span4">
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                    <p><%=msg%></p>
                    <a href = "InicioPropriedade.jsp">Voltar para Listagem</a><br/>
                </aside>

                <aside class="span8">
                    <h1>Cadastro de Propriedade</h1>
                </aside>

            </div>
        </div>

        <footer class="footer">
            <div class="container"></div>
        </footer>   

    </body>
</html>