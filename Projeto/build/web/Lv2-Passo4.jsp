<%-- 
    Document   : Lv2-Passo4
    Created on : 30/04/2015, 15:34:10
    Author     : Aluno
--%>

<%@page import="modelo.Propriedade"%>
<%@page import="modelo.Passos"%>
<%@page import="modelo.Lv2p3"%>
<%@page import="dao.Lv2p3DAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.Lv2p4DAO"%>
<%@page import="modelo.Lv2p4"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = new Usuario();
    Passos p = new Passos();
    Propriedade pro = new Propriedade();
    
    
    String medicamentos="", carrapaticidas="", sal="", 
            racoes="", comprabovinos="", utensilios="", 
            semen="", maodeobrafixa="", maodeobravariavel="", 
            sementes="", defensivospastagem="", adubos="", 
            combustiveis="", reparomaquinas="", reparobemfeitorias="", 
            fretes="", arrendamentosnativos="", arrendamentoscultivadas="", 
            impostos="", outras="";
    
    String link5;
    link5="";
    
    if (session.getAttribute("Passos") != null) {
        p = (Passos)session.getAttribute("Passos");
        if(p.getLv2p4() !=null)
        {
            medicamentos = p.getLv2p4().getMedicamento().toString();
            carrapaticidas = p.getLv2p4().getCarrapaticida().toString();
            sal = p.getLv2p4().getSal().toString();
            racoes = p.getLv2p4().getRacao().toString();
            comprabovinos = p.getLv2p4().getCompradebovinos().toString();
            utensilios = p.getLv2p4().getUntesilosdeusogeral().toString();
            semen = p.getLv2p4().getSemem().toString();
            maodeobrafixa = p.getLv2p4().getMaodeobrafixa().toString();
            maodeobravariavel = p.getLv2p4().getMaodeobravariavel().toString();
            sementes = p.getLv2p4().getSemente().toString();
            defensivospastagem = p.getLv2p4().getDefensivoagriparapastagem().toString();
            adubos = p.getLv2p4().getAdubosparapastagem().toString();
            combustiveis = p.getLv2p4().getCombustivel().toString();
            reparomaquinas = p.getLv2p4().getReparosmaquina().toString();
            reparobemfeitorias = p.getLv2p4().getReparobanfeitoria().toString();
            fretes = p.getLv2p4().getFrete().toString();
            arrendamentosnativos = p.getLv2p4().getArrendamentocamponativo().toString();
            arrendamentoscultivadas = p.getLv2p4().getArrendamentopastagemcultivada().toString();
            impostos = p.getLv2p4().getImposto().toString();
            outras = p.getLv2p4().getOutradespesas().toString();
        }
        if (p.getLv2p4() == null) {
                link5 = " class='inativo' ";
        }
    }
    else
    {
        p = new Passos();
        p.setAno(request.getParameter("data"));
        session.setAttribute("Passos", p);
        
    }
    
    
    if (session.getAttribute("Usuario") != null && session.getAttribute("Passos") != null && session.getAttribute("Propriedade") != null  ){
        u = (Usuario) session.getAttribute("Usuario");
        p = (Passos) session.getAttribute("Passos");
        pro = (Propriedade) session.getAttribute("Propriedade");
    } else {
        response.sendRedirect("index.jsp");
    }

%>
<%  
    
