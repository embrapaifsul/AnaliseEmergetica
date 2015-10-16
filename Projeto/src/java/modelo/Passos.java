/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

/**
 *
 * @author Aluno
 */
public class Passos {
    
    private Lv1p1 lv1p1;
    private Lv1p2 lv1p2;
    private Lv1p3 lv1p3;
    private Lv1p4 lv1p4;
    
    private Lv2p1 lv2p1;
    private Lv2p2 lv2p2;
    private Lv2p3 lv2p3;
    private Lv2p4 lv2p4;
    
    private Lv3p1 lv3p1;
    private Lv3p2 lv3p2;

    public Lv3p1 getLv3p1() {
        return lv3p1;
    }

    public void setLv3p1(Lv3p1 lv3p1) {
        this.lv3p1 = lv3p1;
    }

    public Lv3p2 getLv3p2() {
        return lv3p2;
    }

    public void setLv3p2(Lv3p2 lv3p2) {
        this.lv3p2 = lv3p2;
    }
    
    private String ano;

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }
    
    public Lv1p1 getLv1p1() {
        return lv1p1;
    }

    public void setLv1p1(Lv1p1 lv1p1) {
        this.lv1p1 = lv1p1;
    }

    public Lv1p2 getLv1p2() {
        return lv1p2;
    }

    public void setLv1p2(Lv1p2 lv1p2) {
        this.lv1p2 = lv1p2;
    }

    public Lv1p3 getLv1p3() {
        return lv1p3;
    }

    public void setLv1p3(Lv1p3 lv1p3) {
        this.lv1p3 = lv1p3;
    }

    public Lv1p4 getLv1p4() {
        return lv1p4;
    }

    public void setLv1p4(Lv1p4 lv1p4) {
        this.lv1p4 = lv1p4;
    }

    public Lv2p1 getLv2p1() {
        return lv2p1;
    }

    public void setLv2p1(Lv2p1 lv2p1) {
        this.lv2p1 = lv2p1;
    }

    public Lv2p2 getLv2p2() {
        return lv2p2;
    }

    public void setLv2p2(Lv2p2 lv2p2) {
        this.lv2p2 = lv2p2;
    }

    public Lv2p3 getLv2p3() {
        return lv2p3;
    }

    public void setLv2p3(Lv2p3 lv2p3) {
        this.lv2p3 = lv2p3;
    }

    public Lv2p4 getLv2p4() {
        return lv2p4;
    }

    public void setLv2p4(Lv2p4 lv2p4) {
        this.lv2p4 = lv2p4;
    }
    
    
    
   //AQUI COMEÇA OS CALCULOS DO NIVEL 1 
    public Double lotacaomedia (){
        //passo1
        Double areapec = this.getLv1p1().getArea_apro();
        //passo2
        Integer vacasdecria = this.getLv1p2().getVacadecria();
        Integer vacasdedescarte = this.getLv1p2().getVacadedescarte();
        Integer terneiro = this.getLv1p2().getTerneiro();
        Integer terneira = this.getLv1p2().getTerneira();
        Integer novilhos1 = this.getLv1p2().getNovilho1324();
        Integer novilhas1 = this.getLv1p2().getNovilha1324();
        Integer novilhos2 = this.getLv1p2().getNovilho2536();
        Integer novilhas2 = this.getLv1p2().getNovilha2536();
        Integer novilhos3 = this.getLv1p2().getNovilho36();
        Integer touros = this.getLv1p2().getTouro();
        
        
            Integer total = vacasdecria + vacasdedescarte + terneiro + terneira + novilhos1 + novilhas1 + novilhos2 + novilhas2 + novilhos3 + touros;
            return total / areapec;   
        
        
    }
    
    public double percentualcria (){
        //passo1
        Double areapec = this.getLv1p1().getArea_apro();
        
        Integer vacasdecria = this.getLv1p2().getVacadecria();
        Integer vacasdedescarte = this.getLv1p2().getVacadedescarte();
        Integer terneiro = this.getLv1p2().getTerneiro();
        Integer terneira = this.getLv1p2().getTerneira();
        Integer novilhos1 = this.getLv1p2().getNovilho1324();
        Integer novilhas1 = this.getLv1p2().getNovilha1324();
        Integer novilhos2 = this.getLv1p2().getNovilho2536();
        Integer novilhas2 = this.getLv1p2().getNovilha2536();
        Integer novilhos3 = this.getLv1p2().getNovilho36();
        Integer touros = this.getLv1p2().getTouro();
        
        
            Integer total = vacasdecria + vacasdedescarte + terneiro + terneira + novilhos1 + novilhas1 + novilhos2 + novilhas2 + novilhos3 + touros;
            return ((vacasdecria + vacasdedescarte + touros + terneiro + terneira) * 100) / total;  
        
    }
    
    
    public double totalcustoproducao () {
        
        Double medicamento = this.getLv1p4().getMadicamento();
        Double maodeobra = this.getLv1p4().getMao_de_obra();
        Double maquina = this.getLv1p4().getMaquinas();
        Double pastagem = this.getLv1p4().getPastagem();
        Double outros = this.getLv1p4().getOutros();
        
        return medicamento + maodeobra + maquina + pastagem + outros;
    }
    
    public double receitahectar () {
        
        Double areapec = this.getLv1p1().getArea_apro();
        
        Double receitatotal = this.getLv1p3().getReceita_anual();
        
        return receitatotal / areapec;
    }
    
    public double custocria () {
        
        Double totalcusto = this.totalcustoproducao();
        
        Double percentualcria = this.percentualcria();
        
        return (totalcusto * percentualcria) / 100;  
    }
    
    public double custohectar () {
        
        Double areapec = this.getLv1p1().getArea_apro();
        
        Double percentualcria = this.totalcustoproducao();
        
        return percentualcria / areapec;
    }
    
    
    
    
    
    
    
    
    
    //AQUI COMEÇA O CALCULOS DO NIVEL 2
    public double areamedia () {
        Double a = this.getLv2p1().getPastagemnativa();
        Double b = this.getLv2p1().getPastagemnativamelhorada();
        Double c = this.getLv2p1().getPastagemcultivadaperene();
        Double d = this.getLv2p1().getPastagemanuaisdeinverno();
        Double e = this.getLv2p1().getPastagemanuaisdeverao();
        Double f = this.getLv2p1().getAgriculturai();
        Double g = this.getLv2p1().getAgriculturav();
        Double h = this.getLv2p1().getFlorestaplantadas();
        Double i = this.getLv2p1().getOutrasplantadas();
        Double j = this.getLv2p1().getMatasnativas();
        Double k = this.getLv2p1().getSea();
        Double l = this.getLv2p1().getInaproveitavel();
        
        return a + b + c + d + e + f + g + h + i + j + k + l;  
    }
    
    public double areaaproveitavel () {
        Double f = this.getLv2p1().getAgriculturai();
        Double g = this.getLv2p1().getAgriculturav();
        Double h = this.getLv2p1().getFlorestaplantadas();
        Double i = this.getLv2p1().getOutrasplantadas();
        
        return f + g + h + i;
    }
    
    public double percentualrebanhocomcria () {
        Integer a1 = this.getLv2p2().getVacadecriajanmar();
        Integer a2 = this.getLv2p2().getVacadecriaabrjun();
        Integer a3 = this.getLv2p2().getVacadecriajulset();
        Integer a4 = this.getLv2p2().getVacadecriaoutdez();
        Integer b1 = this.getLv2p2().getVacadedescartejanmar();
        Integer b2 = this.getLv2p2().getVacadedescarteabrjun();
        Integer b3 = this.getLv2p2().getVacadedescartejulset();
        Integer b4 = this.getLv2p2().getVacadedescarteoutdez();
        Integer c1 = this.getLv2p2().getTerneirosjanmar();
        Integer c2 = this.getLv2p2().getTerneirosabrjun();
        Integer c3 = this.getLv2p2().getTerneirosjulset();
        Integer c4 = this.getLv2p2().getTerneirosoutdez();
        Integer d1 = this.getLv2p2().getTerneirasjanmar();
        Integer d2 = this.getLv2p2().getTerneirasabrjun();
        Integer d3 = this.getLv2p2().getTerneirasjulset();
        Integer d4 = this.getLv2p2().getTerneirasoutdez();
        Integer e1 = this.getLv2p2().getNovilho1324janmar();
        Integer e2 = this.getLv2p2().getNovilho1324abrjun();
        Integer e3 = this.getLv2p2().getNovilho1324julset();
        Integer e4 = this.getLv2p2().getNovilho1324outdez();
        Integer f1 = this.getLv2p2().getNovilha1324janmar();
        Integer f2 = this.getLv2p2().getNovilha1324abrjun();
        Integer f3 = this.getLv2p2().getNovilha1324julset();
        Integer f4 = this.getLv2p2().getNovilha1324outdez(); 
        Integer g1 = this.getLv2p2().getNovilho2536janmar();
        Integer g2 = this.getLv2p2().getNovilho2536abrjun();
        Integer g3 = this.getLv2p2().getNovilho2536julset();
        Integer g4 = this.getLv2p2().getNovilho2536outdez();
        Integer h1 = this.getLv2p2().getNovilha2536janmar();
        Integer h2 = this.getLv2p2().getNovilha2536abrjun();
        Integer h3 = this.getLv2p2().getNovilha2536julset();
        Integer h4 = this.getLv2p2().getNovilha2536outdez();
        Integer i1 = this.getLv2p2().getNovilho36janmar();
        Integer i2 = this.getLv2p2().getNovilho36abrjun();
        Integer i3 = this.getLv2p2().getNovilho36julset();
        Integer i4 = this.getLv2p2().getNovilho36outdez();
        Integer j1 = this.getLv2p2().getTourojanmar();
        Integer j2 = this.getLv2p2().getTouroabrjun();
        Integer j3 = this.getLv2p2().getTourojulset();
        Integer j4 = this.getLv2p2().getTourooutdez();
        
        Integer total = a1+a2+a3+a4+b1+b2+b3+b4+c1+c2+c3+c4+d1+d2+d3+d4+e1+e2+e3+e4+f1+f2+f3+f4+g1+g2+g3+g4+h1+h2+h3+h4+i1+i2+i3+i4+j1+j2+j3+j4;
        
        Integer fim = ((a1+a2+a3+a4+j1+j2+j3+j4+f1+f2+f3+f4+h1+h2+h3+h4+c1+c2+c3+c4+d1+d2+d3+d4) * 100) / total;
        
        return  fim; 
    }
    
    public double lotacaomedia2 () {
        Double area = this.areamedia();
        
        Integer a1 = this.getLv2p2().getVacadecriajanmar();
        Integer a2 = this.getLv2p2().getVacadecriaabrjun();
        Integer a3 = this.getLv2p2().getVacadecriajulset();
        Integer a4 = this.getLv2p2().getVacadecriaoutdez();
        Integer b1 = this.getLv2p2().getVacadedescartejanmar();
        Integer b2 = this.getLv2p2().getVacadedescarteabrjun();
        Integer b3 = this.getLv2p2().getVacadedescartejulset();
        Integer b4 = this.getLv2p2().getVacadedescarteoutdez();
        Integer c1 = this.getLv2p2().getTerneirosjanmar();
        Integer c2 = this.getLv2p2().getTerneirosabrjun();
        Integer c3 = this.getLv2p2().getTerneirosjulset();
        Integer c4 = this.getLv2p2().getTerneirosoutdez();
        Integer d1 = this.getLv2p2().getTerneirasjanmar();
        Integer d2 = this.getLv2p2().getTerneirasabrjun();
        Integer d3 = this.getLv2p2().getTerneirasjulset();
        Integer d4 = this.getLv2p2().getTerneirasoutdez();
        Integer e1 = this.getLv2p2().getNovilho1324janmar();
        Integer e2 = this.getLv2p2().getNovilho1324abrjun();
        Integer e3 = this.getLv2p2().getNovilho1324julset();
        Integer e4 = this.getLv2p2().getNovilho1324outdez();
        Integer f1 = this.getLv2p2().getNovilha1324janmar();
        Integer f2 = this.getLv2p2().getNovilha1324abrjun();
        Integer f3 = this.getLv2p2().getNovilha1324julset();
        Integer f4 = this.getLv2p2().getNovilha1324outdez(); 
        Integer g1 = this.getLv2p2().getNovilho2536janmar();
        Integer g2 = this.getLv2p2().getNovilho2536abrjun();
        Integer g3 = this.getLv2p2().getNovilho2536julset();
        Integer g4 = this.getLv2p2().getNovilho2536outdez();
        Integer h1 = this.getLv2p2().getNovilha2536janmar();
        Integer h2 = this.getLv2p2().getNovilha2536abrjun();
        Integer h3 = this.getLv2p2().getNovilha2536julset();
        Integer h4 = this.getLv2p2().getNovilha2536outdez();
        Integer i1 = this.getLv2p2().getNovilho36janmar();
        Integer i2 = this.getLv2p2().getNovilho36abrjun();
        Integer i3 = this.getLv2p2().getNovilho36julset();
        Integer i4 = this.getLv2p2().getNovilho36outdez();
        Integer j1 = this.getLv2p2().getTourojanmar();
        Integer j2 = this.getLv2p2().getTouroabrjun();
        Integer j3 = this.getLv2p2().getTourojulset();
        Integer j4 = this.getLv2p2().getTourooutdez();
        
        return (a1+a2+a3+a4+b1+b2+b3+b4+c1+c2+c3+c4+d1+d2+d3+d4+e1+e2+e3+e4+f1+f2+f3+f4+g1+g2+g3+g4+h1+h2+h3+h4+i1+i2+i3+i4+j1+j2+j3+j4) / area;
    }
    
    public double totalreceita () {
        Double a = this.getLv2p3().getTerneirovalor();
        Double b = this.getLv2p3().getTerneiravalor();
        Double c = this.getLv2p3().getNovilhavalor();
        Double d = this.getLv2p3().getVacadedescartevalor();
        Double e = this.getLv2p3().getVacaprenhavalor();
        Double f = this.getLv2p3().getVacacomcriavalor();
        Double g = this.getLv2p3().getVacagordavalor();
        Double h = this.getLv2p3().getNovilhorecriavalor();
        Double i = this.getLv2p3().getNovilhogordovalor();
        Double j = this.getLv2p3().getTorunovalor();
        Double k = this.getLv2p3().getTourovalor();   
        Integer a1 = this.getLv2p3().getTerneiroquant();
        Integer b1 = this.getLv2p3().getTerneiraquant();
        Integer c1 = this.getLv2p3().getNovilhaquant();
        Integer d1 = this.getLv2p3().getVacadedescartequant();
        Integer e1 = this.getLv2p3().getVacaprenhasquant();
        Integer f1 = this.getLv2p3().getVacacomcriaquant();
        Integer g1 = this.getLv2p3().getVacagordaquant();
        Integer h1 = this.getLv2p3().getNovilhorecriaquant();
        Integer i1 = this.getLv2p3().getNovilhogordoquant();
        Integer j1 = this.getLv2p3().getTorunosquant();
        Integer k1 = this.getLv2p3().getTouroquant();
        
        return (a+b+c+d+e+f+g+h+i+j+k) * (a1+b1+c1+d1+e1+f1+g1+h1+i1+j1+k1);
    }
    
    public double receitahectar2 () {
        Double a = this.areamedia();
        Double b = this.totalreceita();
        
        return b / a;
    }
    
    public double custotalproducao () {
        Double a = this.getLv2p4().getMedicamento();
        Double b = this.getLv2p4().getCarrapaticida();
        Double c = this.getLv2p4().getSal();
        Double d = this.getLv2p4().getCompradebovinos();
        Double e = this.getLv2p4().getUntesilosdeusogeral();
        Double f = this.getLv2p4().getSemem();
        Double g = this.getLv2p4().getMaodeobrafixa();
        Double h = this.getLv2p4().getMaodeobravariavel();
        Double i = this.getLv2p4().getSemente();
        Double j = this.getLv2p4().getDefensivoagriparapastagem();
        Double k = this.getLv2p4().getAdubosparapastagem();
        Double l = this.getLv2p4().getCombustivel();
        Double m = this.getLv2p4().getReparosmaquina();
        Double n = this.getLv2p4().getReparobanfeitoria();
        Double o = this.getLv2p4().getRacao();
        Double p = this.getLv2p4().getFrete();
        Double q = this.getLv2p4().getArrendamentocamponativo();
        Double r = this.getLv2p4().getArrendamentopastagemcultivada();
        Double s = this.getLv2p4().getImposto();
        Double t = this.getLv2p4().getOutradespesas();
        
        return a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s+t;
    }
    
    public double custoatividadecria1 () {
        Double totalcusto = this.custotalproducao();
        
        Double percentual = this.percentualrebanhocomcria();
        
        return (totalcusto * percentual) / 100;  
    }
    
    public double custoproducaohectar1 () {
        Double a = this.custoatividadecria1();
        Double b = this.areamedia();
        
        return a / b;
    } 
    
    public double custoterneiro () {
        Double custo = this.custoatividadecria1();
        
        Integer c1 = this.getLv2p2().getTerneirosjanmar();
        Integer c2 = this.getLv2p2().getTerneirosabrjun();
        Integer c3 = this.getLv2p2().getTerneirosjulset();
        Integer c4 = this.getLv2p2().getTerneirosoutdez();
        Integer d1 = this.getLv2p2().getTerneirasjanmar();
        Integer d2 = this.getLv2p2().getTerneirasabrjun();
        Integer d3 = this.getLv2p2().getTerneirasjulset();
        Integer d4 = this.getLv2p2().getTerneirasoutdez();
        
        
        return custo / (c1+c2+c3+c4+d1+d2+d3+d4);
    }
    
}
