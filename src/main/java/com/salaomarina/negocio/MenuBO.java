/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Menu;
import com.salaomarina.entidades.Servico;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gustavo
 */
public class MenuBO {
    
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Menu> getServicos() throws Exception {
       
            List<Menu>menu;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            menu = en.createQuery("from Menu").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            
            
            if(menu==null || menu.isEmpty()){
                throw new Exception("Sem resultado");
            }
           return menu;
        
    }
    public List<Menu> getMenus(String nome){
        
            List<Menu>Menu;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            if(nome == null || nome.isEmpty()){
               Menu = en.createQuery("select menu.link, menu.nome, func.nome from Menu menu join Funcionario func on func.acesso >= menu.nivelacesso where func.nome =:nome").setParameter("nome", "Default").getResultList();

            }else{
               Menu = en.createQuery("select menu.link, menu.nome, func.nome from Menu menu join Funcionario func on func.acesso >= menu.nivelacesso where func.nome =:nome").setParameter("nome", nome).getResultList();
            }
            en.getTransaction().commit();
            en.clear();
            en.close();
             
            
            
           return Menu;
        
    }
}
