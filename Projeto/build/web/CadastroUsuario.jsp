<%-- 
    Document   : CadastroUsuario
    Created on : 08/04/2015, 15:24:36
    Author     : big
--%>

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
                <aside class="span8"><h1>Cadastro de Usuario</h1><br/><br/></aside>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row-fluid">
                
                <aside class="span3"></aside>
                
                <aside class="span9">
                    
                    
                    
                    <form name="formulario2" action="FimCadastroUsuario.jsp" class="form-horizontal" method ="post" onSubmit="return Cadastro2 ();">
                	<div class="control-group">
                		<label class="control-label">Login: </label>
                		<div class="controls">
                			<input type="text" name="login">
                		</div>
                	</div>
                	<div class="control-group">
                		<label class="control-label">E-mail: </label>
                		<div class="controls">
                			<input type="text" name="email">
                		</div>
                	</div>
                	<div class="control-group">
                		<label class="control-label">Senha: </label>
                		<div class="controls">
                			<input type="password" name="senha">
                		</div>
                	</div>
                        <div class="control-group">
                		<label class="control-label">Confirmação Senha: </label>
                		<div class="controls">
                			<input type="password" name="confsenha">
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
                
        <footer class="footer">
           <div class="container">
           </div>
        </footer> 
        
    </body>
</html>