if(request.getParameter("terneiros1") != null || request.getParameter("terneiros2") != null ||  
   request.getParameter("terneiras1") != null || request.getParameter("terneiras2") != null ||
   request.getParameter("novilhas1") != null || request.getParameter("novilhas2") != null ||
   request.getParameter("vacdescarte1") != null || request.getParameter("vacdescarte2") != null ||
   request.getParameter("vacprenha1") != null || request.getParameter("vacprenha2") != null ||
   request.getParameter("vaccria1") != null || request.getParameter("vaccria2") != null ||
   request.getParameter("vacgorda1") != null || request.getParameter("vacgorda2") != null ||
   request.getParameter("novilhosrecria1") != null || request.getParameter("novilhosrecria2") != null ||
   request.getParameter("novilhosgordos1") != null || request.getParameter("novilhosgordos2") != null ||
   request.getParameter("torunos1") != null || request.getParameter("torunos2") != null ||
   request.getParameter("touros1") != null || request.getParameter("touros2") != null)
{ 
    Lv2p3 c = new Lv2p3();
    c.setTerneiroquant(Integer.parseInt(request.getParameter("terneiros1")));
    c.setTerneirovalor(Double.parseDouble(request.getParameter("terneiros2")));

    c.setTerneiraquant(Integer.parseInt(request.getParameter("terneiras1")));
    c.setTerneiravalor(Double.parseDouble(request.getParameter("terneiras2")));

    c.setNovilhaquant(Integer.parseInt(request.getParameter("novilhas1")));
    c.setNovilhavalor(Double.parseDouble(request.getParameter("novilhas2")));

    c.setVacadedescartequant(Integer.parseInt(request.getParameter("vacdescarte1")));
    c.setVacadedescartevalor(Double.parseDouble(request.getParameter("vacdescarte2")));

    c.setVacaprenhasquant(Integer.parseInt(request.getParameter("vacprenha1")));
    c.setVacaprenhavalor(Double.parseDouble(request.getParameter("vacprenha2")));

    c.setVacacomcriaquant(Integer.parseInt(request.getParameter("vaccria1")));
    c.setVacacomcriavalor(Double.parseDouble(request.getParameter("vaccria2")));

    c.setVacagordaquant(Integer.parseInt(request.getParameter("vacgorda1")));
    c.setVacagordavalor(Double.parseDouble(request.getParameter("vacgorda2")));

    c.setNovilhorecriaquant(Integer.parseInt(request.getParameter("novilhosrecria1")));
    c.setNovilhorecriavalor(Double.parseDouble(request.getParameter("novilhosrecria2")));

    c.setNovilhogordoquant(Integer.parseInt(request.getParameter("novilhosgordos1")));
    c.setNovilhogordovalor(Double.parseDouble(request.getParameter("novilhosgordos2")));

    c.setTorunosquant(Integer.parseInt(request.getParameter("torunos1")));
    c.setTorunovalor(Double.parseDouble(request.getParameter("torunos2")));

    c.setTouroquant(Integer.parseInt(request.getParameter("touros1")));
    c.setTourovalor(Double.parseDouble(request.getParameter("touros2")));

    c.setPropriedade_id(pro.getId());
    c.setAno(p.getAno());

    Lv2p3DAO dao = new Lv2p3DAO();
    dao.inserir(c);
    p.setLv2p3(c);
}
%>

