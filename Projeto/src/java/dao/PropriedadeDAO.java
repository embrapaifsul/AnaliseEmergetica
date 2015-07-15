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
import modelo.Propriedade;
import modelo.Usuario;


/**
 *
 * @author Lucas
 */
public class PropriedadeDAO {
    
    
    public Boolean inserir (Propriedade propriedade)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO propriedade (nome,cidade,uf,usuario_id)" +
                "VALUES (?,?,?,?)";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setString(1, propriedade.getNome());
        pst.setString(2, propriedade.getCidade());
        pst.setString(3, propriedade.getUf());
        pst.setInt(4, propriedade.getUsuario_id());
        
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
    
    
    public Boolean excluir (Propriedade propriedade)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "DELETE FROM propriedade WHERE id = ?";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setInt(1, propriedade.getId());
       
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
    
    public List<Propriedade> listar(Usuario usuario)
    {
        
        //crio a lista de jogadores
        Propriedade propriedade;
        List<Propriedade> lista = new ArrayList<Propriedade>();
        String sql = "SELECT * FROM propriedade WHERE usuario_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setInt(1, usuario.getId());
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                propriedade = new Propriedade ();
                propriedade.setNome(res.getString("nome"));
                propriedade.setCidade(res.getString("cidade"));
                propriedade.setUf(res.getString("uf"));
                propriedade.setUsuario_id(res.getInt("usuario_id"));
                propriedade.setId(res.getInt("id"));
                lista.add(propriedade);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
    
    public Boolean atualizar(Propriedade propriedade){
        Boolean retorno = false;
        String sql = "UPDATE propriedade set nome=?,endereco=?,usuario_id=? where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
            pst.setString(1,propriedade.getNome());
            pst.setString(2, propriedade.getCidade());
            pst.setString(3, propriedade.getUf());
            pst.setInt(4,propriedade.getUsuario_id());
            pst.setInt(5, propriedade.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    public Propriedade loginpro(Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Propriedade propriedade = null;
        String sql = "SELECT * FROM propriedade WHERE id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setInt(1, pro.getId());
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                propriedade = new Propriedade();
                propriedade.setNome(res.getString("nome"));
                propriedade.setCidade(res.getString("cidade"));
                propriedade.setUf(res.getString("uf"));
                propriedade.setUsuario_id(res.getInt("usuario_id"));
                propriedade.setId(res.getInt("id"));
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return propriedade;
        }
    
    public Propriedade loginpro2(Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Propriedade propriedade = null;
        String sql = "SELECT * FROM propriedade WHERE nome=? and cidade = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setString(1, pro.getNome());
            pst.setString(2, pro.getCidade());
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                propriedade = new Propriedade();
                propriedade.setNome(res.getString("nome"));
                propriedade.setCidade(res.getString("cidade"));
                propriedade.setUf(res.getString("uf"));
                propriedade.setUsuario_id(res.getInt("usuario_id"));
                propriedade.setId(res.getInt("id"));
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return propriedade;
        }
}
