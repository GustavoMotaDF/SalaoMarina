/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.entidades;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.SQLDelete;

/**
 *
 * @author gustavo
 */
@Entity
@Table(name="SITE_tb_mensagens")
@SQLDelete(sql = "update SITE_tb_mensagens set lida = 1, datalida = DATE(now()) where id_mensagem = ?")
public class Mensagens implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_mensagem")
    private Integer idmensagem;
    @Column(name="cliente")        
    private String cliente;
    @Column(name="telefone")
    private String telefone;
    @Column(name="email")
    private String email;
    @Column(name="mensagem")
    private String mensagem;
    @Column(name="data")
    private LocalDate data;
     @Column(name="lida")
    private Boolean lida;
     @Column(name="datalida")
     private LocalDate datalida;

    public LocalDate getDatalida() {
        return datalida;
    }

    public void setDatalida(LocalDate datalida) {
        this.datalida = datalida;
    }
    
     
    public Integer getIdmensagem() {
        return idmensagem;
    }

    public void setIdmensagem(Integer idmensagem) {
        this.idmensagem = idmensagem;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public Boolean getLida() {
        return lida;
    }

    public void setLida(Boolean lida) {
        this.lida = lida;
    }
    

    public Mensagens(Integer idmensagem, String cliente, String telefone, String email, String mensagem, LocalDate data, Boolean lida, LocalDate datalida) {
        this.idmensagem = idmensagem;
        this.cliente = cliente;
        this.telefone = telefone;
        this.email = email;
        this.mensagem = mensagem;
        this.data = data;
        this.lida = lida;
        this.datalida = datalida;
    }

    public Mensagens() {
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + Objects.hashCode(this.idmensagem);
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
        final Mensagens other = (Mensagens) obj;
        if (!Objects.equals(this.idmensagem, other.idmensagem)) {
            return false;
        }
        return true;
    }
 
    
}
