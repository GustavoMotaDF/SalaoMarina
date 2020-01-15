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
@Table(name="tb_servico")
@SQLDelete(sql = "update tb_servico set ativo = 0 where id_servico = ?")
public class Servico implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_servico")
    private Integer idservico;
    @Column(name="servico")
    private String servico;
    @Column(name="valor")
    private Double valor;
    @Column(name="data_hora_ult_mov")
    private LocalDateTime datahoraultmov;
    private Boolean ativo;

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }
    

    public LocalDateTime getDatahoraultmov() {
        return datahoraultmov;
    }

    public void setDatahoraultmov(LocalDateTime datahoraultmov) {
        this.datahoraultmov = datahoraultmov;
    }
    
    
    
    
    @OneToMany(mappedBy = "servico")
    private List<Venda> venda ;

    public Servico(Integer idservico, String servico, Double valor, List<Venda> venda, Boolean ativo) {
        this.idservico = idservico;
        this.servico = servico;
        this.valor = valor;
        this.venda = venda;
        this.ativo = ativo;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 43 * hash + Objects.hashCode(this.idservico);
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
        final Servico other = (Servico) obj;
        if (!Objects.equals(this.idservico, other.idservico)) {
            return false;
        }
        return true;
    }

    public Integer getIdservico() {
        return idservico;
    }

    public void setIdservico(Integer idservico) {
        this.idservico = idservico;
    }

    public String getServico() {
        return servico;
    }

    public void setServico(String servico) {
        this.servico = servico;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public List<Venda> getVenda() {
        return venda;
    }

    public void setVenda(List<Venda> venda) {
        this.venda = venda;
    }

    public Servico() {
    }
    
    
}
