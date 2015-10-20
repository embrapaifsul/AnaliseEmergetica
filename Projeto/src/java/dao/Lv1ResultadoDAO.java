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
import modelo.Lv1Resultado;
import modelo.Propriedade;

/**
 *
 * @author Aluno
 */
public class Lv1ResultadoDAO {

    public Boolean inserir(Lv1Resultado Lv1resultado) {

        Boolean retorno;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv1resultado (custohectar,lotacaomedia,receitahectar,totalcustoproducao,ano,propriedade_id)"
                + "VALUES (?,?,?,?,?,?)";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            pst.setDouble(1, Lv1resultado.getCustohectar());
            pst.setDouble(2, Lv1resultado.getLotacaomedia());
            pst.setDouble(3, Lv1resultado.getReceitahectar());
            pst.setDouble(4, Lv1resultado.getTotalcustoproducao());
            pst.setString(5, Lv1resultado.getAno());
            pst.setInt(6, Lv1resultado.getPropriedade_id());

            pst.executeUpdate();

            retorno = true;
        } catch (Exception ex) {
            ex.printStackTrace();

            retorno = false;
        }

        return retorno;
    }

    public Boolean excluir(Lv1Resultado Lv1resultado) {
        
        Boolean retorno = false;
        String sql = "DELETE FROM lv1resultado where propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setInt(1, Lv1resultado.getPropriedade_id());

            if (pst.executeUpdate() > 0) {
                retorno = true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;

    }

    public List<Lv1Resultado> listar() {

        //crio a lista de jogadores
        List<Lv1Resultado> lista = new ArrayList<Lv1Resultado>();
        String sql = "SELECT * FROM lv1resultado";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while (res.next()) {
                Lv1Resultado a = new Lv1Resultado();
                a.setCustohectar(res.getDouble("custohectar"));
                a.setLotacaomedia(res.getDouble("lotacaomedia"));
                a.setReceitahectar(res.getDouble("receitahectar"));
                a.setTotalcustoproducao(res.getDouble("totalcustoproducao"));
                a.setAno(res.getString("ano"));
                a.setPropriedade_id(res.getInt("propriedade_id"));
                lista.add(a);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return lista;
    }

    public Lv1Resultado buscar(String ano, Propriedade pro) {

        //crio a lista de jogadores
        Lv1Resultado Lv1resultado = null;
        String sql = "SELECT * FROM lv1resultado WHERE ano = ? AND propriedade_id = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            //Executo o aql e jogo em um resultSet
            pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();

            if (res.next()) {
                Lv1resultado = new Lv1Resultado();
                Lv1resultado.setCustohectar(res.getDouble("custohectar"));
                Lv1resultado.setLotacaomedia(res.getDouble("lotacaomedia"));
                Lv1resultado.setReceitahectar(res.getDouble("receitahectar"));
                Lv1resultado.setTotalcustoproducao(res.getDouble("totalcustoproducao"));
                Lv1resultado.setAno(res.getString("ano"));
                Lv1resultado.setPropriedade_id(res.getInt("propriedade_id"));

            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return Lv1resultado;
    }

    public Boolean atualizar(Lv1Resultado Lv1resultado) {
        Boolean retorno = false;
        String sql = "UPDATE lv1resultado set ano=?,custohectar=?,lotacaomedia=?,receitahectar=?,totalcustoproducao=?,propriedade_id=? where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {

            pst.setString(1, Lv1resultado.getAno());
            pst.setDouble(2, Lv1resultado.getCustohectar());
            pst.setDouble(3, Lv1resultado.getLotacaomedia());
            pst.setDouble(4, Lv1resultado.getReceitahectar());
            pst.setDouble(5, Lv1resultado.getTotalcustoproducao());
            pst.setInt(6, Lv1resultado.getPropriedade_id());

            if (pst.executeUpdate() > 0) {
                retorno = true;
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;

    }
    
    public Lv1Resultado media() {

        //crio a lista de jogadores
        Lv1Resultado Lv1resultado = null;
        String sql = "select avg(totalcustoproducao) from lv1resultado";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            //Executo o aql e jogo em um resultSet
            //pst.setString(1, ano);
            //pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();

            if (res.next()) {
                
                
                Lv1resultado = new Lv1Resultado();
                Lv1resultado.setTotalcustoproducao(res.getDouble("totalcustoproducao"));
                

            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return Lv1resultado;
    }
}
