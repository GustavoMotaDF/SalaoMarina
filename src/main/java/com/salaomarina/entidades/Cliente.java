/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.entidades;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.SQLDelete;

/**
 *
 * @author Lenovo
 */

@Entity
@SQLDelete(sql = "update tb_cliente set ativo = 0 where id_cliente = ?")
@Table(name="tb_cliente")
public class Cliente implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_cliente")
    private Integer idcliente;
    @Column(name="nome_cliente")
    private String nomecliente;
    @Column(name="instagram")
    private String instagram;
    @Column(name="endereco")
    private String endereco;
    @Column(name="telefone")
    private String telefone;  
    @Column(name="postarfotos")
    private String postarfotos;
    private Boolean ativo;
    
        
   @OneToMany(mappedBy = "cliente")
    private List<Venda> venda ;
   
   @OneToMany(mappedBy = "cliente")
    private List<Agendamento> agendamento ;

    public String getInstagram() {
        return instagram;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    
    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getPostarfotos() {
        return postarfotos;
    }

    public void setPostarfotos(String postarfotos) {
        this.postarfotos = postarfotos;
    }
   

    public Integer getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public String getNomecliente() {
        return nomecliente;
    }

    public void setNomecliente(String nomecliente) {
        this.nomecliente = nomecliente;
    }

   
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

   
    public List<Venda> getVenda() {
        return venda;
    }

    public void setVenda(List<Venda> venda) {
        this.venda = venda;
    }

    public List<Agendamento> getAgendamento() {
        return agendamento;
    }

    public void setAgendamento(List<Agendamento> agendamento) {
        this.agendamento = agendamento;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 17 * hash + Objects.hashCode(this.idcliente);
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
        final Cliente other = (Cliente) obj;
        if (!Objects.equals(this.idcliente, other.idcliente)) {
            return false;
        }
        return true;
    }

    public Cliente(Integer idcliente, String nomecliente, String instagram, String endereco, String telefone, String postarfotos, List<Venda> venda, List<Agendamento> agendamento, Boolean ativo) {
        this.idcliente = idcliente;
        this.nomecliente = nomecliente;
        this.instagram = instagram;
        this.endereco = endereco;
        this.telefone = telefone;
        this.postarfotos = postarfotos;
        this.venda = venda;
        this.agendamento = agendamento;
        this.ativo=ativo;
    }

     

    public Cliente() {
    }

   
    
    
    
}
