<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Lv3p1"%>
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
    }
    
    String link2;
    String link3;
    String link4;
    String link5;

    
    
     String categoria ="";
    String descricao = "";
    String valor = "";
    String valorm="";
    String vida ="";

   
      if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv3p1() != null) {
        categoria = p.getLv3p1().getCategoria();
        descricao = p.getLv3p1().getDescricao();
        vida = p.getLv3p1().getVida().toString();
        valor = p.getLv3p1().getValor().toString();
        valorm = p.getLv3p1().getValorm().toString();          
      }
           
        

        if (p.getLv3p2() == null) {
            link2 = " class='inativo' ";
            link3 = " class='inativo' ";
            link4 = " class='inativo' ";
            link5 = " class='inativo' ";

        } 
            
            
        
    } else {
        p = new Passos();
        session.setAttribute("Passos", p);

    }
       List<Lv3p1> depreciacoes;
      if(session.getAttribute("depreciacoes")!=null)
      {
      
         depreciacoes = (List<Lv3p1>)session.getAttribute("depreciacoes");
      }
      else
      {
          //listar o que já tem no banco pro ano/propriedade
          depreciacoes = new ArrayList<Lv3p1>();
          session.setAttribute("depreciacoes",depreciacoes);
          
      }
      //Verifica se chamou do modal
      if(request.getParameter("descricao")!= null||
            request.getAttribute("categoria")!= null||
            request.getAttribute("vida")!= null||
            request.getAttribute("valor")!= null||
            request.getAttribute("valorm")!= null){
             
        Lv3p1 a = new Lv3p1();
        a.setDescricao(request.getParameter("descricao").toString());
        a.setCategoria(request.getParameter("categoria").toString());
        a.setVida(Integer.parseInt(request.getParameter("vida").toString()));
        a.setValor(Double.parseDouble(request.getParameter("valor").toString()));
        a.setValorm(Double.parseDouble(request.getParameter("valorm").toString()));
        a.setAno(p.getAno());
        a.setPropriedade_id(pro.getId());
        
        depreciacoes.add(a);
        
       
      }
     

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="cabecalho.jsp" %>
    </head>
    <body>
       <%@ include file="barranavegacao3.jsp" %>

    <div class="container-fluid">
        <div class="row-fluid">

            <aside class="span11"
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
 <a href="#MeuModal" class="btn btn-primary" role="button" data-toggle="modal"> Add </a>
 <div class="control-group">
                        <label class="control-label">Item</label>
                        
                            <span>Valor/R$</span>
                   
                    </div>
                 <%
                 Double total = 0.0;
                  for(Lv3p1 depreciacao:depreciacoes)
                  {
                 %>
                 <div class="control-group">
                        <label ><%=depreciacao.getDescricao()%>:</label>
                        
                            <span><%=depreciacao.getValor()%></span>
                            
                        
                    </div>
                  <%
                  }
                  %>          
   
            </aside>

        </div>
    </div>
    
    
    
    
    <section id="MeuModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="meuModelLabel" aria-hidden="true">
                <header class="modal-header">
                    <button class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h3 id="meuModelLabel"> Depreciação</h3>
                </header>
                <section class="modal-body">

                   <form name="Passo1" action="Lv3-Passo1.jsp" class="form-horizontal" method ="post" onSubmit="return passo1();">
                    <div class="control-group">
                        <label class="control-label">Descrição do item:</label>
                        <div class="controls">
                          
                            <textarea  name="descricao" id="descricao" placeholder="Descreva o item" rows="6" required=""></textarea>
                        </div>
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
                    
                    </div>                    
                    <div class="control-group">
                        <div class="controls">
                            <input type="submit" class="btn btn-primary" value="Salvar" />
                        </div>
                    </div>
                </form> 

                </section>
            </section>                
    <footer class="footer">
        <div class="container">
        </div>
    </footer>
</body>

</html>