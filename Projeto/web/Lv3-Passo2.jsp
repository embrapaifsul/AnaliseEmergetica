<%--
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.Lv3p1DAO"%>
<%@page import="modelo.Lv3p1"%>
<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Usuario"%>
<% 
    Usuario u = new Usuario();
    Passos p = new Passos();
    
      Propriedade pro = new Propriedade();
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null) {
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }
    
    Double total = 0.0;
    
    Double combustivel = 0.0,eletricidade= 0.0, materiais_manutencao= 0.0, manutencao = 0.0 ,impostos = 0.0 ,servicos_privados = 0.0 ,telefone = 0.0 ;
Double touro = 0.0 ,vacas_invernar = 0.0 ,novilhos = 0.0 ,vacina_ovinos = 0.0 ,vermifugos_ovinos = 0.0 ,vacina_bovinos = 0.0 ,vermifugos_bovinos = 0.0 ,vermifugo_equinos = 0.0 ;
Double semente_azevem = 0.0 ,remedio = 0.0 ,comida = 0.0 ,plano_saude = 0.0 ,semente_milho = 0.0 ;



    
 
    
    
    
    

    //Buscar a Lista na Session
    //Percorrer a lista, para cada item da lista adicionar no BD
    //limpar a session depreciacao
        
    List<Lv3p1> depreciacoes = new ArrayList<Lv3p1>();
    depreciacoes = (List<Lv3p1>)session.getAttribute("depreciacoes");
    Lv3p1DAO dao = new Lv3p1DAO();
    Boolean deucerto;
   dao.excluirall(p.getAno(), pro);
   
   
   for (Lv3p1 depreciacao:depreciacoes){
       deucerto = dao.inserir(depreciacao);
      
       
       total = total + (depreciacao.getValor()/depreciacao.getVida());
      
    }
     session.setAttribute("depreciacoes", null);
   p.setDepre(total);
   
   session.setAttribute("Passos", p);
   
   if (session.getAttribute("Passos") != null) {
        p = (Passos) session.getAttribute("Passos");
        if (p.getLv3p2() != null) {            
            combustivel = p.getLv3p2().getCombustivel();
            eletricidade = p.getLv3p2().getEletricidade();
            materiais_manutencao = p.getLv3p2().getManutencao();
            manutencao = p.getLv3p2().getManutencao();
            impostos = p.getLv3p2().getImpostos();
            servicos_privados = p.getLv3p2().getServicosPrivados();
            telefone = p.getLv3p2().getTelefone();
            touro = p.getLv3p2().getTouro();
            vacas_invernar = p.getLv3p2().getVacasInvernar();
            novilhos = p.getLv3p2().getNovilhos();
            vacina_ovinos = p.getLv3p2().getVacinaOvinos();
            vacina_bovinos = p.getLv3p2().getVacinaBovinos();
            vermifugos_bovinos = p.getLv3p2().getVermifugosBovinos();
            vermifugos_ovinos = p.getLv3p2().getVermifugosOvinos();
            vermifugo_equinos = p.getLv3p2().getVermifugoEquinos();
            semente_azevem = p.getLv3p2().getSementeAzevem();
            remedio = p.getLv3p2().getRemedio();
            comida = p.getLv3p2().getComida();
            plano_saude = p.getLv3p2().getPlanoSaude();
            semente_milho = p.getLv3p2().getSementeMilho();
            
        } 
 }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li><a href="AnoLv2.jsp"> Data </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                            <li class="alert-info"><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                            <li > Passo 3 </li><span class="divider"> / </span>
                            <li><a href="Lv2-Passo4.jsp" > Passo 4 </a><span class="divider"> / </span></li>
                            <li><a href="Lv2-Saida.jsp" > Resultados </a></li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                <span class="sr-only">40% Completo</span>
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

                <h2>Cálculo dos custos de produção </h2>
                <br/>

                <form name="Passo3" action="Lv3-Passo3.jsp" class="form-horizontal" method ="post" onSubmit="return passo3();">
                    <div class="control-group">
                        <label class="control-label">Combustível:</label>
                        <div class="controls">
                            <input type="text" name="combustivel" id="combustivel" placeholder="R$" required value ="<%=combustivel%>">                                                        
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Eletricidade:</label>
                        <div class="controls">
                            <input type="text" name="eletricidade" id="eletricidade" placeholder="R$" required value="<%=eletricidade%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Materiais de manutenção:</label>
                        <div class="controls">
                            <br/>
                            <input type="text" name="materiaismanutencao" id="materiaismanutencao" placeholder="R$" required value="<%=materiais_manutencao%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Manutenção:</label>
                        <div class="controls">
                            <input type="text" name="manutencao" id="manutencao" placeholder="R$" required value ="<%=manutencao%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Impostos:</label>
                        <div class="controls">
                            <input type="text" name="impostos" id="impostos" placeholder="R$" required  value= "<%=impostos%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Serviços privados:</label>
                        <div class="controls">
                            <input type="text" name="servicosprivados" id="servicosprivados" placeholder="R$" required value ="<%=servicos_privados%> ">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Telefone:</label>
                        <div class="controls">
                            <input type="text" name="telefone" id="telefone" placeholder="R$" required value ="<%=telefone%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Touro:</label>
                        <div class="controls">
                            <input type="text" name="touro" id="touro" placeholder="R$" required value ="<%=touro%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Vacas invernar:</label>
                        <div class="controls">
                            <input type="text" name="vacasinvernar"  id="vacasinvernar" placeholder="R$" required value ="<%=vacas_invernar%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Novilhos:</label>
                        <div class="controls">
                            <input type="text" name="novilhos" id="novilhos" placeholder="R$" required value ="<%=novilhos%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Vacina de ovinos:</label>
                        <div class="controls">
                            <input type="text" name="vacinaovinos" id="vacinaovinos" placeholder="R$" required value ="<%=vacina_ovinos%>">
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label class="control-label">Vermifugos de ovinos:</label>
                        <div class="controls">
                            <input type="text" name="vermifugosovinos" id="vermifugosovinos" placeholder="R$" required value ="<%=vermifugos_ovinos%>">
                        </div>
                    </div>
                    
                    
                    
                    <div class="control-group">
                        <label class="control-label">Vacina de bovinos:</label>
                        <div class="controls">
                            <input type="text" name="vacinabovinos" id="vacinabovinos" placeholder="R$" required value=" <%=vacina_bovinos%>">
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label class="control-label">Vermifugos bovinos:</label>
                        <div class="controls">
                            <input type="text" name="vermifugosbovinos" id="vermifugosbovinos" placeholder="R$" required value=" <%=vermifugos_bovinos%>">
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label class="control-label">Vermifugo equinos:</label>
                        <div class="controls">
                            <input type="text" name="vermifugosequinos" id="vermifugosequinos" placeholder="R$" required value ="<%=vermifugo_equinos%>">
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label class="control-label">Sementes aveia e Azevém:</label>
                        <div class="controls">
                            <input type="text" name="sementesaveia" id="sementesaveia" placeholder="R$" required value ="<%=semente_azevem%>">
                        </div>
                    </div>
                    
                    <div class="control-group">
                        <label class="control-label">Sementes Milho:</label>
                        <div class="controls">
                            <input type="text" name="sementemilho" id="sementemilho" placeholder="R$" required value ="<%=semente_milho%>">
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label class="control-label">Remédio:</label>
                        <div class="controls">
                            <input type="text" name="remedio" id="remedio" placeholder="R$" required value ="<%=remedio%>">
                        </div>
                    </div>
                    
                    <div class="control-group">
                        <label class="control-label">Comida:</label>
                        <div class="controls">
                            <input type="text" name="comida" id="comida" placeholder="R$" required value ="<%=comida%>">
                        </div>
                    </div>
                    
                    <div class="control-group">
                        <label class="control-label">Plano de Saúde:</label>
                        <div class="controls">
                            <input type="text" name="planosaude" id="planosaude" placeholder="R$" required value ="<%=plano_saude%>">
                        </div>
                    </div>
                    
                    <div class="control-group">
                        <div class="controls">
                            <input type="button" onclick="calcularTotal();" class="btn" value="Calcular" />
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