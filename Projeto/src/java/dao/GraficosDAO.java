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
import modelo.Lv1p4;
import modelo.Lv2p1;
import modelo.Lv2p2;
import modelo.Lv2p3;
import modelo.Lv2p4;
import modelo.Propriedade;
import modelo.Usuario;

/**
 *
 * @author Lucas
 */
public class GraficosDAO {
    public Lv2p4 graficolv2p4(Propriedade propriedade, String ano) 
    {
        
        //crio a lista de jogadores
        
        Lv2p4 retorno = null;
        String sql = "SELECT * FROM lv2p4 where propriedade_id = ? and ano=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setInt(1, propriedade.getId());
            pst.setString(2, ano);
            
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            if(res.next())
            {
               retorno = new Lv2p4();
                retorno.setMedicamento(res.getDouble("medicamento"));
                retorno.setCarrapaticida(res.getDouble("carrapaticidas"));
                retorno.setSal(res.getDouble("sal"));
                retorno.setRacao(res.getDouble("racao"));
                retorno.setCompradebovinos(res.getDouble("compra_de_bovinos"));
                retorno.setUntesilosdeusogeral(res.getDouble("untensilios_de_uso_geral"));
                retorno.setSemem(res.getDouble("semem"));
                retorno.setMaodeobrafixa(res.getDouble("mao_de_obra_fixa"));
                retorno.setMaodeobravariavel(res.getDouble("mao_de_obra_variavel"));
                retorno.setSemente(res.getDouble("semente"));
                retorno.setDefensivoagriparapastagem(res.getDouble("defensivos_agri_para_pastagem"));
                retorno.setAdubosparapastagem(res.getDouble("adubos_para_pastagem"));
                retorno.setCombustivel(res.getDouble("combustivel"));
                retorno.setReparosmaquina(res.getDouble("reparos_de_maquina"));
                retorno.setReparobanfeitoria(res.getDouble("reparo_de_benfeitorias"));
                retorno.setFrete(res.getDouble("frete"));
                retorno.setArrendamentocamponativo(res.getDouble("arrendamentos_de_campo_nativo"));
                retorno.setArrendamentopastagemcultivada(res.getDouble("arrendamentos_de_pastagem_cultivada"));
                retorno.setImposto(res.getDouble("impostos"));
                retorno.setOutradespesas(res.getDouble("outras_despesas"));
              
                
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return retorno;
        }
    
    public Lv2p1 graficolv2p1(Propriedade propriedade) 
    {
        
        //crio a lista de jogadores
        
        Lv2p1 retorno = null;
        String sql = "SELECT * FROM lv2p1 WHERE propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setInt(1, propriedade.getId());
            
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            if(res.next())
            {
               retorno = new Lv2p1();
                retorno.setPastagemnativa(res.getDouble("pastagem_nativa"));
                retorno.setPastagemnativamelhorada(res.getDouble("pastagem_nativa_melhorada"));
                retorno.setPastagemcultivadaperene(res.getDouble("pastagem_cultivada_perene"));
               retorno.setPastagemanuaisdeinverno(res.getDouble("pastagem_anuais_de_inverno"));
               retorno.setPastagemanuaisdeverao(res.getDouble("pastagem_anuais_de_verao"));
               retorno.setAgriculturai(res.getDouble("agricultura_i"));
               retorno.setAgriculturav(res.getDouble("agricultura_v"));
               retorno.setFlorestaplantadas(res.getDouble("florestas_plantadas"));
               retorno.setOutrasplantadas(res.getDouble("outras_culturas"));
               retorno.setMatasnativas(res.getDouble("matas_nativas"));
               retorno.setSea(res.getDouble("sea"));
               retorno.setInaproveitavel(res.getDouble("inaproveitavel"));           
                                                                            
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return retorno;
        }
        
    
    public Lv2p2 graficolv2p2(Propriedade propriedade) 
    {
        
    List<Lv2p2> lista = null;
        //crio a lista de jogadores
        
        Lv2p2 retorno = null;
        String sql = "SELECT * FROM lv2p2 WHERE propriedade_id=?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        
        try {
            pst.setInt(1, propriedade.getId());
            
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            if(res.next())
            {
               retorno = new Lv2p2();
                retorno.setVacadecriajanmar(res.getInt("vaca_de_cria_janmar"));
                retorno.setVacadecriaabrjun(res.getInt("vaca_de_cria_abrjun"));
                retorno.setVacadecriajulset(res.getInt("vaca_de_cria_julset"));
                retorno.setVacadecriaoutdez(res.getInt("vaca_de_cria_outdez"));

                retorno.setVacadedescartejanmar(res.getInt("vaca_de_descarte_janmar"));
                retorno.setVacadedescarteabrjun(res.getInt("vaca_de_descarte_abrjun"));
                retorno.setVacadedescartejulset(res.getInt("vaca_de_descarte_julset"));
                retorno.setVacadedescarteoutdez(res.getInt("vaca_de_descarte_outdez"));

                retorno.setTerneirosjanmar(res.getInt("terneiros_janmar"));
                retorno.setTerneirosabrjun(res.getInt("terneiros_abrjun"));
                retorno.setTerneirosjulset(res.getInt("terneiros_julset"));
                retorno.setTerneirosoutdez(res.getInt("terneiros_outdez"));

                retorno.setTerneirasjanmar(res.getInt("terneiras_janmar"));
                retorno.setTerneirasabrjun(res.getInt("terneiras_abrjun"));
                retorno.setTerneirasjulset(res.getInt("terneiras_julset"));
                retorno.setTerneirasoutdez(res.getInt("terneiras_outdez"));

                retorno.setNovilho1324janmar(res.getInt("novilhos_13a24_janmar"));
                retorno.setNovilho1324abrjun(res.getInt("novilhos_13a24_abrjun"));
                retorno.setNovilho1324julset(res.getInt("novilhos_13a24_julset"));
                retorno.setNovilho1324outdez(res.getInt("novilhos_13a24_outdez"));

                retorno.setNovilha1324janmar(res.getInt("novilhas_13a24_janmar"));
                retorno.setNovilha1324abrjun(res.getInt("novilhas_13a24_abrjun"));
                retorno.setNovilha1324julset(res.getInt("novilhas_13a24_julset"));
                retorno.setNovilha1324outdez(res.getInt("novilhas_13a24_outdez"));

                retorno.setNovilho2536janmar(res.getInt("novilhos_25a36_janmar"));
                retorno.setNovilho2536abrjun(res.getInt("novilhos_25a36_abrjun"));
                retorno.setNovilho2536julset(res.getInt("novilhos_25a36_julset"));
                retorno.setNovilho2536outdez(res.getInt("novilhos_25a36_outdez"));

                retorno.setNovilha2536janmar(res.getInt("novilhas_25a36_janmar"));
                retorno.setNovilha2536abrjun(res.getInt("novilhas_25a36_abrjun"));
                retorno.setNovilha2536julset(res.getInt("novilhas_25a36_julset"));
                retorno.setNovilha2536outdez(res.getInt("novilhas_25a36_outdez"));

                retorno.setNovilho36janmar(res.getInt("novilho_36_janmar"));
                retorno.setNovilho36abrjun(res.getInt("novilho_36_abrjun"));
                retorno.setNovilho36julset(res.getInt("novilho_36_julset"));
                retorno.setNovilho36outdez(res.getInt("novilho_36_outdez"));

                retorno.setTourojanmar(res.getInt("touro_janmar"));
                retorno.setTouroabrjun(res.getInt("touro_abrjun"));
                retorno.setTourojulset(res.getInt("touro_julset"));
                retorno.setTourooutdez(res.getInt("touro_outdez"));
     
                                                                            
            }
            } catch(SQLException ex){
               
               ex.printStackTrace();
            }
        return retorno;
           
                                                                            
            
            
        }
    
  
    public Lv2p3 graficolv2p3(Propriedade propriedade) {
      Lv2p3 lv2p3 = null;
        //crio a lista de jogadores
       
        String sql = "SELECT * FROM lv2p3 WHERE propriedade_id = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            pst.setInt(1, propriedade.getId());
            //Executo o sql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
             
          
            if (res.next()) {
               lv2p3 = new Lv2p3 ();
                lv2p3.setTerneiroquant(res.getInt("terneiros_quant"));
                lv2p3.setTerneirovalor(res.getDouble("terneiros_valor"));

                lv2p3.setTerneiraquant(res.getInt("terneiras_quant"));
                lv2p3.setTerneiravalor(res.getDouble("terneiras_valor"));

                lv2p3.setNovilhaquant(res.getInt("novilhas_quant"));
                lv2p3.setNovilhavalor(res.getDouble("novilhas_valor"));

                lv2p3.setVacadedescartequant(res.getInt("vacas_de_descarte_quant"));
                lv2p3.setVacadedescartevalor(res.getDouble("vacas_de_descarte_valor"));

                lv2p3.setVacaprenhasquant(res.getInt("vaca_prenha_quant"));
                lv2p3.setVacaprenhavalor(res.getDouble("vaca_prenha_valor"));

                lv2p3.setVacacomcriaquant(res.getInt("vaca_com_cria_quant"));
                lv2p3.setVacacomcriavalor(res.getDouble("vaca_com_cria_valor"));

                lv2p3.setVacagordaquant(res.getInt("vaca_gorda_quant"));
                lv2p3.setVacagordavalor(res.getDouble("vaca_gorda_valor"));

                lv2p3.setNovilhorecriaquant(res.getInt("novilho_pra_recria_quant"));
                lv2p3.setNovilhorecriavalor(res.getDouble("novilho_pra_recria_valor"));

                lv2p3.setNovilhogordoquant(res.getInt("novilho_gordo_quant"));
                lv2p3.setNovilhogordovalor(res.getDouble("novilho_gordo_valor"));

                lv2p3.setTorunosquant(res.getInt("torunos_quant"));
                lv2p3.setTorunovalor(res.getDouble("torunos_valor"));

                lv2p3.setTouroquant(res.getInt("touro_quant"));
                lv2p3.setTourovalor(res.getDouble("touro_valor"));
                
                
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return lv2p3;
    }
    
    
    
    
    
    public Lv1p4 graficolv1p4(Propriedade propriedade, String ano) {
      Lv1p4 lv1p4 = null;
        //crio a lista de jogadores
        List<Lv1p4> lista = null;
        String sql = "SELECT * FROM lv1p4 WHERE propriedade_id = ? AND ano =?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);

        try {
            pst.setInt(1, propriedade.getId());
            pst.setString(2, ano);
            //Executo o aql e jogo em um resultSet
            ResultSet res = pst.executeQuery();
             
            //Eqaunto tiver REGISTRO eu vou relacionar
            //com a minha classe Jogador e adicionar na lista 
            if (res.next()) {
               lv1p4 = new Lv1p4 ();
               lv1p4.setMadicamento(res.getDouble("medicamento"));
               lv1p4.setMao_de_obra(res.getDouble("mao_de_obra"));
               lv1p4.setMaquinas(res.getDouble("maquinas"));
               lv1p4.setPastagem(res.getDouble("pastagem"));
               lv1p4.setOutros(res.getDouble("outros"));
               
                
                
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return lv1p4;
    }
    
    
    
    
    }

