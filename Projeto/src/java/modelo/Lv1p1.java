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
public class Lv1p1 {
    
    private Integer id,propiedade_id;
    private String ano;
    private Double area_apro;

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

    public Double getArea_apro() {
        return area_apro;
    }

    public void setArea_apro(Double area_apro) {
        this.area_apro = area_apro;
    }
}
