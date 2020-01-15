/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.entidades;

import java.io.Serializable;
import java.time.LocalDate;

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

/**
 *
 * @author Lenovo
 */
@Entity
@Table(name="tb_venda")
public class Venda implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name="id_venda")
    private Integer idvenda;
    
    @Column(name="data_venda")
    private LocalDate datavenda;  
    
    @Column(name="formato_da_venda")
    private String formatovenda;      
   
    @ManyToOne
    @JoinColumn(name="id_cliente")
    private Cliente cliente;
    
    @ManyToOne
    @JoinColumn(name="id_servico")
    private Servico servico;
    
   
    
    public Integer getIdvenda() {
        return idvenda;
    }

    public void setIdvenda(Integer idvenda) {
        this.idvenda = idvenda;
    }

    public LocalDate getDatavenda() {
        return datavenda;
    }

    public void setDatavenda(LocalDate datavenda) {
        this.datavenda = datavenda;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

    public String getFormatovenda() {
        return formatovenda;
    }

    public void setFormatovenda(String formatovenda) {
        this.formatovenda = formatovenda;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + Objects.hashCode(this.idvenda);
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
        final Venda other = (Venda) obj;
        if (!Objects.equals(this.idvenda, other.idvenda)) {
            return false;
        }
        return true;
    }

    public Venda(Integer idvenda, LocalDate datavenda, String formatovenda, Cliente cliente, Servico servico) {
        this.idvenda = idvenda;
        this.datavenda = datavenda;
        this.formatovenda = formatovenda; 
        this.cliente = cliente;
        this.servico = servico;
        
    }

    
    public Venda() {
    }
    
    
    
}