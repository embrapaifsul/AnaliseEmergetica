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
import modelo.Lv1p1;
import modelo.Lv2p4;
import modelo.Lv3p3;

/**
 *
 * @author Aluno
 */
public class Lv3p3DAO {
     
    
    
    public Boolean excluir(Lv3p3 lv3p3)
    
   {
        Boolean retorno = false;
        String sql = "DELETE FROM lv3p3 where propriedade_id=? and produto_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv3p3.getPropriedade_id());
            pst.setInt(2, lv3p3.getProduto_id());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(Lv3p3DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }




public Boolean inserir(Lv3p3 lv3p3)
    {
        
        Boolean retorno;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv3p3(" +
"ano, propriedade_id, produto_id, produtividade)" +
"VALUES (?, ?, ?, ?);";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setString(1, lv3p3.getAno());
        pst.setInt(2, lv3p3.getPropriedade_id());
        pst.setInt(3, lv3p3.getProduto_id());
        pst.setDouble(4, lv3p3.getProdutividade());
        
        
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




public Boolean atualizar(Lv3p3 lv3p3){
        Boolean retorno = false;
        String sql = "UPDATE lv3p3 set produtividade=? where propriedade_id=? and produto_id =?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            pst.setDouble(1, lv3p3.getProdutividade());
            pst.setInt(2, lv3p3.getPropriedade_id());
            pst.setInt(3,lv3p3.getProduto_id());
            
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
}



 public List<Lv3p3> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv3p3> lista = new ArrayList<Lv3p3>();
        String sql = "SELECT * FROM lv3p3";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv3p3 lv3p3 = new Lv3p3();
                
                
                lv3p3.setProdutividade(res.getDouble("produtividade"));
                lv3p3.setProduto_id(res.getInt("produto_id"));
                lv3p3.setPropriedade_id(res.getInt("propriedade_id"));
                lv3p3.setAno(res.getString("ano"));

                lista.add(lv3p3);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }




 
 
 
    }






