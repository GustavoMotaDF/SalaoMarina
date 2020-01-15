/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.entidades;

import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author gustavo
 */

@Entity
@Table(name="tb_menu")
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_menu")
    private Integer idmenu;
    @Column(name="nome")
    private String nome;
    @Column(name="link")
    private String link;
    @Column(name="nivel_acesso")
    private Integer nivelacesso;

    public Integer getIdmenu() {
        return idmenu;
    }

    public void setIdmenu(Integer idmenu) {
        this.idmenu = idmenu;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Integer getNivelacesso() {
        return nivelacesso;
    }

    public void setNivelacesso(Integer nivelacesso) {
        this.nivelacesso = nivelacesso;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + Objects.hashCode(this.idmenu);
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
        final Menu other = (Menu) obj;
        if (!Objects.equals(this.idmenu, other.idmenu)) {
            return false;
        }
        return true;
    }

    public Menu(Integer idmenu, String nome, String link, Integer nivelacesso) {
        this.idmenu = idmenu;
        this.nome = nome;
        this.link = link;
        this.nivelacesso = nivelacesso;
    }

    public Menu() {
    }
    
    
    
}
