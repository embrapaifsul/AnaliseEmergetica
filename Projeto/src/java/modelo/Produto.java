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
public class Produto {
    Integer id;
    String nome;
    Double fosfaro,proteina, potassio, nitrogenio,calcio,outros;

    public Double getFosfaro() {
        return fosfaro;
    }

    public void setFosfaro(Double fosfaro) {
        this.fosfaro = fosfaro;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getProteina() {
        return proteina;
    }

    public void setProteina(Double proteina) {
        this.proteina = proteina;
    }

    public Double getPotassio() {
        return potassio;
    }

    public void setPotassio(Double potassio) {
        this.potassio = potassio;
    }

    public Double getNitrogenio() {
        return nitrogenio;
    }

    public void setNitrogenio(Double nitrogenio) {
        this.nitrogenio = nitrogenio;
    }

    public Double getCalcio() {
        return calcio;
    }

    public void setCalcio(Double calcio) {
        this.calcio = calcio;
    }

    public Double getOutros() {
        return outros;
    }

    public void setOutros(Double outros) {
        this.outros = outros;
    }
    
}
