<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>

<%@ include file="cabecalho.jsp" %>
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
                <aside class="span8"><h1>Redefinir Senha</h1><br/><br/></aside>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row-fluid">
                
                <aside class="span3"></aside>
                
                <aside class="span9">
                    
                    
                    
                    <form name="formulario2" action="FimCadastroUsuario.jsp" class="form-horizontal" method="post" onSubmit="return Cadastro2();">
                	                	
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
                		<input type="submit" class="btn" value="Redifinir" /> 
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