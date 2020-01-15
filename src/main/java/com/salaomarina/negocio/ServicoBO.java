/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Agendamento;
import com.salaomarina.entidades.Cliente;
import com.salaomarina.entidades.Servico;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Lenovo
 */
public class ServicoBO {
     private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Servico> getServicos() {
        try{
            List<Servico>servico;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            servico = en.createQuery("from Servico where ativo = true").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            return servico;
        }catch(Exception e){
            System.err.println("Erro ao Listar Servico Erro "+ e.getMessage() );
            return null;
        }
        
    }

    public void IncluirServico(String servico, String valor) {
       try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Servico servicos = new Servico();
            servicos.setServico(servico);
            servicos.setValor(Double.valueOf(valor));
            servicos.setDatahoraultmov(LocalDateTime.now());
            servicos.setAtivo(true);
            
            en.persist(servicos);

            en.getTransaction().commit();
            en.clear();
            en.close();
       }catch(Exception e){
           System.err.println("Erro ao cadastrar Serviço: Erro "+ e.getMessage() );
       }
    }
    public Boolean ExcluirServico(String idservico){
        try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Servico servico= en.getReference(Servico.class, Integer.valueOf(idservico));
            en.remove(servico);
            
            en.getTransaction().commit();
            en.clear();
            en.close();
            return true;
        }catch(Exception e){
            System.err.println("Erro ao excluir Servico de id "+idservico +" :"+ e.getMessage() );
            return false;            
        }
    }
    public Servico getServico(String idservico){
        Servico servico;
       
       
            EntityManager en = emf.createEntityManager();
        
            en.getTransaction().begin();

            servico = en.find(Servico.class,Integer.valueOf(idservico));
            
            en.getTransaction().commit();
            
            en.close();
            return servico;
        
    }
    
    public void alterarServico(String idservico, String servico, String valor){
    
        EntityManager en = emf.createEntityManager();
        en.getTransaction().begin();
        
            Servico servicos = en.find(Servico.class, Integer.valueOf(idservico));
            servicos.setServico(servico);
            servicos.setValor(Double.valueOf(valor));
        
        en.merge(servicos);
        
        en.getTransaction().commit();
        en.clear();
        en.close();
    }
    
    
}
