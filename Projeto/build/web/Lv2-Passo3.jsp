<%-- 
    Document   : Lv2-Passo3
    Created on : 30/04/2015, 15:33:31
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Lv2p2"%>
<%@page import="dao.Lv2p2DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv2p3DAO"%>
<%@page import="modelo.Lv2p3"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
if(session.getAttribute("Usuario")!=null)
{
     u = (Usuario)session.getAttribute("Usuario");
     p = (Passos)session.getAttribute("Passos");
     pro = (Propriedade)session.getAttribute("Propriedade");
}
else
{
    response.sendRedirect("index.jsp"); 
}
    
%>
<%
        Lv2p2 b = new Lv2p2();
        b.setVacadecriajanmar(Integer.parseInt(request.getParameter("vacasdecria1")));
        b.setVacadecriaabrjun(Integer.parseInt(request.getParameter("vacasdecria2")));
        b.setVacadecriajulset(Integer.parseInt(request.getParameter("vacasdecria3")));
        b.setVacadecriaoutdez(Integer.parseInt(request.getParameter("vacasdecria4")));

        b.setVacadedescartejanmar(Integer.parseInt(request.getParameter("vacasdedescarte1")));
        b.setVacadedescarteabrjun(Integer.parseInt(request.getParameter("vacasdedescarte2")));
        b.setVacadedescartejulset(Integer.parseInt(request.getParameter("vacasdedescarte3")));
        b.setVacadedescarteoutdez(Integer.parseInt(request.getParameter("vacasdedescarte4")));

        b.setTerneirosjanmar(Integer.parseInt(request.getParameter("terneiros1")));
        b.setTerneirosabrjun(Integer.parseInt(request.getParameter("terneiros2")));
        b.setTerneirosjulset(Integer.parseInt(request.getParameter("terneiros3")));
        b.setTerneirosoutdez(Integer.parseInt(request.getParameter("terneiros4")));
        
        b.setTerneirasjanmar(Integer.parseInt(request.getParameter("terneiras1")));
        b.setTerneirasabrjun(Integer.parseInt(request.getParameter("terneiras2")));
        b.setTerneirasjulset(Integer.parseInt(request.getParameter("terneiras3")));
        b.setTerneirasoutdez(Integer.parseInt(request.getParameter("terneiras4")));
        
        b.setNovilho1324janmar(Integer.parseInt(request.getParameter("novilhos1")));
        b.setNovilho1324abrjun(Integer.parseInt(request.getParameter("novilhos2")));
        b.setNovilho1324julset(Integer.parseInt(request.getParameter("novilhos3")));
        b.setNovilho1324outdez(Integer.parseInt(request.getParameter("novilhos4")));
        
        b.setNovilha1324janmar(Integer.parseInt(request.getParameter("novilhas1")));
        b.setNovilha1324abrjun(Integer.parseInt(request.getParameter("novilhas2")));
        b.setNovilha1324julset(Integer.parseInt(request.getParameter("novilhas3")));
        b.setNovilha1324outdez(Integer.parseInt(request.getParameter("novilhas4")));
        
        b.setNovilho2536janmar(Integer.parseInt(request.getParameter("novilhos11")));
        b.setNovilho2536abrjun(Integer.parseInt(request.getParameter("novilhos22")));
        b.setNovilho2536julset(Integer.parseInt(request.getParameter("novilhos33")));
        b.setNovilho2536outdez(Integer.parseInt(request.getParameter("novilhos44")));
        
        b.setNovilha2536janmar(Integer.parseInt(request.getParameter("novilhas11")));
        b.setNovilha2536abrjun(Integer.parseInt(request.getParameter("novilhas22")));
        b.setNovilha2536julset(Integer.parseInt(request.getParameter("novilhas33")));
        b.setNovilha2536outdez(Integer.parseInt(request.getParameter("novilhas44")));
        
        b.setNovilho36janmar(Integer.parseInt(request.getParameter("novilhos111")));
        b.setNovilho36abrjun(Integer.parseInt(request.getParameter("novilhos222")));
        b.setNovilho36julset(Integer.parseInt(request.getParameter("novilhos333")));
        b.setNovilho36outdez(Integer.parseInt(request.getParameter("novilhos444")));
        
        b.setTourojanmar(Integer.parseInt(request.getParameter("touros1")));
        b.setTouroabrjun(Integer.parseInt(request.getParameter("touros2")));
        b.setTourojulset(Integer.parseInt(request.getParameter("touros3")));
        b.setTourooutdez(Integer.parseInt(request.getParameter("touros4")));

        b.setPropriedade_id(pro.getId());
        b.setAno(p.getAno());
        
        Lv2p2DAO dao = new Lv2p2DAO();
        dao.inserir(b);
        p.setLv2p2(b);
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
        <script>
            function calcularTerneiros()
            {
                if(terneiros1.value == "")
                {
                    terneiros1.focus();
                }
                else if(terneiros2.value == "")
                {
                    terneiros2.focus();
                }
                terneiros3.innerHTML = parseInt(terneiros1.value) * parseInt(terneiros2.value);
            }
            function calcularTerneiras()
            {
                if(terneiras1.value == "")
                {
                    terneiras1.focus();
                }
                else if(terneiras2.value == "")
                {
                    terneiras2.focus();
                }
                terneiras3.innerHTML = parseInt(terneiras1.value) * parseInt(terneiras2.value);
            }
            function calcularNovilhas()
            {
                if(novilhas1.value == "")
                {
                    novilhas1.focus();
                }
                else if(novilhas2.value == "")
                {
                    novilhas2.focus();
                }
                novilhas3.innerHTML = parseInt(novilhas1.value) * parseInt(novilhas2.value);
            }
            function calcularVacdescarte()
            {
                if(vacdescarte1.value == "")
                {
                    vacdescarte1.focus();
                }
                else if(vacdescarte2.value == "")
                {
                    vacdescarte2.focus();
                }
                vacdescarte3.innerHTML = parseInt(vacdescarte1.value) * parseInt(vacdescarte2.value);
            }
            function calcularVacprenha()
            {
                if(vacprenha1.value == "")
                {
                    vacprenha1.focus();
                }
                else if(vacprenha2.value == "")
                {
                    vacprenha2.focus();
                }
                vacprenha3.innerHTML = parseInt(vacprenha1.value) * parseInt(vacprenha2.value);
            }
            function calcularVaccria()
            {
                if(vaccria1.value == "")
                {
                    vaccria1.focus();
                }
                else if(vaccria2.value == "")
                {
                    vaccria2.focus();
                }
                vaccria3.innerHTML = parseInt(vaccria1.value) * parseInt(vaccria2.value);
            }
            function calcularVacgorda()
            {
                if(vacgorda1.value == "")
                {
                    vacgorda1.focus();
                }
                else if(vacgorda2.value == "")
                {
                    vacgorda2.focus();
                }
                vacgorda3.innerHTML = parseInt(vacgorda1.value) * parseInt(vacgorda2.value);
            }
            function calcularNovilhosrecria()
            {
                if(novilhosrecria1.value == "")
                {
                    novilhosrecria1.focus();
                }
                else if(novilhosrecria2.value == "")
                {
                    novilhosrecria2.focus();
                }
                novilhosrecria3.innerHTML = parseInt(novilhosrecria1.value) * parseInt(novilhosrecria2.value);
            }
            function calcularNovilhosgordos()
            {
                if(novilhosgordos1.value == "")
                {
                    novilhosgordos1.focus();
                }
                else if(novilhosgordos2.value == "")
                {
                    novilhosgordos2.focus();
                }
                novilhosgordos3.innerHTML = parseInt(novilhosgordos1.value) * parseInt(novilhosgordos2.value);
            }
            function calcularTorunos()
            {
                if(torunos1.value == "")
                {
                    torunos1.focus();
                }
                else if(torunos2.value == "")
                {
                    torunos2.focus();
                }
                torunos3.innerHTML = parseInt(torunos1.value) * parseInt(torunos2.value);
            }
            function calcularTouros()
            {
                if(touros1.value == "")
                {
                    touros1.focus();
                }
                else if(touros2.value == "")
                {
                    touros2.focus();
                }
                touros3.innerHTML = parseInt(touros1.value) * parseInt(touros2.value);
                
                total1.innerHTML = parseInt(terneiros1.value) + 
                                   parseInt(terneiras1.value) +
                                   parseInt(novilhas1.value) + 
                                   parseInt(vacdescarte1.value) +
                                   parseInt(vacprenha1.value) + 
                                   parseInt(vaccria1.value) + 
                                   parseInt(vacgorda1.value) +
                                   parseInt(novilhosrecria1.value) +
                                   parseInt(novilhosgordos1.value) +
                                   parseInt(torunos1.value) +
                                   parseInt(touros1.value);
                           
                total2.innerHTML = parseInt(terneiros2.value) + 
                                   parseInt(terneiras2.value) +
                                   parseInt(novilhas2.value) + 
                                   parseInt(vacdescarte2.value) +
                                   parseInt(vacprenha2.value) + 
                                   parseInt(vaccria2.value) + 
                                   parseInt(vacgorda2.value) +
                                   parseInt(novilhosrecria2.value) +
                                   parseInt(novilhosgordos2.value) +
                                   parseInt(torunos2.value) +
                                   parseInt(touros2.value);
                           
                total3.innerHTML = total1.innerHTML * total2.innerHTML;     
            }
            
            
        </script>
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
                             <li><a href="AnoLv2.jsp"> Data </a><span class="divider"> / </span></li>
                             <li><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                             <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                             <li class="active"> Passo 3 <span class="divider"> / </span></li>
                             <li><a href="Lv2-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                             <li><a href="Lv2-Saida.jsp"> Resultados </a></li>
                         </ul>
                             <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                    <span class="sr-only">60% Completo</span>
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
                 
                <aside class="span1"></aside>
                
                <aside class="span11">
                    
                    <h2> Receita Anual de Bovinos </h2>
                    <br/>
                    
                    <form name="Passo3" action="Lv2-Passo4.jsp" class="form-horizontal" method ="post" onSubmit="return passo3 ();">
                        <div class="control-group">
                            <label class="control-label">Terneiros:</label>
                		<div class="controls">
                		    <input type="text" name="terneiros1" id="terneiros1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="terneiros2" id="terneiros2" placeholder="Valor Unitário" required onblur="calcularTerneiros()">
                                    <span name="terneiros3" id="terneiros3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Terneiras:</label>
                		<div class="controls">
                		    <input type="text" name="terneiras1" id="terneiras1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="terneiras2" id="terneiras2" placeholder="Valor Unitário" required onblur="calcularTerneiras()">
                                    <span name="terneiras3" id="terneiras3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhas:</label>
                		<div class="controls">
                		    <input type="text" name="novilhas1" id="novilhas1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="novilhas2" id="novilhas2" placeholder="Valor Unitário" required onblur="calcularNovilhas()">
                                    <span name="novilhas3" id="novilhas3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas de Descarte:</label>
                		<div class="controls">
                		    <input type="text" name="vacdescarte1" id="vacdescarte1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="vacdescarte2" id="vacdescarte2" placeholder="Valor Unitário" required onblur="calcularVacdescarte()">
                                    <span name="vacdescarte3" id="vacdescarte3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas Prenhas:</label>
                		<div class="controls">
                		    <input type="text" name="vacprenha1" id="vacprenha1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="vacprenha2" id="vacprenha2" placeholder="Valor Unitário" required onblur="calcularVacprenha()">
                                    <span name="vacprenha3" id="vacprenha3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas com Cria:</label>
                		<div class="controls">
                		    <input type="text" name="vaccria1" id="vaccria1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="vaccria2" id="vaccria2" placeholder="Valor Unitário" required onblur="calcularVaccria()">
                                    <span name="vaccria3" id="vaccria3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas Gordas:</label>
                		<div class="controls">
                		    <input type="text" name="vacgorda1" id="vacgorda1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="vacgorda2" id="vacgorda2" placeholder="Valor Unitário" required onblur="calcularVacgorda()">
                                    <span name="vacgorda3" id="vacgorda3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos para Recria:</label>
                		<div class="controls">
                		    <input type="text" name="novilhosrecria1" id="novilhosrecria1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="novilhosrecria2" id="novilhosrecria2" placeholder="Valor Unitário" required onblur="calcularNovilhosrecria()">
                                    <span name="novilhosrecria3" id="novilhosrecria3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos Gordos:</label>
                		<div class="controls">
                		    <input type="text" name="novilhosgordos1"  id="novilhosgordos1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="novilhosgordos2" id="novilhosgordos2" placeholder="Valor Unitário" required onblur="calcularNovilhosgordos()">
                                    <span name="novilhosgordos3" id="novilhosgordos3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Torunos:</label>
                		<div class="controls">
                		    <input type="text" name="torunos1" id="torunos1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="torunos2" id="torunos2" placeholder="Valor Unitário" required onblur="calcularTorunos()">
                                    <span name="torunos3"  id="torunos3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Touros:</label>
                		<div class="controls">
                		    <input type="text" name="touros1" id="touros1" placeholder="Quantidade(cabeças)" required>
                                    <input type="text" name="touros2" id="touros2" placeholder="Valor Unitário" required onblur="calcularTouros()">
                                    <span name="touros3" id="touros3" placeholder="Valor Total" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">TOTAL:</label>
                		<div class="controls">
                                    <span name="total1" placeholder="Quantidade(cabeças)" id="total1" class="uneditable-input" ></span>
                                    <span name="total2" placeholder="Valor Unitário" id="total2" class="uneditable-input"></span>
                                    <span name="total3" placeholder="Valor Total" id="total3" class="uneditable-input"></span>
                		</div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                		<input type="submit" class="btn" value="Proximo Passo" />
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
