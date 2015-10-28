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
import modelo.Lv3p1;
import modelo.Propriedade;

/**
 *
 * @author Aluno
 */
public class Lv3p1DAO {
     public Boolean inserir(Lv3p1 lv3p1)
    {
        
        Boolean retorno;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv3p1(descricao, vida, valor, ano, propriedade_id) VALUES ( ?, ?, ?, ?, ?);";
                    
    
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setString(1, lv3p1.getDescricao());
        pst.setInt(2, lv3p1.getVida());
        pst.setDouble(3, lv3p1.getValor());
        pst.setString(4, lv3p1.getAno());
        pst.setInt(5, lv3p1.getPropriedade_id());
        
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
     
     
     public Boolean excluir(Lv3p1 lv3p1){
        Boolean retorno = false;
        String sql = "DELETE FROM lv3p1 where propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv3p1.getPropriedade_id());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(Lv3p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
     
     
     
     
     public List<Lv3p1> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv3p1> lista = new ArrayList<Lv3p1>();
     
        String sql = "SELECT * FROM lv3p1";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv3p1 lv3p1 = new Lv3p1();
                lv3p1.setValor(res.getDouble("valor"));
                
               
                lv3p1.setDescricao(res.getString("descricao"));
                lv3p1.setVida(res.getInt("vida"));
                lv3p1.setAno(res.getString("ano"));
                lv3p1.setPropriedade_id(res.getInt("propiedade_id"));                
                lista.add(lv3p1);
            }
            } catch(SQLException ex){
                
               ex.printStackTrace();
               return null; 
            }
      
            return lista;
        
          
        }
        
        
      
     
      public Lv3p1 buscar(String ano, Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Lv3p1 lv3p1 = null;
        String sql = "SELECT * FROM lv3p1 WHERE ano = ? AND propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
             pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();
           
         
            if(res.next())
            {
                lv3p1 = new Lv3p1();
                lv3p1.setDescricao(res.getString("descricao"));                
                lv3p1.setVida(res.getInt("vida"));
                lv3p1.setValor(res.getDouble("valor"));                                                
                lv3p1.setAno(res.getString("ano"));
                lv3p1.setPropriedade_id(res.getInt("propiedade_id"));                        
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lv3p1;
        }
      
      
      public Boolean atualizar(Lv3p1 lv3p1){
        Boolean retorno = false;
        String sql = "UPDATE lv3p1 set ano=?,descricao=?, categoria=?, vida=?, valor=?, valor_m=? where propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
        pst.setString(1, lv3p1.getAno());
        pst.setString(2, lv3p1.getDescricao());
        pst.setString(3, lv3p1.getCategoria());
        pst.setInt(4,    lv3p1.getVida());
        pst.setDouble(5, lv3p1.getValor());
        pst.setDouble(6, lv3p1.getValorm());
        pst.setDouble(7, lv3p1.getPropriedade_id());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
      
     
     
  }
