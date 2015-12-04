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
public class Lv3p3 {
    Integer id,propriedade_id,produto_id;
    Double produtividade;
    String   ano;

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

    public Integer getProduto_id() {
        return produto_id;
    }

    public void setProduto_id(Integer produto_id) {
        this.produto_id = produto_id;
    }

    public Double getProdutividade() {
        return produtividade;
    }

    public void setProdutividade(Double produtividade) {
        this.produtividade = produtividade;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }
    
}
