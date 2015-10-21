<%-- 
    Document   : CadastroUsuario
    Created on : 08/04/2015, 15:24:36
    Author     : big
--%>

<%@page import="modelo.Usuario"%>
<%
    Usuario u = new Usuario();

    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
    } else {
        response.sendRedirect("index.jsp");
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
                            <li><a href="InicioPropriedade.jsp"> Usuario </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <header class="page-header"></header>

        <div class="container-fluid">
            <div class="row-fluid"> 
                <aside class="span4"></aside>
                <aside class="span8"><h1>Cadastro de Propriedade</h1><br/><br/></aside>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span3"></aside>

                <aside class="span9">



                    <form name="formulario2" action="FimCadastroPropriedade.jsp" class="form-horizontal" method ="post" onSubmit="return Cadastro2();">
                        <div class="control-group">  
                            <label class="control-label">Nome:</label>
                            <div class="controls">      
                                <input type="text" name="nomepro" required>        
                            </div>         
                        </div>
                        <div class="control-group">
                            <label class="control-label">Cidade:</label>
                            <div class="controls">
                                <input type="text" name="cidade" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">UF:</label>
                            <div class="controls">
                                <input type="text" name="uf" required>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Cadastrar" /> 
                                <input type="reset" class="btn" value="Limpar" /> 
                            </div>
                        </div>

                    </form>
                </aside>

            </div>
        </div>

    </body>
</html>
