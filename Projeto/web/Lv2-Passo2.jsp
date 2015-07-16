<%-- 
    Document   : Lv2-Passo2
    Created on : 30/04/2015, 15:33:14
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv2p1DAO"%>
<%@page import="modelo.Lv2p1"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv2p2DAO"%>
<%@page import="modelo.Lv2p2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null  )
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
        Lv2p1 a = new Lv2p1();
        a.setPastagemnativa(Double.parseDouble(request.getParameter("pn")));
        a.setPastagemnativamelhorada(Double.parseDouble(request.getParameter("pnm")));
        a.setPastagemcultivadaperene(Double.parseDouble(request.getParameter("pcp")));
        a.setPastagemanuaisdeinverno(Double.parseDouble(request.getParameter("pai")));
        a.setPastagemanuaisdeverao(Double.parseDouble(request.getParameter("pav")));
        a.setAgriculturav(Double.parseDouble(request.getParameter("agriV")));
        a.setAgriculturai(Double.parseDouble(request.getParameter("agriI")));
        a.setFlorestaplantadas(Double.parseDouble(request.getParameter("florestas")));
        a.setOutrasplantadas(Double.parseDouble(request.getParameter("outras")));
        a.setMatasnativas(Double.parseDouble(request.getParameter("matasnativas")));
        a.setSea(Double.parseDouble(request.getParameter("sea")));
        a.setInaproveitavel(Double.parseDouble(request.getParameter("inaproveitavel")));
        a.setPropriedade_id(pro.getId());
        a.setAno(p.getAno());

        Lv2p1DAO dao = new Lv2p1DAO();
        dao.inserir(a);
        p.setLv2p1(a);
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
            function calcularJanMar()
            {
                if(vacasdecria1.value == "")
                {
                    vacasdecria1.focus();
                }
                else if(vacasdedescarte1.value == "")
                {
                    vacasdedescarte1.focus();
                }
                else if(terneiros1.value == "")
                {
                    terneiros1.focus();
                }
                else if(terneiras1.value == "")
                {
                    terneiras1.focus();
                }
                else if(novilhos1.value == "")
                {
                    novilhos1.focus();
                }
                else if(novilhas1.value == "")
                {
                    novilhas1.focus();
                }
                else if(novilhos11.value == "")
                {
                    novilhos11.focus();
                }
                else if(novilhas11.value == "")
                {
                    novilhas11.focus();
                }
                else if(novilhos111.value == "")
                {
                    novilhos111.focus();
                }
                else if (touros1.value == "")
                {
                    touros1.focus();
                }
                total1.innerHTML = parseInt(vacasdecria1.value) +
                                   parseInt(vacasdedescarte1.value) +
                                   parseInt(terneiros1.value) +
                                   parseInt(terneiras1.value) +
                                   parseInt(novilhos1.value) +
                                   parseInt(novilhas1.value) + 
                                   parseInt(novilhos11.value) + 
                                   parseInt(novilhas11.value) + 
                                   parseInt(novilhos111.value) +
                                   parseInt(touros1.value);
            }
            function calcularAbrJun()
            {
                if(vacasdecria2.value == "")
                {
                    vacasdecria2.focus();
                }
                else if(vacasdedescarte2.value == "")
                {
                    vacasdedescarte2.focus();
                }
                else if(terneiros2.value == "")
                {
                    terneiros2.focus();
                }
                else if(terneiras2.value == "")
                {
                    terneiras2.focus();
                }
                else if(novilhos2.value == "")
                {
                    novilhos2.focus();
                }
                else if(novilhas2.value == "")
                {
                    novilhas2.focus();
                }
                else if(novilhos22.value == "")
                {
                    novilhos22.focus();
                }
                else if(novilhas22.value == "")
                {
                    novilhas22.focus();
                }
                else if(novilhos222.value == "")
                {
                    novilhos222.focus();
                }
                else if (touros2.value == "")
                {
                    touros2.focus();
                }
                total2.innerHTML = parseInt(vacasdecria2.value) +
                                   parseInt(vacasdedescarte2.value) +
                                   parseInt(terneiros2.value) +
                                   parseInt(terneiras2.value) +
                                   parseInt(novilhos2.value) +
                                   parseInt(novilhas2.value) + 
                                   parseInt(novilhos22.value) + 
                                   parseInt(novilhas22.value) + 
                                   parseInt(novilhos222.value) +
                                   parseInt(touros2.value);
            }
            function calcularJulSet()
            {
                if(vacasdecria3.value == "")
                {
                    vacasdecria3.focus();
                }
                else if(vacasdedescarte3.value == "")
                {
                    vacasdedescarte3.focus();
                }
                else if(terneiros3.value == "")
                {
                    terneiros3.focus();
                }
                else if(terneiras3.value == "")
                {
                    terneiras3.focus();
                }
                else if(novilhos3.value == "")
                {
                    novilhos3.focus();
                }
                else if(novilhas3.value == "")
                {
                    novilhas3.focus();
                }
                else if(novilhos33.value == "")
                {
                    novilhos33.focus();
                }
                else if(novilhas33.value == "")
                {
                    novilhas33.focus();
                }
                else if(novilhos333.value == "")
                {
                    novilhos333.focus();
                }
                else if (touros3.value == "")
                {
                    touros3.focus();
                }
                total3.innerHTML = parseInt(vacasdecria3.value) +
                                   parseInt(vacasdedescarte3.value) +
                                   parseInt(terneiros3.value) +
                                   parseInt(terneiras3.value) +
                                   parseInt(novilhos3.value) +
                                   parseInt(novilhas3.value) + 
                                   parseInt(novilhos33.value) + 
                                   parseInt(novilhas33.value) + 
                                   parseInt(novilhos333.value) +
                                   parseInt(touros3.value);
            }
            function calcularOutDez()
            {
               if(vacasdecria4.value == "")
                {
                    vacasdecria4.focus();
                }
                else if(vacasdedescarte4.value == "")
                {
                    vacasdedescarte4.focus();
                }
                else if(terneiros4.value == "")
                {
                    terneiros4.focus();
                }
                else if(terneiras4.value == "")
                {
                    terneiras4.focus();
                }
                else if(novilhos4.value == "")
                {
                    novilhos4.focus();
                }
                else if(novilhas4.value == "")
                {
                    novilhas4.focus();
                }
                else if(novilhos44.value == "")
                {
                    novilhos44.focus();
                }
                else if(novilhas44.value == "")
                {
                    novilhas44.focus();
                }
                else if(novilhos444.value == "")
                {
                    novilhos444.focus();
                }
                else if (touros4.value == "")
                {
                    touros4.focus();
                }
                total4.innerHTML = parseInt(vacasdecria4.value) +
                                   parseInt(vacasdedescarte4.value) +
                                   parseInt(terneiros4.value) +
                                   parseInt(terneiras4.value) +
                                   parseInt(novilhos4.value) +
                                   parseInt(novilhas4.value) + 
                                   parseInt(novilhos44.value) + 
                                   parseInt(novilhas44.value) + 
                                   parseInt(novilhos444.value) +
                                   parseInt(touros4.value);
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
                             <li class="active"> Passo 2 <span class="divider"> / </span></li>
                             <li><a href="Lv2-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                             <li><a href="Lv2-Passo4.jsp"> Passo 4 </a><span class="divider"> / </span></li>
                             <li><a href="Lv2-Saida.jsp"> Resultados </a></li>
                         </ul>
                             <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                    <span class="sr-only">40% Completo</span>
                                </div>
                            </div>
                         </header>
                     </section><br/>
                </aside>
                
                <aside class="span2"></aside>
                
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row-fluid">
                 
                <aside class="span1"></aside>
                
                <aside class="span11">
                    <h2> Rebanho Bovino </h2>
                    <br/>
                    
                    <form name="passo2" action="Lv2-Passo3.jsp" class="form-horizontal" method ="post" onSubmit="return passo2 ();">
                        <div class="control-group">
                            <label class="control-label">Vacas de Cria:</label>
                		<div class="controls">
                                    <input type="text" name="vacasdecria1" id="vacasdecria1" placeholder="Jan-Mar" required>
                                    <input type="text" name="vacasdecria2" id="vacasdecria2" placeholder="Abr-Jun" required>
                                    <input type="text" name="vacasdecria3" id="vacasdecria3" placeholder="Jul-Set" required>
                                    <input type="text" name="vacasdecria4" id="vacasdecria4" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Vacas de Descarte:</label>
                		<div class="controls">
                                    <input type="text" name="vacasdedescarte1" id="vacasdedescarte1" placeholder="Jan-Mar" required>
                                    <input type="text" name="vacasdedescarte2" id="vacasdedescarte2" placeholder="Abr-Jun" required>
                                    <input type="text" name="vacasdedescarte3" id="vacasdedescarte3" placeholder="Jul-Set" required>
                                    <input type="text" name="vacasdedescarte4" id="vacasdedescarte4" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Terneiros:</label>
                		<div class="controls">
                                    <input type="text" name="terneiros1" id="terneiros1" placeholder="Jan-Mar" required>
                                    <input type="text" name="terneiros2" id="terneiros2" placeholder="Abr-Jun" required>
                                    <input type="text" name="terneiros3" id="terneiros3" placeholder="Jul-Set" required>
                                    <input type="text" name="terneiros4" id="terneiros4" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Terneiras:</label>
                		<div class="controls">
                                    <input type="text" name="terneiras1" id="terneiras1" placeholder="Jan-Mar" required>
                                    <input type="text" name="terneiras2" id="terneiras2" placeholder="Abr-Jun" required>
                                    <input type="text" name="terneiras3" id="terneiras3" placeholder="Jul-Set" required>
                                    <input type="text" name="terneiras4" id="terneiras4" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos 13-24:</label>
                		<div class="controls">
                                    <input type="text" name="novilhos1" id="novilhos1" placeholder="Jan-Mar" required>
                                    <input type="text" name="novilhos2" id="novilhos2" placeholder="Abr-Jun" required>
                                    <input type="text" name="novilhos3" id="novilhos3" placeholder="Jul-Set" required>
                                    <input type="text" name="novilhos4" id="novilhos4" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhas 13-24:</label>
                		<div class="controls">
                                    <input type="text" name="novilhas1" id="novilhas1" placeholder="Jan-Mar" required>
                                    <input type="text" name="novilhas2" id="novilhas2" placeholder="Abr-Jun" required>
                                    <input type="text" name="novilhas3" id="novilhas3" placeholder="Jul-Set" required>
                                    <input type="text" name="novilhas4" id="novilhas4" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos 25-36:</label>
                		<div class="controls">
                                    <input type="text" name="novilhos11" id="novilhos11" placeholder="Jan-Mar" required>
                                    <input type="text" name="novilhos22" id="novilhos22" placeholder="Abr-Jun" required>
                                    <input type="text" name="novilhos33" id="novilhos33" placeholder="Jul-Set" required>
                                    <input type="text" name="novilhos44" id="novilhos44" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhas 25-36:</label>
                		<div class="controls">
                                    <input type="text" name="novilhas11" id="novilhas11" placeholder="Jan-Mar" required>
                                    <input type="text" name="novilhas22" id="novilhas22" placeholder="Abr-Jun" required>
                                    <input type="text" name="novilhas33" id="novilhas33" placeholder="Jul-Set" required>
                                    <input type="text" name="novilhas44" id="novilhas44" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Novilhos > 36:</label>
                		<div class="controls">
                                    <input type="text" name="novilhos111" id="novilhos111" placeholder="Jan-Mar" required>
                                    <input type="text" name="novilhos222" id="novilhos222" placeholder="Abr-Jun" required>
                                    <input type="text" name="novilhos333" id="novilhos333" placeholder="Jul-Set" required>
                                    <input type="text" name="novilhos444" id="novilhos444" placeholder="Out-Dez" required>
                		</div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Touros:</label>
                		<div class="controls">
                                    <input type="text" name="touros1" id="touros1" placeholder="Jan-Mar" required onblur="calcularJanMar()">
                                    <input type="text" name="touros2" id="touros2" placeholder="Abr-Jun" required onblur="calcularAbrJun()">
                                    <input type="text" name="touros3" id="touros3" placeholder="Jul-Set" required onblur="calcularJulSet()">
                                    <input type="text" name="touros4" id="touros4" placeholder="Out-Dez" required onblur="calcularOutDez()">
                		</div>
                        </div>
                         <div class="control-group">
                             <label class="control-label"><b>TOTAL POR PERIODO:</b></label>
                		<div class="controls">
                                    <span name="total1" id="total1" placeholder="Jan-Mar" class="uneditable-input"></span>
                                    <span name="total2" id="total2" placeholder="Abr-Jun" class="uneditable-input"></span>
                                    <span name="total3" id="total3" placeholder="Jul-Set" class="uneditable-input"></span>
                                    <span name="total4" id="total4" placeholder="Out-Dez" class="uneditable-input"></span>
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
