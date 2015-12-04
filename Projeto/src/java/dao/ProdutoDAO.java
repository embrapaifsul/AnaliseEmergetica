/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Lv3p3;
import modelo.Produto;

/**
 *
 * @author Aluno
 */
public class ProdutoDAO {
    
    
    public Boolean excluir(Produto produto)
    
   {
        Boolean retorno = false;
        String sql = "DELETE FROM produto where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,produto.getId());
            
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }

    
    
    public Boolean inserir(Produto produto)
    {
        
        Boolean retorno;
        //Mostra o sql de insert da tabela
        String sql = "IINSERT INTO produto(" +
"nome, proteina, fosforo, potassio, nitrogenio, calcio, outros)" +
"    VALUES ( ?, ?, ?, ?, ?, ?, ?);";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setString(1, produto.getNome());
        pst.setDouble(2, produto.getProteina());
        pst.setDouble(3, produto.getFosfaro());
        pst.setDouble(4, produto.getPotassio());
        pst.setDouble(5, produto.getNitrogenio());
        pst.setDouble(6, produto.getCalcio());
        pst.setDouble(7, produto.getOutros());
        
        //Executa o sql no bancod de dados
        pst.executeUpdate();
        
        retorno = true;
       }
       
       catch(Exception ex)
       {
           ex.printStackTrace();
           
           retorno = false;
       }
        
       
       return retorno;
    }
    

    
    
    public Boolean atualizar(Produto produto){
        Boolean retorno = false;
        String sql = "UPDATE produto set nome=?, proteina=?,fosforo=?, potassio=?, nitrogenio=?," +
"calcio=?, outros=? WHERE id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            pst.setString(1, produto.getNome());
            pst.setDouble(2, produto.getProteina());
            pst.setDouble(3, produto.getFosfaro());
            pst.setDouble(4, produto.getPotassio());
            pst.setDouble(5, produto.getNitrogenio());
            pst.setDouble(6, produto.getCalcio());
            pst.setDouble(7, produto.getOutros());
            pst.setInt(8, produto.getId());
            
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
}
    
    
    
    
    public List<Produto> listar()
    {
        
        //crio a lista de jogadores
        
        List<Produto> lista = new ArrayList<Produto>();
        String sql = "SELECT * FROM produto";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Produto produto = new Produto();
                produto.setId(res.getInt("id"));
                produto.setNome(res.getString("nome"));
                produto.setProteina(res.getDouble("proteina"));
                produto.setFosfaro(res.getDouble("fosforo"));
                produto.setPotassio(res.getDouble("potassio"));
                produto.setNitrogenio(res.getDouble("nitrogenio"));
                produto.setCalcio(res.getDouble("calcio"));
                produto.setOutros(res.getDouble("outros"));
                

                lista.add(produto);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
}
