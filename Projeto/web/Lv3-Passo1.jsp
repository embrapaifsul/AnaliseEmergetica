<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Propriedade"%>
<% Usuario u = new Usuario();
   Passos p = new Passos ();
    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<%@ include file="cabecalho.jsp" %>
    </head>
    <body>
       <%@ include file="barranavegacao3.jsp" %>

    <div class="container-fluid">
        <div class="row-fluid">

            <aside class="span11">
                <section id="breadcrumbs">
                    <header class="page-header">
                        <h3> Progresso </h3>

                        <ul class="breadcrumb">             
                            <li><a href="AnoLv2.jsp"> Data </a><span class="divider"> / </span></li>
                            <li class="alert-info"><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                            <li><a href="Lv3-Passo3.jsp">Passo 3</a></li><span class="divider"> / </span>
                            <li><a href="Lv2-Passo4.jsp" > Passo 4 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Saida.jsp"> Resultados </a></li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                                <span class="sr-only">20% Completo</span>
                            </div>
                        </div>
                    </header>
                </section><br/><br/>
            </aside>

            <aside class="span1"></aside>

        </div>
    </div>

    <div class="container-fluid">
        <div class="row-fluid">

            <aside class="span1"></aside>

            <aside class="span11">

                <h2> Depreciação  </h2>
                <br/>

                <form name="Passo1" action="Lv3-Passo2.jsp" class="form-horizontal" method ="post" onSubmit="return passo1();">
                    <div class="control-group">
                        <label class="control-label">Descrição do item:</label>
                        <div class="controls">
                          
                            <textarea  name="descricao" id="descricao" placeholder="Descreva o item" rows="6" required=""></textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Categoria:</label>
                        <div class="controls">
                            <input type="text" name="categoria" id="categoria" placeholder="Quantidade(cabeças)" required="">
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Vida util:</label>
                        <div class="controls">
                            <input type="text" name="vida" id="vida" placeholder="Vida util do item" required="">
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Valor:</label>
                        <div class="controls">
                            <input type="text" name="valor" id="valor" placeholder="Valor do item" required="">
                           
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Valor em m²:</label>
                        <div class="controls">
                            <input type="text" name="valorm" id="valorm" placeholder="Valor do item(m²)" required="">
                            
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