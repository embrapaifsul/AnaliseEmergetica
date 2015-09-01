package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Lv1p1;

import modelo.Lv1p2;
import modelo.Propriedade;


/**
 *
 * @author Lucas
 */
public class Lv1p2DAO {
    public Boolean excluir(Lv1p2 lv1p2){
        Boolean retorno = false;
        String sql = "DELETE FROM lv1p2 where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv1p2.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(Lv1p2.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    
    
    public Boolean inserirNao (Lv1p2 lv1p2)
             
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        
        
        String sql = "INSERT INTO lv1p2("
                + "vaca_de_cria,"
                + "vaca_de_descarte,"
                + "terneiro,"
                + "terneira,"
                + "novilho_13a24,"
                + "novilha_13a24,"
                + "novilho_25a36,"
                + "novilha_25a36,"
                + "novilho_36,"
                + "novilha_36,"
                + "touro,"
                + "ano,"
                + "propriedade_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        
        pst.setInt(1, lv1p2.getVacadecria());
        pst.setInt(2, lv1p2.getVacadedescarte());
        pst.setInt(3, lv1p2.getTerneiro());
        pst.setInt(4, lv1p2.getTerneira());
        pst.setInt(5, lv1p2.getNovilho1324());
        pst.setInt(6, lv1p2.getNovilha1324());
        pst.setInt(7, lv1p2.getNovilho2536());
        pst.setInt(8,lv1p2.getNovilha2536());
        pst.setInt(9,lv1p2.getNovilho36());
        pst.setInt(10,lv1p2.getNovilha36());
        pst.setInt(11,lv1p2.getTouro());
        pst.setString (12,lv1p2.getAno());
        pst.setInt(13, lv1p2.getPropiedade_id());
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
     
       public List<Lv1p2> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv1p2> lista = new ArrayList<Lv1p2>();
        String sql = "SELECT * FROM lv1p2";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv1p2 lv1p2 = new Lv1p2();
                lv1p2.setPropiedade_id(res.getInt("propriedade_id"));
                lv1p2.setVacadecria(res.getInt("vaca_de_cria"));
                lv1p2.setVacadedescarte(res.getInt("vaca_de_descarte"));
                lv1p2.setTerneiro(res.getInt("terneiro"));
                lv1p2.setTerneira(res.getInt("terneira"));
                lv1p2.setNovilho1324(res.getInt("novilho_13a24"));
                lv1p2.setNovilha1324(res.getInt("novilha_13a24"));
                lv1p2.setNovilho2536(res.getInt("novilho_25a36"));
                lv1p2.setNovilha2536(res.getInt("novilha_25a36"));
                lv1p2.setNovilho36(res.getInt("novilho_36"));
                lv1p2.setNovilha36(res.getInt("novilha_36"));
                lv1p2.setTouro(res.getInt("touro"));
                lv1p2.setAno(res.getString("ano"));
                lista.add(lv1p2);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
       
     public Boolean atualizar(Lv1p2 lv1p2){
        Boolean retorno = false;
        String sql = "UPDATE lv1p2 SET vaca_de_cria=?, vaca_de_descarte=?, terneiro=?, terneira=?,novilho_13a24=?, "
                + "novilha_13a24=?, novilho_25a36=?, novilha_25a36=?,novilho_36=?, touro=?,novilha_36=? "
                + "WHERE ano =? and propriedade_id=?;";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
            pst.setInt(1, lv1p2.getVacadecria());
            pst.setInt(2, lv1p2.getVacadedescarte());
            pst.setInt(3, lv1p2.getTerneiro());
            pst.setInt(4, lv1p2.getTerneira());
            pst.setInt(5, lv1p2.getNovilho1324());
            pst.setInt(6, lv1p2.getNovilha1324());
            pst.setInt(7, lv1p2.getNovilho2536());
            pst.setInt(8, lv1p2.getNovilha2536());
            pst.setInt(9, lv1p2.getNovilho36());
            pst.setInt(10, lv1p2.getTouro());
            pst.setInt(11, lv1p2.getNovilha36());
            pst.setString(12, lv1p2.getAno());
            pst.setInt(13, lv1p2.getPropiedade_id());
        
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p2DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }


      
      
      public Lv1p2 buscar(String ano, Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Lv1p2 lv1p2 = null;
        String sql = "SELECT * FROM lv1p2 WHERE ano = ? AND propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            
            pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();
            if(res.next())
            {
                lv1p2 = new Lv1p2();
                lv1p2.setPropiedade_id(res.getInt("propriedade_id"));
                lv1p2.setVacadecria(res.getInt("vaca_de_cria"));
                lv1p2.setVacadedescarte(res.getInt("vaca_de_descarte"));
                lv1p2.setTerneiro(res.getInt("terneiro"));
                lv1p2.setTerneira(res.getInt("terneira"));
                lv1p2.setNovilho1324(res.getInt("novilho_13a24"));
                lv1p2.setNovilha1324(res.getInt("novilha_13a24"));
                lv1p2.setNovilho2536(res.getInt("novilho_25a36"));
                lv1p2.setNovilha2536(res.getInt("novilha_25a36"));
                lv1p2.setNovilho36(res.getInt("novilho_36"));
                lv1p2.setNovilha36(res.getInt("novilha_36"));
                lv1p2.setTouro(res.getInt("touro"));
                lv1p2.setAno(res.getString("ano"));  
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lv1p2;
        }
      
      
      
      
      
      
      
      
}
