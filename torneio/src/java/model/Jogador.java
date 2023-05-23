package model;

import java.sql.SQLException;

public class Jogador {
        private int idJogador;
        private String nome;
        private String apelido;
        private String senha;

    public Jogador(){}    
        
    public Jogador(String nome, String apelido, String senha) {
        this.nome = nome;
        this.apelido = apelido;
        this.senha = senha;
    }
    
    public Jogador(int id, String nome, String apelido, String senha) {
        this.idJogador = id;
        this.nome = nome;
        this.apelido = apelido;
        this.senha = senha;
    }

    public int getIdJogador() {
        return idJogador;
    }

    public void setIdJogador(int idJogador) {
        this.idJogador = idJogador;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    

    public boolean isLogged() throws ClassNotFoundException, SQLException {
        JogadorDAO jog = new JogadorDAO();
        Jogador jBanco = jog.listJogadorByNick(this.apelido);
        
        if(jBanco.getApelido() != null){
            //Aqui, significa que o apelido foi encontrado, e a senha então é testada
            return (jBanco.getSenha().equals(this.senha));
        } else {
            //Aqui, significa que o apelido não foi encontrado no BD
            return false;
        }
        
    }
        
}
