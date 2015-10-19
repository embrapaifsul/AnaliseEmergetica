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
import modelo.Lv1p1;
import modelo.Passos;
import modelo.Propriedade;

/**
 *
 * @author Aluno
 */
public class ComparacaoDAO {
    
    public List<Passos> listar()
    {
        
        //crio a lista de jogadores
        
        List<Passos> lista = new ArrayList<Passos>();
        String sql = "SELECT * FROM";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
      
      
      
      public Lv1p1 buscar(String ano, Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Lv1p1 lv1p1 = null;
        String sql = "SELECT * FROM lv1p1 WHERE ano = ? AND propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();
           
         
            if(res.next())
            {
                lv1p1 = new Lv1p1();
                lv1p1.setArea_apro(res.getDouble("area_apro"));
                lv1p1.setAno(res.getString("ano"));
                lv1p1.setPropiedade_id(res.getInt("propiedade_id"));                
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lv1p1;
        }
    
}
