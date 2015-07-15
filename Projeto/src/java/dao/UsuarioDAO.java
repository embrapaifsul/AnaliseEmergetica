package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import modelo.Usuario;


public class UsuarioDAO {
    
    public Boolean inserir (Usuario usuario)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO usuario (login,senha,email)" +
                "VALUES (?,?,?)";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setString(1, usuario.getLogin());
        pst.setString(2, usuario.getSenha());
        pst.setString(3, usuario.getEmail());
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
    
      public Boolean excluir (Usuario usuario)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "DELETE FROM usuario WHERE login = ?";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setString(1, usuario.getLogin());
       
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
    
    public List<Usuario> listar()
    {
        
        //crio a lista de jogadores
        
        List<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT * FROM usuario";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Usuario usuario = new Usuario();
                usuario.setLogin(res.getString("login"));
                usuario.setSenha(res.getString("senha"));
                usuario.setEmail(res.getString("email"));
                lista.add(usuario);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
    
    
    public Boolean atualizar(Usuario usuario){
        Boolean retorno = false;
        String sql = "UPDATE usuario set login=?,senha=?,email=? where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
            pst.setString(1,usuario.getLogin());
            pst.setString(2,usuario.getSenha());
            pst.setString(3,usuario.getEmail());
            pst.setInt(4, usuario.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    
    public Usuario login(Usuario usuarioE) 
    {
        
        //crio a lista de jogadores
        
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE login =? AND senha=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setString(1, usuarioE.getLogin());
            pst.setString(2, usuarioE.getSenha());
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
               usuario = new Usuario();
                usuario.setLogin(res.getString("login"));
                usuario.setSenha(res.getString("senha"));
                usuario.setEmail(res.getString("email"));
                usuario.setId(res.getInt("id"));
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return usuario;
        }
        
    }
    

