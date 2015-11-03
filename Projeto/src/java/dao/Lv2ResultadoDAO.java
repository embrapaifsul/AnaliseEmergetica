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
import modelo.Lv2Resultado;
import modelo.Propriedade;

/**
 *
 * @author Aluno
 */
public class Lv2ResultadoDAO {
    public Boolean inserir(Lv2Resultado Lv2resultado) {

        Boolean retorno;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv2resultado(\n" +
                                "areamedia, areaaproveitavel, percentualrebanhocomcria, lotacaomedia2, \n" +
                                "totalreceita, receitahectar2, custotalproducao, custoatividadecria1, \n" +
                                "custoproducaohectar1, custoterneiro, ano, propriedade_id)\n" +
                     "VALUES (?, ?, ?, ?, \n" +
                                "?, ?, ?, ?, \n" +
                                "?, ?, ?, ?);";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            pst.setDouble(1, Lv2resultado.getAreamedia());
            pst.setDouble(2, Lv2resultado.getAreaaproveitavel());
            pst.setDouble(3, Lv2resultado.getPercentualrebanhocomcria());
            pst.setDouble(4, Lv2resultado.getLotacaomedia2());
            pst.setDouble(5, Lv2resultado.getTotalreceita());
            pst.setDouble(6, Lv2resultado.getReceitahectar2());
            pst.setDouble(7, Lv2resultado.getCustotalproducao());
            pst.setDouble(8, Lv2resultado.getCustoatividadecria1());
            pst.setDouble(9, Lv2resultado.getCustoproducaohectar1());
            pst.setDouble(10, Lv2resultado.getCustoterneiro());
            pst.setString(11, Lv2resultado.getAno());
            pst.setInt(12, Lv2resultado.getPropriedade_id());

            pst.executeUpdate();

            retorno = true;
        } catch (Exception ex) {
            ex.printStackTrace();

            retorno = false;
        }

        return retorno;
    }

