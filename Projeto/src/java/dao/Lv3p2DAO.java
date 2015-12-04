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
import modelo.Lv3p2;
import modelo.Propriedade;

/**
 *
 * @author Aluno
 */
public class Lv3p2DAO {
    public Boolean inserir(Lv3p2 lv3p2)
    {
        
        Boolean retorno;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv3p2 (combustivel, eletricidade, materiais_manutencao," +
"manutencao, impostos, servicos_privados, telefone, touro, vacas_invernar," +
"novilhos, vacina_ovinos, vermifugos_ovinos, vacina_bovinos, vermifugos_bovinos," +
"vermifugo_equinos, semente_milho, semente_azevem, remedio, comida," +
"plano_saude, ano, propriedade_id,depreciacao)" +
"    VALUES (?, ?, ?,?, ?, ?, ?, ?, ?,?,"+
"?, ?, ?, ?, ?,?, ?, ?, ?,?,"+
"?, ?,?);";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
       
        pst.setDouble(1, lv3p2.getCombustivel());
        pst.setDouble(2, lv3p2.getEletricidade());
        pst.setDouble(3, lv3p2.getMateriaisManutencao());
        pst.setDouble(4, lv3p2.getManutencao());
        pst.setDouble(5, lv3p2.getImpostos());
        pst.setDouble(6, lv3p2.getServicosPrivados());
        pst.setDouble(7, lv3p2.getTelefone());
        pst.setDouble(8, lv3p2.getTouro());
        pst.setDouble(9, lv3p2.getVacasInvernar());
        pst.setDouble(10, lv3p2.getNovilhos());
        pst.setDouble(11, lv3p2.getVacinaOvinos());
        pst.setDouble(12, lv3p2.getVermifugosOvinos());
        pst.setDouble(13, lv3p2.getVacinaBovinos());
        pst.setDouble(14, lv3p2.getVermifugosBovinos());
        pst.setDouble(15, lv3p2.getVermifugoEquinos());
        pst.setDouble(16, lv3p2.getSementeMilho());
        pst.setDouble(17, lv3p2.getSementeAzevem());
        pst.setDouble(18, lv3p2.getRemedio());
        pst.setDouble(19, lv3p2.getComida());
        pst.setDouble(20, lv3p2.getPlanoSaude());     
        pst.setString(21, lv3p2.getAno());
        pst.setInt(22, lv3p2.getPropriedade_id());
        pst.setDouble(23, lv3p2.getDepreciacao());
        
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
    
    
     public Boolean excluir(Lv3p2 lv3p2){
        Boolean retorno = false;
        String sql = "DELETE FROM lv3p2 where propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv3p2.getPropriedade_id());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
     
     
       public List<Lv3p2> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv3p2> lista = new ArrayList<Lv3p2>();
        String sql = "SELECT * FROM lv3p2";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv3p2 lv3p2 = new Lv3p2();
                lv3p2.setDepreciacao(res.getDouble("depreciacao"));
                lv3p2.setCombustivel(res.getDouble("combustivel"));
                lv3p2.setEletricidade(res.getDouble("eletrecidade"));
                lv3p2.setMateriaisManutencao(res.getDouble("materiais_manutencao"));
                lv3p2.setManutencao(res.getDouble("manutencao"));
                lv3p2.setImpostos(res.getDouble("impostos"));
                lv3p2.setServicosPrivados(res.getDouble("servicos_privados"));
                lv3p2.setTelefone(res.getDouble("telefone"));
                lv3p2.setTouro(res.getDouble("touro"));
                lv3p2.setVacasInvernar(res.getDouble("vacas_invernar"));
                lv3p2.setNovilhos(res.getDouble("novilhos"));
                lv3p2.setVacinaOvinos(res.getDouble("vacina_ovinos"));
                lv3p2.setVermifugosOvinos(res.getDouble("vermifugos_ovinos"));
                lv3p2.setVacinaBovinos(res.getDouble("vacina_bovinos"));
                lv3p2.setVermifugosBovinos(res.getDouble("vermifugos_bovinos"));
                lv3p2.setVermifugoEquinos(res.getDouble("vermifugo_equinos"));
                lv3p2.setSementeMilho(res.getDouble("semente_milho"));
                lv3p2.setSementeAzevem(res.getDouble("semente_azevem"));
                lv3p2.setRemedio(res.getDouble("remedio"));
                lv3p2.setComida(res.getDouble("comida"));
                lv3p2.setPlanoSaude(res.getDouble("plano_saude"));
                
                lv3p2.setAno(res.getString("ano"));
                lv3p2.setPropriedade_id(res.getInt("propiedade_id"));                
                lista.add(lv3p2);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
       
       
       
        public Lv3p2 buscar(String ano, Propriedade pro)
    {
        
        //crio a lista de jogadores
        
        Lv3p2 lv3p2 = null;
        String sql = "SELECT * FROM lv3p2 WHERE ano = ? AND propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o sql e jogo em um resultSet
             pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();
           
         
            if(res.next())
            {
                lv3p2 = new Lv3p2();
              lv3p2.setDepreciacao(res.getDouble("depreciacao"));
                lv3p2.setCombustivel(res.getDouble("combustivel"));
                lv3p2.setEletricidade(res.getDouble("eletricidade"));
                lv3p2.setMateriaisManutencao(res.getDouble("materiais_manutencao"));
                lv3p2.setManutencao(res.getDouble("manutencao"));
                lv3p2.setImpostos(res.getDouble("impostos"));
                lv3p2.setServicosPrivados(res.getDouble("servicos_privados"));
                lv3p2.setTelefone(res.getDouble("telefone"));
                lv3p2.setTouro(res.getDouble("touro"));
                lv3p2.setVacasInvernar(res.getDouble("vacas_invernar"));
                lv3p2.setNovilhos(res.getDouble("novilhos"));
                lv3p2.setVacinaOvinos(res.getDouble("vacina_ovinos"));
                lv3p2.setVermifugosOvinos(res.getDouble("vermifugos_ovinos"));
                lv3p2.setVacinaBovinos(res.getDouble("vacina_bovinos"));
                lv3p2.setVermifugosBovinos(res.getDouble("vermifugos_bovinos"));
                lv3p2.setVermifugoEquinos(res.getDouble("vermifugo_equinos"));
                lv3p2.setSementeMilho(res.getDouble("semente_milho"));
                lv3p2.setSementeAzevem(res.getDouble("semente_azevem"));
                lv3p2.setRemedio(res.getDouble("remedio"));
                lv3p2.setComida(res.getDouble("comida"));
                lv3p2.setPlanoSaude(res.getDouble("plano_saude"));
                
                lv3p2.setAno(res.getString("ano"));
                lv3p2.setPropriedade_id(res.getInt("propiedade_id"));                            
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lv3p2;
        }
      
        
        
        public Boolean atualizar(Lv3p2 lv3p2){
        Boolean retorno = false;
        String sql = "UPDATE lv3p2 SET depreciacao=?, combustivel=?, eletricidade=?, materiais_manutencao=?," +
"manutencao=?, impostos=?, servicos_privados=?, telefone=?, touro=?," +
"vacas_invernar=?, novilhos=?, vacina_ovinos=?, vermifugos_ovinos=?," +
"vacina_bovinos=?, vermifugos_bovinos=?, vermifugo_equinos=?," +
"semente_milho=?, semente_azevem=?, remedio=?, comida=?, plano_saude=?" +
" WHERE propriedade_id=? AND ano=?;";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
        pst.setDouble(1, lv3p2.getDepreciacao());
        pst.setDouble(2, lv3p2.getCombustivel());
        pst.setDouble(3, lv3p2.getEletricidade());
        pst.setDouble(4, lv3p2.getMateriaisManutencao());
        pst.setDouble(5, lv3p2.getManutencao());
        pst.setDouble(6, lv3p2.getImpostos());
        pst.setDouble(7, lv3p2.getServicosPrivados());
        pst.setDouble(8, lv3p2.getTelefone());
        pst.setDouble(9, lv3p2.getTouro());
        pst.setDouble(10, lv3p2.getVacasInvernar());
        pst.setDouble(11, lv3p2.getNovilhos());
        pst.setDouble(12, lv3p2.getVacinaOvinos());
        pst.setDouble(13, lv3p2.getVermifugosOvinos());
        pst.setDouble(14, lv3p2.getVacinaBovinos());
        pst.setDouble(15, lv3p2.getVermifugosBovinos());
        pst.setDouble(16, lv3p2.getVermifugoEquinos());
        pst.setDouble(17, lv3p2.getSementeMilho());
        pst.setDouble(18, lv3p2.getSementeAzevem());
        pst.setDouble(19, lv3p2.getRemedio());
        pst.setDouble(20, lv3p2.getComida());
        pst.setDouble(21, lv3p2.getPlanoSaude());     
        pst.setInt(22, lv3p2.getPropriedade_id());
        pst.setString(23, lv3p2.getAno());
     
        
        
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
