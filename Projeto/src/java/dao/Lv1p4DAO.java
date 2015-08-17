package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Lv1p3;

import modelo.Lv1p4;
import modelo.Propriedade;


/**
 *
 * @author Lucas
 */
public class Lv1p4DAO {
    
    public Boolean excluir(Lv1p4 lv1p4){
        Boolean retorno = false;
        String sql = "DELETE FROM lv1p4 where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv1p4.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(Lv1p4.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    
     public Boolean inserir (Lv1p4 lv1p4)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv1p4(" +
"            medicamento, mao_de_obra, maquinas, pastagem, propriedade_id, " +
"            ano, outros)" +
"    VALUES (?, ?, ?, ?, ?," +
"            ?, ?)";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setDouble(1, lv1p4.getMadicamento());
        pst.setDouble(2, lv1p4.getMao_de_obra());
        pst.setDouble(3, lv1p4.getMaquinas());
        pst.setDouble(4, lv1p4.getPastagem());
        pst.setInt(5, lv1p4.getPropiedade_id());
        pst.setString(6, lv1p4.getAno());
        pst.setDouble(7, lv1p4.getOutros());
        
        
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
     
     
      public List<Lv1p4> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv1p4> lista = new ArrayList<Lv1p4>();
        String sql = "SELECT * FROM lv1p4";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv1p4 lv1p4 = new Lv1p4();
                lv1p4.setMadicamento(res.getDouble("medicamento"));
                lv1p4.setMao_de_obra(res.getDouble("mao_de_obra"));
                lv1p4.setMaquinas(res.getDouble("maquinas"));
                lv1p4.setPastagem(res.getDouble("pastagem"));
                lv1p4.setOutros(res.getDouble("outros"));
                lv1p4.setPropiedade_id(res.getInt("propriedade_id"));
                lv1p4.setAno(res.getString("ano"));
                
                
                lista.add(lv1p4);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
      
      public Boolean atualizar(Lv1p4 lv1p4){
        Boolean retorno = false;
        String sql = "UPDATE lv1p4 set medicamento =?,mao_de_obra=?,maquinas=?,pastagem=?, ano = ? where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
            pst.setDouble(1,lv1p4.getMadicamento());
            pst.setDouble(2,lv1p4.getMao_de_obra());
            pst.setDouble(3,lv1p4.getMaquinas());
            pst.setDouble(4,lv1p4.getPastagem());
            pst.setString(5, lv1p4.getAno());
            pst.setInt(6, lv1p4.getPropiedade_id());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
      
      
       public Lv1p4 buscar(String ano, Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Lv1p4 lv1p4 = null;
        String sql = "SELECT * FROM lv1p4 WHERE ano = ? AND propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
       
            pst.setString(1, ano);
            pst.setInt(2, pro.getId());
                ResultSet res = pst.executeQuery();
            if(res.next())
            {
                lv1p4 = new Lv1p4();
                lv1p4.setMadicamento(res.getDouble("medicamento"));
                lv1p4.setMao_de_obra(res.getDouble("mao_de_obra"));
                lv1p4.setMaquinas(res.getDouble("maquinas"));
                lv1p4.setPastagem(res.getDouble("pastagem"));
                lv1p4.setOutros(res.getDouble("outros"));
                lv1p4.setPropiedade_id(res.getInt("propriedade_id"));
                lv1p4.setAno(res.getString("ano"));
                
                
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lv1p4;
        }
      
 
      
}
