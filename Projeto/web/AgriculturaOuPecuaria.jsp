<%-- 
    Document   : Lv1-Passo1
    Created on : 28/04/2015, 16:00:56
    Author     : Aluno
--%>

<%@page import="dao.PropriedadeDAO"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.Lv1p1DAO"%>
<%@page import="modelo.Lv1p1"%>


<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();

    

    if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
    } else {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);

    }

    if (session.getAttribute("Usuario") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        if (request.getParameter("pid") != null) {
            pro.setId(Integer.parseInt(request.getParameter("pid")));
            PropriedadeDAO dao = new PropriedadeDAO();
            pro = dao.loginpro(pro);
            session.setAttribute("Propriedade", pro);
        }

    } else {
        response.sendRedirect("index.jsp");
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
        <script type="text/javascript" src="bootstrap/TesteJavaScript.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-fixed-top navbar-inverse">
            <div class="navbar-inner">
                <div class="container">
                    <!-- .btn-navbar est� classe � usada como alternador para o conteudo coplapsavel-->
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
                            <li><a href="InicioPropriedade.jsp">Usuario: <%=u.getLogin()%></a></li>
                        </ul>
                    </div>
                        
                    <form action="index.jsp" class="navbar-form pull-right">
                        <button class="btn btn-inverse"> Sair </button>
                    </form>
                        
                </div>
            </div>
        </nav>

        <header class="page-header"></header> 
        <br/><br/><nr/>
        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span2"></aside>

                <aside class="span4"> 
                    <a class="btn btn-link" href="AnoLv1.jsp"><img class="menorr" src="images/s4dey7rz.bmp" alt="..." class="img-rounded"></a>
                    
                </aside>
                <aside class="span4"> 
                    <a class="btn btn-link" href=""><img class="menorr" src="images/52qw661c.bmp" alt="..." class="img-rounded"></a>
                    
                </aside>

                <aside class="span2"><p></aside>

            </div>
        </div>

    </body>

</html>