    public Boolean excluir(Lv2Resultado Lv2resultado) {
        
        Boolean retorno = false;
        String sql = "DELETE FROM lv1resultado where propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setInt(1, Lv2resultado.getPropriedade_id());

            if (pst.executeUpdate() > 0) {
                retorno = true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;

    }

    public List<Lv2Resultado> listar() {

        //crio a lista de jogadores
        List<Lv2Resultado> lista = new ArrayList<Lv2Resultado>();
        String sql = "SELECT * FROM lv2resultado";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while (res.next()) {
                Lv2Resultado a = new Lv2Resultado();
                a.setAreaaproveitavel(res.getDouble("areaaproveitavel"));
                a.setAreamedia(res.getDouble("areamedia"));
                a.setCustoatividadecria1(res.getDouble("custoatividadecria1"));
                a.setCustoproducaohectar1(res.getDouble("custoproducaohectar1"));
                a.setCustotalproducao(res.getDouble("custototalproducao"));
                a.setCustoterneiro(res.getDouble("custoterneiro"));
                a.setLotacaomedia2(res.getDouble("lotacaomedia2"));
                a.setPercentualrebanhocomcria(res.getDouble("percentualrebanhocomcria"));
                a.setReceitahectar2(res.getDouble("receitahectar2"));
                a.setTotalreceita(res.getDouble("totalreceita"));
                a.setAno(res.getString("ano"));
                a.setPropriedade_id(res.getInt("propriedade_id"));
                lista.add(a);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return lista;
    }

    public Lv2Resultado buscar(String ano, Propriedade pro) {

        //crio a lista de jogadores
        Lv2Resultado Lv2resultado = null;
        String sql = "SELECT * FROM lv2resultado WHERE ano = ? AND propriedade_id = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            //Executo o aql e jogo em um resultSet
            pst.setString(1, ano);
            pst.setInt(2, pro.getId());
            ResultSet res = pst.executeQuery();

            if (res.next()) {
                Lv2resultado = new Lv2Resultado();
                Lv2resultado.setAreaaproveitavel(res.getDouble("areaaproveitavel"));
                Lv2resultado.setAreamedia(res.getDouble("areamedia"));
                Lv2resultado.setCustoatividadecria1(res.getDouble("custoatividadecria1"));
                Lv2resultado.setCustoproducaohectar1(res.getDouble("custoproducaohectar1"));
                Lv2resultado.setCustotalproducao(res.getDouble("custototalproducao"));
                Lv2resultado.setCustoterneiro(res.getDouble("custoterneiro"));
                Lv2resultado.setLotacaomedia2(res.getDouble("lotacaomedia2"));
                Lv2resultado.setPercentualrebanhocomcria(res.getDouble("percentualrebanhocomcria"));
                Lv2resultado.setReceitahectar2(res.getDouble("receitahectar2"));
                Lv2resultado.setTotalreceita(res.getDouble("totalreceita"));
                Lv2resultado.setAno(res.getString("ano"));
                Lv2resultado.setPropriedade_id(res.getInt("propriedade_id"));

            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return Lv2resultado;
    }
    
     public Lv2Resultado media() {

        //crio a lista de jogadores
        Lv2Resultado Lv2resultado = null;
        String sql = "SELECT ROUND(avg(areamedia),2) as areamedia, \n" +
"	ROUND(avg(areaaproveitavel),2) as  areaaproveitavel,\n" +
"	ROUND(avg(percentualrebanhocomcria),2) as  percentualrebanhocomcria,\n" +
"	ROUND(avg(lotacaomedia2),2) as  lotacaomedia2,\n" +
"       ROUND(avg(totalreceita),2) as  totalreceita,\n" +
"       ROUND(avg(receitahectar2),2) as  receitahectar2,\n" +
"       ROUND(avg(custotalproducao),2) as  custotalproducao,\n" +
"       ROUND(avg(custoatividadecria1),2) as custoatividadecria1,\n" +
"       ROUND(avg(custoproducaohectar1),2) as custoproducaohectar1,\n" +
"       ROUND(avg(custoterneiro),2) as custoterneiro\n" +
"  FROM lv2resultado;";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            
            ResultSet res = pst.executeQuery();

            if (res.next()) {
                Lv2resultado = new Lv2Resultado();
                Lv2resultado.setAreamedia(res.getDouble("areamedia"));
                Lv2resultado.setAreaaproveitavel(res.getDouble("areaaproveitavel"));  
                Lv2resultado.setPercentualrebanhocomcria(res.getDouble("percentualrebanhocomcria"));
                Lv2resultado.setLotacaomedia2(res.getDouble("lotacaomedia2"));
                Lv2resultado.setTotalreceita(res.getDouble("totalreceita"));
                Lv2resultado.setReceitahectar2(res.getDouble("receitahectar2"));
                Lv2resultado.setCustotalproducao(res.getDouble("custotalproducao"));
                Lv2resultado.setCustoatividadecria1(res.getDouble("custoatividadecria1"));
                Lv2resultado.setCustoproducaohectar1(res.getDouble("custoproducaohectar1"));
                Lv2resultado.setCustoterneiro(res.getDouble("custoterneiro"));
                
                
                
                

            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return Lv2resultado;
    }

    public Boolean atualizar(Lv2Resultado Lv2resultado) {
        Boolean retorno = false;
        String sql = "UPDATE lv2resultado\n" +
                     "SET areamedia=?, areaaproveitavel=?, percentualrebanhocomcria=?, \n" +
                            "lotacaomedia2=?, totalreceita=?, receitahectar2=?, custotalproducao=?, \n" +
                            "custoatividadecria1=?, custoproducaohectar1=?, custoterneiro=?, \n" +
                            "ano=?, propriedade_id=? where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {

            
            pst.setDouble(1, Lv2resultado.getAreamedia());
            pst.setDouble(2, Lv2resultado.getAreaaproveitavel());
            pst.setDouble(3, Lv2resultado.getPercentualrebanhocomcria());
            pst.setDouble(4, Lv2resultado.getLotacaomedia2());
            pst.setDouble(5, Lv2resultado.getTotalreceita());
            pst.setDouble(6, Lv2resultado.getReceitahectar2());
            pst.setDouble(7, Lv2resultado.getCustotalproducao());
            pst.setDouble(8, Lv2resultado.getCustoatividadecria1());
            pst.setDouble(9, Lv2resultado.getCustoproducaohectar1());
            pst.setDouble(10, Lv2resultado.getCustoterneiro());
            pst.setString(11, Lv2resultado.getAno());
            pst.setInt(12, Lv2resultado.getPropriedade_id());

            if (pst.executeUpdate() > 0) {
                retorno = true;
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;

    }
}
