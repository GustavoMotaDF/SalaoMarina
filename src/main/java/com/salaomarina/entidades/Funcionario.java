/*disabled id="1"
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.entidades;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.SQLDelete;

/**
 *
 * @author gustavo
 */ 
@Entity
@SQLDelete(sql = "update tb_funcionario set ativo = 0 where id_funcionario = ?")
@Table(name="tb_funcionario")

public class Funcionario implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_funcionario")
    private Integer idfuncionario;
    @Column(name="nome")
    private String nome;
    @Column(name="senha")
    private String senha;
    @Column(name="acesso")
    private Integer acesso;
    @Column(name="ativo")
    private Boolean ativo;
    
    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }     
    public Integer getIdfuncionario() {
        return idfuncionario;
    }

    public void setIdfuncionario(Integer idfuncionario) {
        this.idfuncionario = idfuncionario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Integer getAcesso() {
        return acesso;
    }

    public void setAcesso(Integer acesso) {
        this.acesso = acesso;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + Objects.hashCode(this.idfuncionario);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Funcionario other = (Funcionario) obj;
        if (!Objects.equals(this.idfuncionario, other.idfuncionario)) {
            return false;
        }
        return true;
    }

    

    public Funcionario(Integer idfuncionario, String nome, String senha, Integer acesso, Boolean ativo) {
        this.idfuncionario = idfuncionario;
        this.nome = nome;
        this.senha = senha;
        this.acesso = acesso;
        this.ativo = ativo;
       
    }

       
    public Funcionario() {
    }
    
    
}
