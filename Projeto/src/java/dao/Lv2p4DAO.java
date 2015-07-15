
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Lv2p4;


public class Lv2p4DAO {
    
    
    public Boolean excluir(Lv2p4 lv2p4){
        Boolean retorno = false;
        String sql = "DELETE FROM lv2p4 where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv2p4.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    
     public Boolean inserir (Lv2p4 lv2p4)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv2p4(" +
"            medicamento, carrapaticidas, sal, racao, compra_de_bovinos," +
"            untensilios_de_uso_geral, semem, mao_de_obra_fixa, mao_de_obra_variavel," +
"            semente, defensivos_agri_para_pastagem, adubos_para_pastagem," +
"            combustivel, reparos_de_maquina, reparo_de_benfeitorias, frete," +
"            arrendamentos_de_campo_nativo, arrendamentos_de_pastagem_cultivada," +
"            impostos, outras_despesas, propriedade_id,ano)" +
"    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?,?)"; 
           
             
            
             
            
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setDouble(1, lv2p4.getMedicamento());
        pst.setDouble(2, lv2p4.getCarrapaticida());
        pst.setDouble(3, lv2p4.getSal());
        pst.setDouble(4, lv2p4.getRacao());
        pst.setDouble(5, lv2p4.getCompradebovinos());
        pst.setDouble(6, lv2p4.getUntesilosdeusogeral());
        pst.setDouble(7, lv2p4.getSemem());
        pst.setDouble(8, lv2p4.getMaodeobrafixa());
        pst.setDouble(9, lv2p4.getMaodeobravariavel());
        pst.setDouble(10,lv2p4.getSemem());
        pst.setDouble(11,lv2p4.getDefensivoagriparapastagem());
        pst.setDouble(12,lv2p4.getAdubosparapastagem());
        pst.setDouble(13, lv2p4.getCombustivel());
        pst.setDouble(14, lv2p4.getReparosmaquina());
        pst.setDouble(15, lv2p4.getReparobanfeitoria());
        pst.setDouble(16, lv2p4.getFrete());
        pst.setDouble(17, lv2p4.getArrendamentocamponativo());
        pst.setDouble(18, lv2p4.getArrendamentopastagemcultivada());
        pst.setDouble(19, lv2p4.getImposto());
        pst.setDouble(20, lv2p4.getOutradespesas());
        pst.setInt(21, lv2p4.getPropriedade_id());
        pst.setString(22, lv2p4.getAno());
        
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
    
     
     public Boolean atualizar(Lv2p4 lv2p4){
        Boolean retorno = false;
        String sql = "UPDATE lv2p4 SET " +
"    medicamento=?, carrapaticidas=?, sal=?, racao=?, compra_de_bovinos=?, " +
"       untensilios_de_uso_geral=?, semem=?, mao_de_obra_fixa=?, mao_de_obra_variavel=?," +
"       semente=?, defensivos_agri_para_pastagem=?, adubos_para_pastagem=?," +
"       combustivel=?, reparos_de_maquina=?, reparo_de_benfeitorias=?, " +
"       frete=?, arrendamentos_de_campo_nativo=?, arrendamentos_de_pastagem_cultivada=?," +
"       impostos=?, outras_despesas=?, propriedade_id=?, ano=?" +
" WHERE  id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
        pst.setDouble(1, lv2p4.getMedicamento());
        pst.setDouble(2, lv2p4.getCarrapaticida());
        pst.setDouble(3, lv2p4.getSal());
        pst.setDouble(4, lv2p4.getRacao());
        pst.setDouble(5, lv2p4.getCompradebovinos());
        pst.setDouble(6, lv2p4.getUntesilosdeusogeral());
        pst.setDouble(7, lv2p4.getSemem());
        pst.setDouble(8, lv2p4.getMaodeobrafixa());
        pst.setDouble(9, lv2p4.getMaodeobravariavel());
        pst.setDouble(10,lv2p4.getSemem());
        pst.setDouble(11,lv2p4.getDefensivoagriparapastagem());
        pst.setDouble(12,lv2p4.getAdubosparapastagem());
        pst.setDouble(13, lv2p4.getCombustivel());
        pst.setDouble(14, lv2p4.getReparosmaquina());
        pst.setDouble(15, lv2p4.getReparobanfeitoria());
        pst.setDouble(16, lv2p4.getFrete());
        pst.setDouble(17, lv2p4.getArrendamentocamponativo());
        pst.setDouble(18, lv2p4.getArrendamentopastagemcultivada());
        pst.setDouble(19, lv2p4.getImposto());
        pst.setDouble(20, lv2p4.getOutradespesas());
        pst.setInt(21, lv2p4.getPropriedade_id());
        pst.setInt(22, lv2p4.getId());
        pst.setString(23, lv2p4.getAno());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Lv1p1DAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
     
      public List<Lv2p4> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv2p4> lista = new ArrayList<Lv2p4>();
        String sql = "SELECT * FROM lv2p4";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv2p4 lv2p4 = new Lv2p4();
                
                
                lv2p4.setMedicamento(res.getDouble("medicamento"));
                lv2p4.setCarrapaticida(res.getDouble("carrapaticidas"));
                lv2p4.setSal(res.getDouble("sal"));
                lv2p4.setRacao(res.getDouble("racao"));
                lv2p4.setCompradebovinos(res.getDouble("compra_de_bovinos"));
                lv2p4.setUntesilosdeusogeral(res.getDouble("untensilios_de_uso_geral"));
                lv2p4.setSemem(res.getDouble("semem"));
                lv2p4.setMaodeobrafixa(res.getDouble("mao_de_obra_fixa"));
                lv2p4.setMaodeobravariavel(res.getDouble("mao_de_obra_variavel"));
                lv2p4.setSemente(res.getDouble("semente"));
                lv2p4.setDefensivoagriparapastagem(res.getDouble("defensivos_agri_para_pastagem"));
                lv2p4.setAdubosparapastagem(res.getDouble("adubos_para_pastagem"));
                lv2p4.setCombustivel(res.getDouble("combustivel"));
                lv2p4.setReparosmaquina(res.getDouble("reparos_de_maquina"));
                lv2p4.setReparobanfeitoria(res.getDouble("reparo_de_benfeitorias"));
                lv2p4.setFrete(res.getDouble("frete"));
                lv2p4.setArrendamentocamponativo(res.getDouble("arrendamentos_de_campo_nativo"));
                lv2p4.setArrendamentopastagemcultivada(res.getDouble("arrendamentos_de_pastagem_cultivada"));
                lv2p4.setImposto(res.getDouble("impostos"));
                lv2p4.setOutradespesas(res.getDouble("outras_despesas"));
                lv2p4.setPropriedade_id(res.getInt("propriedade_id"));
                lv2p4.setAno(res.getString("ano"));

                lista.add(lv2p4);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
}
