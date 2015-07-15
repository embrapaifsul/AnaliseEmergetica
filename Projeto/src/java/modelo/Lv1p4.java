/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Lucas
 */
public class Lv1p4 {
  private Integer id,propiedade_id;
      private Double madicamento,mao_de_obra,maquinas,pastagem,outros;
            private String ano;

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public Double getOutros() {
        return outros;
    }

    public void setOutros(Double outros) {
        this.outros = outros;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPropiedade_id() {
        return propiedade_id;
    }

    public void setPropiedade_id(Integer propiedade_id) {
        this.propiedade_id = propiedade_id;
    }

    public Double getMadicamento() {
        return madicamento;
    }

    public void setMadicamento(Double madicamento) {
        this.madicamento = madicamento;
    }

    public Double getMao_de_obra() {
        return mao_de_obra;
    }

    public void setMao_de_obra(Double mao_de_obra) {
        this.mao_de_obra = mao_de_obra;
    }

    public Double getMaquinas() {
        return maquinas;
    }

    public void setMaquinas(Double maquinas) {
        this.maquinas = maquinas;
    }

    public Double getPastagem() {
        return pastagem;
    }

    public void setPastagem(Double pastagem) {
        this.pastagem = pastagem;
    }
}
    