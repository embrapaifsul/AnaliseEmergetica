package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Lv1p2;
import modelo.Lv1p3;
import modelo.Propriedade;


/**
 *
 * @author Lucas
 */
public class Lv1p3DAO {
    
    public Boolean excluir(Lv1p3 lv1p3){
        Boolean retorno = false;
        String sql = "DELETE FROM lv1p3 where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv1p3.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(Lv1p3.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    
     public Boolean inserir (Lv1p3 lv1p3)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv1p3(receita_anual, propriedade_id, ano)" + "VALUES (?,?,?)";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setDouble(1, lv1p3.getReceita_anual());
        pst.setInt(2, lv1p3.getPropiedade_id());
        pst.setString(3, lv1p3.getAno());
        
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
     
     
      public List<Lv1p3> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv1p3> lista = new ArrayList<Lv1p3>();
        String sql = "SELECT * FROM lv1p3";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv1p3 lv1p3 = new Lv1p3();
                lv1p3.setReceita_anual(res.getDouble("receita_anual"));
                lv1p3.setPropiedade_id(res.getInt("propiedade_id"));
                lv1p3.setAno(res.getString("ano"));
                lista.add(lv1p3);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
      
      public Boolean atualizar(Lv1p3 lv1p3){
        Boolean retorno = false;
        String sql = "UPDATE lv1p3 set receita_anual=? where ano=? and propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
            pst.setDouble(1,lv1p3.getReceita_anual());
            pst.setString(2, lv1p3.getAno());
            pst.setInt(3, lv1p3.getPropiedade_id());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p3DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
      
      
      
      public Lv1p3 buscar(String ano, Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Lv1p3 lv1p3 = null;
        String sql = "SELECT * FROM lv1p3 WHERE ano = ? AND propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
           
            pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();
            //com a minha classe Jogador e adicionar na lista 
            if(res.next())
            {
                lv1p3 = new Lv1p3();
                lv1p3.setReceita_anual(res.getDouble("receita_anual"));
                lv1p3.setPropiedade_id(res.getInt("propiedade_id"));
                lv1p3.setAno(res.getString("ano"));
                
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lv1p3;
        }
      
      
      
      
}
