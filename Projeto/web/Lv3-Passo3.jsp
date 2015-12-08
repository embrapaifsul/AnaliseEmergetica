<%-- 
    Document   : Lv3-Passo3
    Created on : 29/10/2015, 16:21:10
    Author     : Aluno
--%>

<%@page import="dao.Lv3p3DAO"%>
<%@page import="modelo.Lv3p3"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="dao.Lv3p1DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv3p2DAO"%>
<%@page import="modelo.Lv3p2"%>
<%
    Usuario u = new Usuario();
    Lv3p2DAO dao = new Lv3p2DAO();
    Lv3p3DAO dao3 = new Lv3p3DAO();
    Passos p = new Passos();
    
    List<Lv3p3> lista = dao3.listar();
    Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

    if (request.getParameter("combustivel") != null || request.getParameter("eletricidade") != null || request.getParameter("materiaismanutencao") != null || request.getParameter("manutencao") != null
            || request.getParameter("impostos") != null || request.getParameter("servicosprivados") != null || request.getParameter("telefone") != null || request.getParameter("touro") != null
            || request.getParameter("vacasinvernar") != null || request.getParameter("novilhos") != null || request.getParameter("vacinaovinos") != null || request.getParameter("vermifugosovinos") != null
            || request.getParameter("vacinabovinos") != null || request.getParameter("vermifugosbovinos") != null || request.getParameter("vermifugosequinos") != null || request.getParameter("sementesaveia") != null
            || request.getParameter("remedio") != null || request.getParameter("comida") != null || request.getParameter("planosaude") != null || request.getParameter("sementemilho") != null) {

        Lv3p2 a = new Lv3p2();

        a.setCombustivel(Double.parseDouble(request.getParameter("combustivel")));
        a.setEletricidade(Double.parseDouble(request.getParameter("eletricidade")));
        a.setMateriaisManutencao(Double.parseDouble(request.getParameter("materiaismanutencao")));
        a.setManutencao(Double.parseDouble(request.getParameter("manutencao")));
        a.setImpostos(Double.parseDouble(request.getParameter("impostos")));
        a.setServicosPrivados(Double.parseDouble(request.getParameter("servicosprivados")));
        a.setTelefone(Double.parseDouble(request.getParameter("telefone")));
        a.setTouro(Double.parseDouble(request.getParameter("touro")));
        a.setVacasInvernar(Double.parseDouble(request.getParameter("vacasinvernar")));
        a.setNovilhos(Double.parseDouble(request.getParameter("novilhos")));
        a.setVacinaOvinos(Double.parseDouble(request.getParameter("vacinaovinos")));
        a.setVermifugosOvinos(Double.parseDouble(request.getParameter("vermifugosovinos")));
        a.setVacinaBovinos(Double.parseDouble(request.getParameter("vacinabovinos")));
        a.setVermifugosBovinos(Double.parseDouble(request.getParameter("vermifugosbovinos")));
        a.setVermifugoEquinos(Double.parseDouble(request.getParameter("vermifugosequinos")));
        a.setSementeAzevem(Double.parseDouble(request.getParameter("sementesaveia")));
        a.setRemedio(Double.parseDouble(request.getParameter("remedio")));
        a.setComida(Double.parseDouble(request.getParameter("comida")));
        a.setPlanoSaude(Double.parseDouble(request.getParameter("planosaude")));
        a.setSementeMilho(Double.parseDouble(request.getParameter("sementemilho")));
        a.setDepreciacao(p.getDepre());
        a.setAno(p.getAno());
        a.setPropriedade_id(pro.getId());

        Lv3p2 teste = new Lv3p2();

        teste = dao.buscar(p.getAno(), pro);
        if (teste == null) {
            dao.inserir(a);
        } else {
            dao.atualizar(a);
        }

        p.setLv3p2(a);
    }

    ProdutoDAO dao2 = new ProdutoDAO();
    List<Produto> produtos;
    produtos = dao2.listar();


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="cabecalho.jsp" %>
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
                            <li><a href="AnoLv3.jsp"> Data </a><span class="divider"> / </span></li>
                            <li><a href="Lv3-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                            <li ><a href="Lv3-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                            <li class="alert-info"> Passo 3 </li><span class="divider"> / </span>
                            <li><a href="Lv3-Passo4.jsp" > Passo 4 </a><span class="divider"> / </span></li>
                            <li><a href="Lv3-Saida.jsp" > Resultados </a></li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                <span class="sr-only">60% Completo</span>
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

                <h2> Balanço de nutrintes  </h2>
                <br/>

                <div class="control-group">



                </div>
                <form action="Lv3-Passo4.jsp" method="post">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Nome<button type="button" class="btn btn-default btn-link" data-toggle="tooltip" data-placement="right" ></button></th>
                                <th>Produtividade</th>                                


                            </tr>
                        </thead>
                        <tbody>

                        <div class="control-group">

                            <tr class="success">   
                                <%
                                if(lista==null){
                                %>
                                
                                <%                              Integer posicao = 0;
                                    for (Produto produto : produtos) {
                                %>


                            <tr class="success">                                  

                                <td>
                                    
                                        <%=produto.getNome()%>
                                        
                                </td>
                                <td>
                                    <input type="number" name="<%=produto.getId()%>" id="<%=produto.getNome()%>"/>
                                </td>
                            </tr>


                            <input type="hidden" name="id<%=produto.getId()%>" value="<%=produto.getId()%>" />


                            <%
                                    posicao++;
                                }
                            %>   
                            
                            
                             <%}else{
%>

                         

                         <%                              Integer posicao = 0;
                                    for (Produto produto : produtos) {
                                %>


                            <tr class="success">                                  

                                <td>
                                    
                                        <%=produto.getNome()%>
                                        
                                </td>
                                <td>
                                    <input type="number" name="<%=produto.getId()%>" id="<%=produto.getNome()%>"/>
                                </td>
                            </tr>


                            <input type="hidden" name="id<%=produto.getId()%>" value="<%=produto.getId()%>" />


                            <%
                                    posicao++;
                                }
                            %>   


<%
                                }%>
                            </tr>




                        </div>

                        </tbody>
                    </table>
                    <input type="submit" class="btn" value="Proxímo Passo" />
                   
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
