<%-- 
    Document   : Lv3-Passo4
    Created on : 20/11/2015, 13:55:08
    Author     : Aluno
--%>
<%@page import="modelo.Lv3p3"%>
<%@page import="dao.Lv3p3DAO"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
    ProdutoDAO dao1 = new ProdutoDAO ();
    Lv3p3DAO dao = new Lv3p3DAO();
    Lv3p3 a = new Lv3p3();
    
    
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    
   List <Produto> produtos;
   produtos = dao1.listar();
  
         Integer posicao = 0;
             for(Produto produto:produtos)
                  {
                       if (request.getParameter(produto.getId().toString())!=null){
                          
                        a.setProdutividade(Double.parseDouble(request.getParameter(produto.getId().toString())));
                        a.setAno(p.getAno());
                        a.setProduto_id(Integer.parseInt(request.getParameter("id"+produto.getId().toString())));
                        a.setPropriedade_id(pro.getId());
                        
                         Lv3p3 teste = null;
                         teste = dao.buscar(p.getAno(),produto, pro);
                        if(teste == null){
                             dao.inserir(a);
                            
                           
                        }else {
                            dao.atualizar(a);
                        }
                          
                      }
                      
                  }







%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="cabecalho.jsp" %>
    </head>
    <body>
        <%@ include file="barranavegacao3.jsp" %>
        <h1>Hello World!</h1>
    </body>
</html>
