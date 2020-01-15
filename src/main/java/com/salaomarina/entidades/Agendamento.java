/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.entidades;

import java.io.Serializable;
import java.time.LocalDate;
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
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.annotations.SQLDelete;

/**
 *
 * @author Lenovo
 */
@Entity
@SQLDelete(sql = "update tb_agendamento set concluido = 1 where idagendamento = ?")

@Table(name="tb_agendamento")
public class Agendamento implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name="idagendamento")
    private Integer idagendamento;
    
    @Column(name="data_agendamento")
    private LocalDate dataagendamento;
    
    @Column(name="descricao_agendamento")
    private String descricaoagendamento;
        
    @Column(name="data_hora_ult_mov")
    private LocalDateTime datahoraultmov;
    
    @Column(name="hora_agendamento")
    private String horaagendamento;
    
    @Column(name="concluido")
    private Boolean concluido;

    public LocalDateTime getDatahoraultmov() {
        return datahoraultmov;
    }

    public String getHoraagendamento() {
        return horaagendamento;
    }

    public void setHoraagendamento(String horaagendamento) {
        this.horaagendamento = horaagendamento;
    }

    public void setDatahoraultmov(LocalDateTime datahoraultmov) {
        this.datahoraultmov = datahoraultmov;
    }
    
    
    @ManyToOne
    @JoinColumn(name="id_cliente")
    private Cliente  cliente;
    
   

    public Agendamento() {
    }
    
    public Integer getIdagendamento() {
        return idagendamento;
    }

    public void setIdagendamento(Integer idagendamento) {
        this.idagendamento = idagendamento;
    }

    public LocalDate getDataagendamento() {
        return dataagendamento;
    }

    public void setDataagendamento(LocalDate dataagendamento) {
        this.dataagendamento = dataagendamento;
    }

    public String getDescricaoagendamento() {
        return descricaoagendamento;
    }

    public void setDescricaoagendamento(String descricaoagendamento) {
        this.descricaoagendamento = descricaoagendamento;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Boolean getConcluido() {
        return concluido;
    }

    public void setConcluido(Boolean concluido) {
        this.concluido = concluido;
    }

    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.idagendamento);
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
        final Agendamento other = (Agendamento) obj;
        if (!Objects.equals(this.idagendamento, other.idagendamento)) {
            return false;
        }
        return true;
    }

    public Agendamento(Integer idagendamento, LocalDate dataagendamento, String descricaoagendamento, LocalDateTime datahoraultmov, String horaagendamento, Boolean concluido, Cliente cliente) {
        this.idagendamento = idagendamento;
        this.dataagendamento = dataagendamento;
        this.descricaoagendamento = descricaoagendamento;
        this.datahoraultmov = datahoraultmov;
        this.horaagendamento = horaagendamento;
        this.concluido = concluido;
        this.cliente = cliente;
    }

    
}
