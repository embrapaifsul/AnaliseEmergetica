<%-- 
    Document   : FimCadastroUsuario
    Created on : 08/04/2015, 15:22:38
    Author     : big
--%>

<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%

    Usuario usuario = new Usuario();
    usuario.setLogin(request.getParameter("login"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setSenha(request.getParameter("senha"));

    UsuarioDAO dao = new UsuarioDAO();
    Boolean ret = dao.inserir(usuario);
    Usuario usuario2 = new Usuario();
    String msg1;
    String msg;
    usuario2 = dao.login(usuario);

    if (ret == true) {
        msg = "Registro Cadastrado com Sucesso";
    } else {
        msg = "Erro ao Cadastrar";
    }
    if (usuario2 != null) {
        session.setAttribute("Usuario", usuario2);
        //redirecionar para a tela de escolha de níveis
        response.sendRedirect("CadastroPropriedade.jsp");
    } else {
        msg1 = "Login e/ou senha invalidos";
    }
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
                            <li><a> Usuario </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <header class="page-header"></header>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span4">
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                    <p><%=msg%></p>
                    <a href = "index.jsp">Voltar para Listagem</a><br/>
                </aside>

                <aside class="span8">
                    <h1>Cadastro de Usuario</h1>
                </aside>

            </div>
        </div>

        <footer class="footer">
            <div class="container"></div>
        </footer>   

    </body>
</html>

