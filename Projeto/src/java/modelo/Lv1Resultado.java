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
public class Lv1Resultado {
    
    private Integer id;
    private Double lotacaomedia;
    private Double receitahectar;
    private Double totalcustoproducao;
    private Double custohectar;
    private Integer propriedade_id;
    private String ano;

    public Double getLotacaomedia() {
        return lotacaomedia;
    }

    public void setLotacaomedia(Double lotacaomedia) {
        this.lotacaomedia = lotacaomedia;
    }

    public Double getReceitahectar() {
        return receitahectar;
    }

    public void setReceitahectar(Double receitahectar) {
        this.receitahectar = receitahectar;
    }

    public Double getTotalcustoproducao() {
        return totalcustoproducao;
    }

    public void setTotalcustoproducao(Double totalcustoproducao) {
        this.totalcustoproducao = totalcustoproducao;
    }

    public Double getCustohectar() {
        return custohectar;
    }

    public void setCustohectar(Double custohectar) {
        this.custohectar = custohectar;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPropriedade_id() {
        return propriedade_id;
    }

    public void setPropriedade_id(Integer propriedade_id) {
        this.propriedade_id = propriedade_id;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }
    
}
