
<%@page import="modelo.Passos"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>S.I.S.A.F.E</title>
            <link rel="stylesheet" type="text/css" href="style.css"/>
            <link href='http://fonts.googleapis.com/css?family=Raleway:400,200,300,600,700,800' rel='stylesheet' type='text/css'>
                <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300,200' rel='stylesheet' type='text/css'>
                    <link href="css/font-awesome.min.css" rel="stylesheet" media="screen">
                        <link href="css/responsive.css" rel="stylesheet" media="screen" type="text/css"/>
                        <link rel="stylesheet" href="sidr/stylesheets/jquery.sidr.dark.css">


                            <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css">


                                <script src="js/jquery.min.js"></script>
                                <script src="sidr/jquery.sidr.min.js"></script>
                                <script type="text/javascript" src="js/smoothscroll.js"></script>

                                </head>
                                <body>


                                    <style >

                                        .maginsLeftZero{

                                            margin-left:   0%;
                                        }
                                        .maginsRightZero{

                                            margin-right:    0%;
                                        }
                                        .trintaEtres{

                                            margin-left: 33%;
                                        }


                                    </style>

                                    <div class="header">
                                        <div class="container">
                                            <div class="logo-menu">
                                                <div class="logo">
                                                    <h1><a href="#">S.I.S.A.F.E</a></h1>
                                                </div>
                                                <!--<a id="simple-menu" href="#sidr">Toggle menu</a>-->
                                                <div id="mobile-header">
                                                    <a class="responsive-menu-button" href="#"><img src="images/11.png"/></a>
                                                </div>
                                                <div class="menu" id="navigation">
                                                    <ul>
                                                        <li><a href="#">Home</a></li>
                                                        <li><a href="#sobre">Sobre</a></li>
                                                        <li><a href="#desenvolvedores">Desenvolvedores</a></li>
                                                        <li><a href="#contato">Contato</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="banner">
                                        <div class="container1">
                                            <div class="maginsRightZero"></div> 

                                            <div id="formLogin" class="trintaEtres">
                                                <form name="formulario" action="index.jsp" class="form-horizontal" method ="post" onSubmit="return Cadastro();">
                                                    <div class="control-group">
                                                        <label class="danger"><%=msg%></label>
                                                    </div>
                                                    <div class="control-group">                                                   
                                                        <div class="controls">
                                                            <input type="text" placeholder="Login" name="login" style="margin-top: 10px; margin-bottom:  10px">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">

                                                        <div class="controls">
                                                            <input type="password" placeholder="Senha" name="senha" style="margin-top: 10px">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <div class="controls">
                                                            <input type="submit" class="btn" value="Entrar" />

                                                        </div> 

                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="color-border">
                                    </div>

                                    <div class="desc">
                                        <div class="container">
                                            <h2> A falta de Recursos</h2>
                                            <p>É cada dia mais evidente o desafio representado pela necessidade de se produzir alimentos para atender uma população
                                                crescente em um mundo de fontes de energia e recursos finitos. Desta forma, conciliar a produção e conservação de
                                                recursos naturais acaba sendo um problema. É necessário entender de que forma é possível considerar que agricultura
                                                moderna se alicerça em agroecossistemas pretensamente controlados pelo homem e continuam a manter a dependência
                                                de insumos provenientes da natureza e da indústria.</p>
                                        </div>
                                    </div>

                                    <div class="features" id="sobre">
                                        <div class="container">
                                            <h3 class="text-head">S.I.S.A.F.E</h3>
                                            <div class="features-section">
                                                <ul>
                                                    <li>
                                                        <div class="feature-icon icon1"></div>
                                                        <h4>Analise Financeira</h4>
                                                        <p>Tendo em vista ajudar o produtor em sua tomada de decisão, o software faz uma analise financeira da propriedade do agricultor, deixando mais claro se vale a pena reutilizar seus recursos.</p>
                                                    </li>
                                                    <li>
                                                        <div class="feature"></div>
                                                        <h4></h4>
                                                        <p></p>
                                                    </li>
                         
                                                    <li>
                                                        <div class="feature-icon icon2"></div>
                                                        <h4>Analise Emergetica</h4>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="stories" id="desenvolvedores">
                                        <div class="container">
                                            <h3 class="text-head">Equipe de desenvolvimento</h3>
                                            <p class="box-desc">Na istituição IFSUL, campus bagé, está sedo desenvolvido um projeto onde alunos junto com professores elaboram projetos.</p>
                                            <div class="stories-section">
                                                <ul>
                                                    <li>
                                                        <a href="#">
                                                            <div class="story-img"><img src="images/story1.png"/></div>
                                                            <div class="story-box">
                                                                <h4>Estudandes</h4>
                                                                <p>Os etudandes do IFSUl campus Bagé, participam do projeto como bolsistas, criando o sistema em parceria com a embrapa. </p>

                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="story-img"><img src="images/story2.png"/></div>
                                                            <div class="story-box">
                                                                <h4>Orientadores</h4>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>

                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="story-img"><img src="images/story3.png"/></div>
                                                            <div class="story-box">
                                                                <h4>Consultor</h4>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia mi nulla, in imperdiet arcu hendrerit in.</p>

                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="contact" id="contato">
                                        <div class="container">
                                            <h3 class="text-head">Contato</h3>
                                            <p class="box-desc">Se hover duvida ou erros, por favor nos informar.</p>
                                            <div class="contact-section">

                                                <form>
                                                    <input type="text" name="Name" placeholder="Nome" />
                                                    <input type="email" name="email" placeholder="Email"/>
                                                    <textarea placeholder="Mensagem" rows="6"></textarea>
                                                    <button type="submit" class="submit">Enviar</button>
                                                </form>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="color-border">
                                    </div>
                                    <div class="footer">
                                        <div class="container">
                                            <div class="infooter">
                                                <p class="copyright">Copyright &copy; Extant 2014 by <a class="credit"href="http://www.html5layouts.com">HTML5 Layouts</a></p>
                                            </div>
                                            <ul class="socialmedia">
                                                <li><a href=""><i class="icon-twitter"></i></a></li>
                                                <li><a href=""><i class="icon-facebook"></i></a></li>
                                                <li><a href=""><i class="icon-dribbble"></i></a></li>
                                                <li><a href=""><i class="icon-linkedin"></i></a></li>
                                                <li><a href=""><i class="icon-instagram"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
                                    <script type="text/javascript">
                                                    $(document).ready(function () {
                                                        $('#simple-menu').sidr({
                                                            side: 'right'
                                                        });
                                                    });
                                                    $('.responsive-menu-button').sidr({
                                                        name: 'sidr-main',
                                                        source: '#navigation',
                                                        side: 'right'

                                                    });
                                                    $(document).ready(
                                                            function () {
                                                                $("html").niceScroll({cursorborder: "0px solid #fff", cursorwidth: "5px", scrollspeed: "70"});
                                                            }
                                                    );
                                    </script>
                                </body>
</html>