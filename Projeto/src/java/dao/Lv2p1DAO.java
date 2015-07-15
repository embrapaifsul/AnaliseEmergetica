
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Lv2p1;

/**
 *
 * @author Lucas
 */
public class Lv2p1DAO {
    public Boolean inserir (Lv2p1 lv2p1)
    {
        
        Boolean retorno = false;
        //Mostra o sql de insert da tabela
        String sql = "INSERT INTO lv2p1 (pastagem_nativa,pastagem_nativa_melhorada,pastagem_cultivada_perene,"
                + "pastagem_anuais_de_inverno,pastagem_anuais_de_verao,agricultura_i,agricultura_v,"
                + "florestas_plantadas,outras_culturas,matas_nativas,sea,inaproveitavel,propriedade_id,ano)" +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //Prepara a conexão
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
       try{ 
        pst.setDouble(1, lv2p1.getPastagemnativa());
        pst.setDouble(2, lv2p1.getPastagemnativamelhorada());
        pst.setDouble(3, lv2p1.getPastagemcultivadaperene());
        pst.setDouble(4, lv2p1.getPastagemanuaisdeinverno());
        pst.setDouble(5, lv2p1.getPastagemanuaisdeverao());
        pst.setDouble(6, lv2p1.getAgriculturai());
        pst.setDouble(7, lv2p1.getAgriculturav());
        pst.setDouble(8, lv2p1.getFlorestaplantadas());
        pst.setDouble(9, lv2p1.getOutrasplantadas());
        pst.setDouble(10,lv2p1.getMatasnativas());
        pst.setDouble(11,lv2p1.getSea());
        pst.setDouble(12,lv2p1.getInaproveitavel());
        pst.setInt(13, lv2p1.getPropriedade_id());
        pst.setString(14, lv2p1.getAno());
        
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
    
    public Boolean excluir(Lv2p1 lv2p1){
        Boolean retorno = false;
        String sql = "DELETE FROM lv2p1 where id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {           
            pst.setInt(1,lv2p1.getId());
        
        if(pst.executeUpdate() > 0){
            retorno = true;
        }
        
        
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        }
        return retorno;
        
    }
    
     public List<Lv2p1> listar()
    {
        
        //crio a lista de jogadores
        
        List<Lv2p1> lista = new ArrayList<Lv2p1>();
        String sql = "SELECT * FROM lv2p1";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            while(res.next())
            {
                Lv2p1 lv2p1 = new Lv2p1();
                lv2p1.setPastagemnativa(res.getDouble("pastagem_nativa"));
                lv2p1.setPastagemnativamelhorada(res.getDouble("pastagem_nativa_melhorada"));
                lv2p1.setPastagemcultivadaperene(res.getDouble("pastagem_cultivada_perene"));
                lv2p1.setPastagemanuaisdeinverno(res.getDouble("pastagem_anuais_de_inverno"));
                lv2p1.setPastagemanuaisdeverao(res.getDouble("pastagem_anuais_de_verao"));
                lv2p1.setAgriculturai(res.getDouble("agricultura_i"));
                lv2p1.setAgriculturav(res.getDouble("agricultura_v"));
                lv2p1.setFlorestaplantadas(res.getDouble("floresta_plantadas"));
                lv2p1.setOutrasplantadas(res.getDouble("outras_culturas"));
                lv2p1.setMatasnativas(res.getDouble("matas_nativas"));
                lv2p1.setSea(res.getDouble("sea"));
                lv2p1.setInaproveitavel(res.getDouble("inaproveitavel"));
                lv2p1.setPropriedade_id(res.getInt("propriedade_id"));
                lv2p1.setAno(res.getString("ano"));
                lista.add(lv2p1);
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return lista;
        }
     
     
       public Boolean atualizar(Lv2p1 lv2p1){
        Boolean retorno = false;
        String sql = "UPDATE lv2p1 SET pastagem_nativa = ?,pastagem_nativa_melhorada=?,pastagem_cultivada_perene=?,"
                + "pastagem_anuais_de_inverno=?,pastagem_anuais_de_verao=?,agricultura_i=?,agricultura_v=?"
                + "florestas_plantadas=?,outras_culturas=?,matas_nativas=?,sea=?,inaproveitavel=?,propriedade_id=?,ano=? WHERE id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            
            
        pst.setDouble(1, lv2p1.getPastagemnativa());
        pst.setDouble(2, lv2p1.getPastagemnativamelhorada());
        pst.setDouble(3, lv2p1.getPastagemcultivadaperene());
        pst.setDouble(4, lv2p1.getPastagemanuaisdeinverno());
        pst.setDouble(5, lv2p1.getPastagemanuaisdeverao());
        pst.setDouble(6, lv2p1.getAgriculturai());
        pst.setDouble(7, lv2p1.getAgriculturav());
        pst.setDouble(8, lv2p1.getFlorestaplantadas());
        pst.setDouble(9, lv2p1.getOutrasplantadas());
        pst.setDouble(10,lv2p1.getMatasnativas());
        pst.setDouble(11,lv2p1.getSea());
        pst.setDouble(12,lv2p1.getInaproveitavel());
        pst.setInt(13, lv2p1.getPropriedade_id());
        pst.setInt(14, lv2p1.getId());
        pst.setString(15, lv2p1.getAno());
        
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
