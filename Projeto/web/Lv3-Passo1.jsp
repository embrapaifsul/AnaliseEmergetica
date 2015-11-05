<%@page import="dao.Lv3p1DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Lv3p1"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Propriedade"%>
<% Usuario u = new Usuario();
    Lv3p1DAO dao = new Lv3p1DAO ();
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

    
    
     
    String descricao = "";
    String valor = "";
    String vida ="";

   
      if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv3p1() != null) {
        
        descricao = p.getLv3p1().getDescricao();
         valor = p.getLv3p1().getValor().toString();
        vida = p.getLv3p1().getVida().toString();
       
        
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
       

       

       
      if(session.getAttribute("depreciacoes")!= null)
      {
      
         depreciacoes = (List<Lv3p1>)session.getAttribute("depreciacoes");
         if(request.getParameter("excluir")!=null)
         {
             depreciacoes.remove(Integer.parseInt(request.getParameter("excluir")));
             session.setAttribute("depreciacoes",depreciacoes);
         }
      }
      else
      {
          //listar o que já tem no banco pro ano/propriedade
          depreciacoes = dao.listar(p.getAno(),pro);
          session.setAttribute("depreciacoes",depreciacoes);
          
      }
      //Verifica se chamou do modal
      if(request.getParameter("descricao")!= null||      
            request.getParameter("vida")!= null||
            request.getParameter("valor")!= null){
             
        Lv3p1 a = new Lv3p1();
        a.setDescricao(request.getParameter("descricao").toString());
       
        a.setVida(Integer.parseInt(request.getParameter("vida").toString()));
        a.setValor(Double.parseDouble(request.getParameter("valor").toString()));
        
        a.setAno(p.getAno());
        a.setPropriedade_id(pro.getId());
        
        depreciacoes.add(a);
          session.setAttribute("depreciacoes",depreciacoes);
        
       
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
                        
             
                   
                    </div>
 
                     <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Item<button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" title="Item informado sobre a depreciação."><i class="icon-info-sign"></i></button></th>
                                <th>Valor</th>                                
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                 <%
                 Double total = 0.0;
                 Integer posicao = 0;
                  for(Lv3p1 depreciacao:depreciacoes)
                  {
                 %>
                 <div class="control-group">
                     
                     <tr class="success">                                  
                                
                                <td><%=depreciacao.getDescricao()%></td>
                                <td><%=depreciacao.getValor()%></td>
                                <td>
                                    <a class="btn" href="Lv3-Passo1.jsp?excluir=<%=posicao%>"> Excluir </a></td>
                            </tr>
                        
                        
                            
                        
                    </div>
                  <%
                     posicao++;
                  }
                  %>          
       </tbody>
                    </table>
       <a class ="btn" href="Lv3-Passo2.jsp">Próximo nivel</a>
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