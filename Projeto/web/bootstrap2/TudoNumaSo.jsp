<%-- 
    Document   : TudoNumaSo
    Created on : 30/04/2015, 14:58:31
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li><a href="InicioUsuario.jsp"> Usuario </a></li>
                            <li><a href="Lv1-Passo1.jsp"> Nivel 1 </a></li>
                            <li><a href=""> Nivel 2 </a></li>
                            <li><a href=""> Nivel 3 </a></li>
                            <li><a href=""> Nivel 4 </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        
        <header class="page-header"></header>
        
        </div>
        
        <div class="container-fluid">
            <div class="row-fluid">
                 
                <aside class="span3"></aside>
                
                <aside class="span9">
                    <header class="page-header">
                        <h2> Informações </h2>
                    </header>
                    <br/>
                    <form name="Passo1" action="Lv1-Passo2.jsp" class="form-horizontal" method ="post" onSubmit="return passo1();">
                        <div class="control-group">
                            <label class="control-label">Área média da Pecuária Aproveitavel:</label>
                		<div class="controls">
                                        <br/>
                			<input type="text" name="areapecuaria">
                                        <span class="help-inline">Hectares</span>
                		</div>
                        </div>
                        <br/><br/><br/>
                    </form>
                    
                    <header class="page-header">
                        <h2> Rebanho Bovino </h2>
                    </header>
                    
                    <form name="passo2" action="Lv1-Passo3.jsp" class="form-horizontal" method ="post" onSubmit="return passo2 ();">
                        <div class="control-group">
                            <label class="control-label">Você sabe o total do seu rebanho bovino?</label><br/>
                		<div class="controls">
                                    <input type="radio" name="saberquantibov" value="true"> Sim 
                                    <input type="radio" name="saberquantibov" value="false"> Não
                		</div>
                        </div>
                        <br/><br/><br/>
                    </form>
                    
                    <header class="page-header">
                        <h2> Receitas Anuais </h2>
                    </header>
                    
                    <form name="Passo3" action="Lv1-Passo4.jsp" class="form-horizontal" method ="post" onSubmit="return passo3 ();">
                        <div class="control-group">
                            <label class="control-label">Receita Anual de Bovinos:</label>
                		<div class="controls">
                                    <br/>
                		    <input type="text" name="bovinos">
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Receita por Hectar:</label>
                		<div class="controls">                                   
                                    <input type="text" name="receitaporhectar" disabled="">                                   
                		</div>
                        </div>
                        <br/><br/><br/>
                    </form>
                    
                    <header class="page-header">
                        <h2> Custo de Produção </h2>
                    </header>
                    
                    <form name="Passo4" action="" class="form-horizontal" method ="post" onSubmit="return passo4 ();">
                        <div class="control-group">
                            <label class="control-label">Medicamentos:</label>
                		<div class="controls">
                			<input type="text" name="medicamentos">
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-De-Obra:</label>
                		<div class="controls">
                			<input type="text" name="maodeobra">
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Maquinas e Bens Feitorias:</label>
                		<div class="controls">
                                    <br/>
                		    <input type="text" name="maquinas">
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Pastagem e Dispesas:</label>
                		<div class="controls">
                			<input type="text" name="dispesas">
                		</div>
                        </div>
                        <br/><br/>
                        <div class="control-group">
                            <div class="controls">
                		<input type="submit" class="btn" value="Enviar Informações" />
                            </div>
                	</div>
                    </form>
                    
                </aside>
                 
            </div>
        </div>
        <footer class="footer">
           <div class="container"></div>
        </footer> 
    </body>
</html>