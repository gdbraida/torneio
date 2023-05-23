package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JogadorDAO {
        private static Connection conn;
        
        public JogadorDAO() throws ClassNotFoundException, SQLException {
            conn = MyConnection.getConnection();
        }
        
        //INSERT
        public void insertJogador(Jogador mapa) throws SQLException{
           //Criando a query genérica
            String sql = "INSERT INTO jogadores(nome, apelido, senha)"
                                        + "VALUES (?, ?, ?)";
            
            //Instanciando o objeto de conexão informando a query
            PreparedStatement prep = conn.prepareStatement(sql);
            
            //Informando os parâmetros enviados para a query
            prep.setString(1, mapa.getNome());
            prep.setString(2, mapa.getApelido());
            prep.setString(3, mapa.getSenha());
            
            prep.execute(); //Lançando o SQL pronto na base de dados
            prep.close();
        }//Fim do método insertJogador
        
        
        //SELECT
        public ArrayList<Jogador> listJogador() throws SQLException {
            //Criação de uma lista vazia (específica de Jogadors)
            ArrayList<Jogador> list = new ArrayList<>();
            
            String sql = "SELECT * FROM jogadores";
            PreparedStatement prep = conn.prepareStatement(sql);
            
            ResultSet result = prep.executeQuery();
            
            //Enquanto existirem registros, executará este laço de repetição
            while(result.next()) {
                //Criar um objeto vazio da classe Jogador
                Jogador mapa = new Jogador();
                
                //Inserir os atributos a partir dos dados de cada coluna
                mapa.setIdJogador(result.getInt("cod_id"));
                mapa.setNome(result.getString("nome"));
                mapa.setApelido(result.getString("apelido"));
                mapa.setSenha(result.getString("senha"));
                
                //Inserir o objeto preenchido na lista
                list.add(mapa);
            }
            
            return list;
        }//Fim do método listJogador
        
        
        //DELETE
        public void deleteJogador(int id) throws SQLException {
            String sql = "DELETE FROM jogadores WHERE cod_id = " + id;
            
            PreparedStatement prep = conn.prepareStatement(sql);
            
            prep.execute();
            prep.close();
        }//Fim do método deleteJogador
        
        
        //SELECT BY ID
        public Jogador listOneJogador(int cod) throws SQLException {
             String query = "SELECT * FROM jogadores WHERE cod_id = " + cod;
             
             PreparedStatement prep = conn.prepareStatement(query);
             
             ResultSet result = prep.executeQuery();
             
             Jogador user = new Jogador();
             
             if(result.next()){
                user = new Jogador(
                        result.getInt("cod_id"),
                        result.getString("nome"),
                        result.getString("apelido"),
                        result.getString("senha")
                );
             }             
             return user;
        }
        
        //Listar jogador pelo nome
        public Jogador listJogadorByNick(String jog) throws SQLException {
             String query = "SELECT * FROM jogadores WHERE apelido = ?";
             
             PreparedStatement prep = conn.prepareStatement(query);
             prep.setString(1, jog);
             
             ResultSet result = prep.executeQuery();
             
             Jogador user = new Jogador();
             
             if(result.next()){
                user = new Jogador(
                        result.getInt("cod_id"),
                        result.getString("nome"),
                        result.getString("apelido"),
                        result.getString("senha")
                );
             }             
             return user;
        }
        
        
        //UPDATE
        public void updateJogador(Jogador mapa) throws SQLException {
            //Query genérica
            String query = "UPDATE jogadores SET nome = ?, "
                    + "apelido = ?, senha = ? "
                    + "WHERE cod_id = ?";
            
            //Preparando a query para executar no BD
            PreparedStatement prep = conn.prepareStatement(query);
            
            //Trocar as interrogações por valores do objeto enviado
            prep.setString(1, mapa.getNome());
            prep.setString(2, mapa.getApelido());
            prep.setString(3, mapa.getSenha());
            prep.setInt(4, mapa.getIdJogador());
            
            //Executar query pronta
            prep.execute();
            prep.close();
        }
        
}//Fim da classe
