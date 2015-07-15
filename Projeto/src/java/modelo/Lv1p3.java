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
public class Lv1p3 {
       private Integer id,propiedade_id;
      private Double receita_anual;
     private String ano;

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
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

    

  

    public Double getReceita_anual() {
        return receita_anual;
    }

    public void setReceita_anual(Double receita_anual) {
        this.receita_anual = receita_anual;
    }
}
