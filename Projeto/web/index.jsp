<%@page import="javax.swing.JOptionPane"%>
<%@page import="modelo.Passos"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%
    String msg = "";
    if (request.getParameter("login") != null) {
        Usuario usuario = new Usuario();

        usuario.setLogin(request.getParameter("login"));
        usuario.setSenha(request.getParameter("senha"));

        UsuarioDAO dao = new UsuarioDAO();
        usuario = dao.login(usuario);

        if (usuario != null) {
            session.setAttribute("Usuario", usuario);
            session.setAttribute("Passos", new Passos());
            //redirecionar para a tela de escolha de níveis
            response.sendRedirect("InicioPropriedade.jsp");
        } else {
            msg = "Login e/ou senha invalidos";
        }

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
                    <a href="Inicio.jsp" class="brand">Fazenda</a>

                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a href="index.jsp"> Usuario </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <header class="page-header"></header>

        <div class="container-fluid">
            <div class="row-fluid"> 
                <aside class="span4"></aside>
                <aside class="span8"><h1>Logar no Site</h1><br/><br/></aside>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span3">

                    <br/><br/><br/>                 

                    <a href="CadastroUsuario.jsp" class="btn"> Novo Usuario </a>

                </aside>

                <aside class="span9">
                    <form name="formulario" action="index.jsp" class="form-horizontal" method ="post" onSubmit="return Cadastro();">
                        <div class="control-group">
                            <label class="danger"><%=msg%></label>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Login: </label>
                            <div class="controls">
                                <input type="text" name="login">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Senha: </label>
                            <div class="controls">
                                <input type="password" name="senha">
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Entrar" />
                                <a href = "TrocarSenha.jsp"class="btn">Esqueci a senha</a>                                
                            </div>                            
                        </div>
                    </form>

                </aside>

            </div>
        </div>
    </body>
</html>