<%@ include file="cabecalho.jsp" %>
        <script>
            function calcularTotal()
            {
                var medicamentos =  document.getElementById('medicamentos');
                var carrapaticidas =  document.getElementById('carrapaticidas');
                var sal =  document.getElementById('sal');
                var racoes =  document.getElementById('racoes');
                var comprabovinos =  document.getElementById('comprabovinos');
                var utensilios =  document.getElementById('utensilios');
                var semen =  document.getElementById('semen');
                var maodeobrafixa =  document.getElementById('maodeobrafixa');
                var maodeobravariavel =  document.getElementById('maodeobravariavel');
                var sementes =  document.getElementById('sementes');
                var defensivospastagens =  document.getElementById('defensivospastagens');
                var adubos =  document.getElementById('adubos');
                var combustiveis =  document.getElementById('combustiveis');
                var reparomaquinas =  document.getElementById('reparomaquinas');
                var reparosbemfeitorias =  document.getElementById('reparosbemfeitorias');
                var fretes =  document.getElementById('fretes');
                var arrendamentosnativo =  document.getElementById('arrendamentosnativo');
                var arrendamentoscultivadas =  document.getElementById('arrendamentoscultivadas');
                var impostos =  document.getElementById('impostos');
                var outras =  document.getElementById('outras');
                var totalizando =  document.getElementById('totalizando');
                var medicamentos2 =  document.getElementById('medicamentos2');
                var carrapaticidas2 =  document.getElementById('carrapaticidas2');
                var sal2 =  document.getElementById('sal2');
                var racoes2 =  document.getElementById('racoes2');
                var comprabovinos2 =  document.getElementById('comprabovinos2');
                var utensilios2 =  document.getElementById('utensilios2');
                var semen2 =  document.getElementById('semen2');
                var maodeobrafixa2 =  document.getElementById('maodeobrafixa2');
                var maodeobravariavel2 =  document.getElementById('maodeobravariavel2');
                var sementes2 =  document.getElementById('sementes2');
                var defensivospastagens2 =  document.getElementById('defensivospastagens2');
                var adubos2 =  document.getElementById('adubos2');
                var combustiveis2 =  document.getElementById('combustiveis2');
                var reparomaquinas2 =  document.getElementById('reparomaquinas2');
                var reparosbemfeitorias2 =  document.getElementById('reparosbemfeitorias2');
                var fretes2 =  document.getElementById('fretes2');
                var arrendamentosnativo2 =  document.getElementById('arrendamentosnativo2');
                var arrendamentoscultivadas2 =  document.getElementById('arrendamentoscultivadas2');
                var impostos2 =  document.getElementById('impostos2');
                var outras2 =  document.getElementById('outras2');
                
                if(medicamentos.value === "")
                {
                    medicamentos.focus();
                }
                else if(carrapaticidas.value === "")
                {
                    carrapaticidas.focus();
                }
                else if(sal.value === "")
                {
                    sal.focus();
                }
                else if(racoes.value === "")
                {
                    racoes.focus();
                }
                else if(comprabovinos.value === "")
                {
                    comprabovinos.focus();
                }
                else if(utensilios.value === "")
                {
                    utensilios.focus();
                }
                else if(semen.value === "")
                {
                    semen.focus();
                }
                else if(maodeobrafixa.value === "")
                {
                    maodeobrafixa.focus();
                }
                else if(maodeobravariavel.value === "")
                {
                    maodeobravariavel.focus();
                }
                else if(sementes.value === "")
                {
                    sementes.focus();
                }
                else if(defensivospastagens.value === "")
                {
                    defensivospastagens.focus();
                }
                else if(adubos.value === "")
                {
                    adubos.focus();
                }
                else if(combustiveis.value === "")
                {
                    combustiveis.focus();
                }
                else if(reparomaquinas.value === "")
                {
                    reparomaquinas.focus();
                }
                else if(reparosbemfeitorias.value === "")
                {
                    reparosbemfeitorias.focus();
                }
                else if(fretes.value === "")
                {
                    fretes.focus();
                }
                else if(arrendamentosnativo.value === "")
                {
                    arrendamentosnativo.focus();
                }
                else if(arrendamentoscultivadas.value === "")
                {
                    arrendamentoscultivadas.focus();
                }
                else if(impostos.value === "")
                {
                    impostos.focus();
                }
                else if(outras.value === "")
                {
                    outras.focus();
                }
                
                totalizando.innerHTML = parseInt(medicamentos.value) +
                                  parseInt(carrapaticidas.value) +
                                  parseInt(sal.value) +
                                  parseInt(racoes.value) +
                                  parseInt(comprabovinos.value) +
                                  parseInt(utensilios.value) +
                                  parseInt(semen.value) +
                                  parseInt(maodeobrafixa.value) +
                                  parseInt(maodeobravariavel.value) +
                                  parseInt(sementes.value) +
                                  parseInt(defensivospastagens.value) +
                                  parseInt(adubos.value) +
                                  parseInt(combustiveis.value) +
                                  parseInt(reparomaquinas.value) +
                                  parseInt(reparosbemfeitorias.value) +
                                  parseInt(fretes.value) +
                                  parseInt(arrendamentoscultivadas.value) +
                                  parseInt(impostos.value) +
                                  parseInt(outras.value) +
                                  parseInt(arrendamentosnativo.value);
                          
               medicamentos2.innerHTML = (parseInt(medicamentos.value) * 100) / totalizando.innerHTML;
               carrapaticidas2.innerHTML = (parseInt(carrapaticidas.value) * 100) / totalizando.innerHTML;
               sal2.innerHTML = (parseInt(sal.value) * 100) / totalizando.innerHTML;
               racoes2.innerHTML = (parseInt(racoes.value) * 100) / totalizando.innerHTML;
               comprabovinos2.innerHTML = (parseInt(comprabovinos.value) * 100) / totalizando.innerHTML;
               utensilios2.innerHTML = (parseInt(utensilios.value) * 100) / totalizando.innerHTML;
               semen2.innerHTML = (parseInt(semen.value) * 100) / totalizando.innerHTML;
               maodeobrafixa2.innerHTML = (parseInt(maodeobrafixa.value) * 100) / totalizando.innerHTML;
               maodeobravariavel2.innerHTML = (parseInt(maodeobravariavel.value) * 100) / totalizando.innerHTML;
               sementes2.innerHTML = (parseInt(sementes.value) * 100) / totalizando.innerHTML;
               defensivospastagens2.innerHTML = (parseInt(defensivospastagens.value) * 100) / totalizando.innerHTML;
               adubos2.innerHTML = (parseInt(adubos.value) * 100) / totalizando.innerHTML;
               combustiveis2.innerHTML = (parseInt(combustiveis.value) * 100) / totalizando.innerHTML;
               reparomaquinas2.innerHTML = (parseInt(reparomaquinas.value) * 100) / totalizando.innerHTML;
               reparosbemfeitorias2.innerHTML = (parseInt(reparosbemfeitorias.value) * 100) / totalizando.innerHTML;
               fretes2.innerHTML = (parseInt(fretes.value) * 100) / totalizando.innerHTML;
               arrendamentoscultivadas2.innerHTML = (parseInt(arrendamentoscultivadas.value) * 100) / totalizando.innerHTML;
               impostos2.innerHTML = (parseInt(impostos.value) * 100) / totalizando.innerHTML;
               outras2.innerHTML = (parseInt(outras.value) * 100) / totalizando.innerHTML;
               arrendamentosnativo2.innerHTML = (parseInt(arrendamentosnativo.value) * 100) / totalizando.innerHTML;
               
               
            }
        </script>
    </head>
    <body>

        <%@ include file="barranavegacao2.jsp" %>


        <div class="container-fluid">
            <div class="row-fluid">

                <aside class="span11">
                    <section id="breadcrumbs">
                        <header class="page-header">
                            <h3> Progresso </h3>

                            <ul class="breadcrumb">             
                                <li><a href="AnoLv2.jsp"> Data </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo1.jsp"> Passo 1 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo2.jsp"> Passo 2 </a><span class="divider"> / </span></li>
                                <li><a href="Lv2-Passo3.jsp"> Passo 3 </a><span class="divider"> / </span></li>
                                <li class="alert-info"> Passo 4 </li><span class="divider"> / </span>
                                <li><a href="Lv2-Saida.jsp" <%=link5%>> Resultados </a></li>
                            </ul>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                    <span class="sr-only">80% Completo</span>
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

                    <h2> Custo de Produção </h2>
                    <br/>

                    <form name="" action="Lv2-Saida.jsp" class="form-horizontal" method ="post" onSubmit="return passo4();">
                        <div class="control-group">
                            <label class="control-label">Medicamentos e Vacinas:</label>
                            <div class="controls">
                                <input type="text" name="medicamentos" id="medicamentos" placeholder="Valor em R$(ANO)" value="<%=medicamentos%>" required>
                                <span name="medicamentos2" id="medicamentos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Carrapaticidas:</label>
                            <div class="controls">
                                <input type="text" name="carrapaticidas" id="carrapaticidas" placeholder="Valor em R$(ANO)" value="<%=carrapaticidas%>" required>
                                <span name="carrapaticidas2" id="carrapaticidas2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sal Comum e Mineral:</label>
                            <div class="controls">

                                <input type="text" name="sal" id="sal" placeholder="Valor em R$(ANO)" value="<%=sal%>" required>
                                <span name="sal2" id="sal2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Rações:</label>
                            <div class="controls">
                                <input type="text" name="racoes" id="racoes" placeholder="Valor em R$(ANO)" value="<%=racoes%>" required>
                                <span name="racoes2" id="racoes2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Compra de Bovinos:</label>
                            <div class="controls">
                                <input type="text" name="comprabovinos" id="comprabovinos"  placeholder="Valor em R$(ANO)" value="<%=comprabovinos%>" required>
                                <span name="comprabovinos2" id="comprabovinos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Utensílios de uso geral:</label>
                            <div class="controls">
                                <input type="text" name="utensilios" id="utensilios"  placeholder="Valor em R$(ANO)" value="<%=utensilios%>" required>
                                <span name="utensilios2" id="utensilios2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sêmen e material para inseminação artificial:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="semen" id="semen"  placeholder="Valor em R$(ANO)" value="<%=semen%>" required>
                                <span name="semen2" id="semen2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-de-obra Fixa:</label>
                            <div class="controls">
                                <input type="text" name="maodeobrafixa" id="maodeobrafixa"  placeholder="Valor em R$(ANO)" value="<%=maodeobrafixa%>" required>
                                <span name="maodeobrafixa2" id="maodeobrafixa2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Mão-de-obra variável:</label>
                            <div class="controls">
                                <input type="text" name="maodeobravariavel" id="maodeobravariavel" placeholder="Valor em R$(ANO)" value="<%=maodeobravariavel%>" required>
                                <span name="maodeobravariavel2" id="maodeobravariavel2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Sementes:</label>
                            <div class="controls">
                                <input type="text" name="sementes" id="sementes" placeholder="Valor em R$(ANO)" value="<%=sementes%>" required>
                                <span name="sementes2" id="sementes2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Defensivos agrícolas para pastagens:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="defensivospastagens" id="defensivospastagens"  placeholder="Valor em R$(ANO)" value="<%=defensivospastagem%>" required>
                                <span name="defensivospastagens2" id="defensivospastagens2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Adubos para pastegens:</label>
                            <div class="controls">
                                <input type="text" name="adubos" id="adubos" placeholder="Valor em R$(ANO)" value="<%=adubos%>" required>
                                <span name="adubos2" id="adubos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Combustíveis e Lubrificantes:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="combustiveis" id="combustiveis"  placeholder="Valor em R$(ANO)" value="<%=combustiveis%>" required>
                                <span name="combustiveis2" id="combustiveis2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Reparos de máquinas:</label>
                            <div class="controls">
                                <input type="text" name="reparomaquinas" id="reparomaquinas" placeholder="Valor em R$(ANO)" value="<%=reparomaquinas%>" required>
                                <span name="reparomaquinas2" id="reparomaquinas2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Reparos de benfeitorias:</label>
                            <div class="controls">
                                <input type="text" name="reparosbemfeitorias" id="reparosbemfeitorias" placeholder="Valor em R$(ANO)" value="<%=reparobemfeitorias%>" required>
                                <span name="reparosbemfeitorias2" id="reparosbemfeitorias2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Fretes, taxas e comissão na venda de animais:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="fretes" id="fretes" placeholder="Valor em R$(ANO)" value="<%=fretes%>" required>
                                <span name="fretes2" id="fretes2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Arrendamentos de campo nativo:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="arrendamentosnativo" id="arrendamentosnativo"  placeholder="Valor em R$(ANO)" value="<%=arrendamentosnativos%>" required>
                                <span name="arrendamentosnativo2" id="arrendamentosnativo2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Arrendamentos de pastagens cultivadas:</label>
                            <div class="controls">
                                <br/>
                                <input type="text" name="arrendamentoscultivadas" id="arrendamentoscultivadas" placeholder="Valor em R$(ANO)" value="<%=arrendamentoscultivadas%>" required>
                                <span name="arrendamentoscultivadas2" id="arrendamentoscultivadas2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Impostos e Taxas:</label>
                            <div class="controls">
                                <input type="text" name="impostos" id="impostos" placeholder="Valor em R$(ANO)" value="<%=impostos%>" required>
                                <span name="impostos2" id="impostos2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Outras despesas:</label>
                            <div class="controls">
                                <input type="text" name="outras" id="outras"  placeholder="Valor em R$(ANO)" value="<%=outras%>" required>
                                <span name="outras2" id="outras2" class="uneditable-input"></span><span class="help-inline">%</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><b>TOTAL:</b></label>
                            <div class="controls">
                                <span name="total" id="totalizando" class="uneditable-input"></span><span id="sla" class="help-inline">Valor em R$(ANO)</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="button" onclick="calcularTotal();" class="btn" value="Calcular" />
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn" value="Resultados" />
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
