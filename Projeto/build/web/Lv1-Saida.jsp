<%-- 
    Document   : Lv1-Saida
    Created on : 30/04/2015, 15:33:55
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv1p4DAO"%>
<%@page import="modelo.Lv1p4"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null  ){
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
%>
    

<%
        Lv1p4 lv1p4 = new Lv1p4();
        
        
    if (request.getParameter("medicamentos").equals("")) {
        
        lv1p4.setMadicamento(00.0);
    } else {
        lv1p4.setMadicamento(Double.parseDouble(request.getParameter("medicamentos")));
    }
    
    if (request.getParameter("maodeobra").equals("")) {
        lv1p4.setMao_de_obra(00.0);
    } else {
        lv1p4.setMao_de_obra(Double.parseDouble(request.getParameter("maodeobra")));
    }
    
    if (request.getParameter("maquinas").equals("")) {
        lv1p4.setMaquinas(00.0);
    } else {
        lv1p4.setMaquinas(Double.parseDouble(request.getParameter("maquinas")));
    }
    
    if (request.getParameter("dispesas").equals("")) {
        lv1p4.setPastagem(00.0);
    } else {
        lv1p4.setPastagem(Double.parseDouble(request.getParameter("dispesas")));
    }
    
    if (request.getParameter("outros").equals("")) {
        lv1p4.setOutros(00.0);
    } else {
        lv1p4.setOutros(Double.parseDouble(request.getParameter("outros")));
    }
        
        lv1p4.setPropiedade_id(pro.getId());
        lv1p4.setAno(p.getAno());
        
        Lv1p4DAO dao = new Lv1p4DAO();
        dao.inserir(lv1p4);
        p.setLv1p4(lv1p4);
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
                            <li><a></a></li>
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
        
        <div class="container-fluid">
            <div class="row-fluid">
                 
                <aside class="span10">
                    <section id="breadcrumbs">
                         <header class="page-header">
                             <h3> Progresso </h3>
                         
                         <ul class="breadcrumb">
                             <li><a href="AnoLv1.jsp"> Data </a><span class="divider"> / </span></li>
                             <li><a href="Lv1-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                             <li><a href="Lv1-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                             <li><a href="Lv1-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                             <li><a href="Lv1-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                             <li class="alert-error"> Resultados </li>
                         </ul>
                             <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                    <span class="sr-only">100% Completo</span>
                                </div>
                            </div>
                         </header>
                     </section><br/><br/>
                </aside>
                
                <aside class="span2"></aside>
                
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row-fluid">
                 
                <aside class="span3"></aside>
                
                <aside class="span9">
                    
                    <h2> Custo de Produção </h2>
                    <br/>
                    
                    <form name="Passo4" action="InicioPropriedade.jsp" class="form-horizontal" method ="post" onSubmit="return passo4 ();">
                        
                        <div class="control-group">
                            <label class="control-label">Lotação Média da Propriedade:</label>
                		<div class="controls">
                                    <br/>
                			<input type="text" name="lotaçaomedia"  class="uneditable-input" value="<%=p.lotacaomedia()%>">
                                        <span class="help-inline">Cabeça(s) por hectare</span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Receita por Hectare:</label>
                		<div class="controls">
                                    <input type="text" name="receitahectare"  class="uneditable-input" value="<%=p.receitahectar()%>">
                                        <span class="help-inline">R$/Hectare</span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Total dos Custos de Produção:</label>
                		<div class="controls">
                                        <br/>
                			<input type="text" name="totalproduçao"  class="uneditable-input" value="<%=p.totalcustoproducao()%>">
                                        <span class="help-inline">R$</span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Custo de Produção por Hectar:</label>
                		<div class="controls">
                                    <br/>
                			<input type="text" name="custohectar"  class="uneditable-input" value="<%=p.custohectar()%>">
                                        <span class="help-inline">R$/Hectare</span>
                		</div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Ir Para o Inicio" />
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
