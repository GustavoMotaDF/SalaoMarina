/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Cliente;
import com.salaomarina.entidades.Mensagens;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author gustavo
 */
public class MensagensBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Mensagens> getMensagensNaoLidas() throws Exception{
        
            List<Mensagens>mensagens = null ;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            mensagens = en.createNativeQuery("select cliente, telefone, email, mensagem, data, id_mensagem from SITE_tb_mensagens where lida = 0 order by data").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            if(mensagens == null || mensagens.isEmpty() || mensagens.size()<=0){
                throw new Exception("Sem mensagens não lidas hoje, Ótimo trabalho :) ");
            }
            
            return mensagens;
        
    }
    public List<Mensagens> getMensagensLidas() throws Exception{
       
            List<Mensagens>mensagens = null ;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            mensagens = en.createNativeQuery("select cliente, telefone, email, mensagem, data, datalida from SITE_tb_mensagens where lida = 1").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            if(mensagens == null || mensagens.isEmpty() || mensagens.size()<=0){
                throw new Exception("Sem mensagens Lidas");
            }
            
            return mensagens;
        
    }
    public List<Mensagens> getMensagensNumNLidas() throws Exception{
        
            List<Mensagens>mensagens = null ;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            mensagens = en.createNativeQuery("select count(*) from SITE_tb_mensagens where lida = 0").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            if(mensagens == null || mensagens.isEmpty()){
                throw new Exception("0");
            }
            
            return mensagens;
         
         
    }
        public void SalvarMensagem(String nome, String telefone, String email, String mensagem) throws Exception{
       try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Mensagens mensagens = new Mensagens();
            mensagens.setCliente(nome);
            mensagens.setTelefone(telefone);
            mensagens.setEmail(email);
            mensagens.setMensagem(mensagem);
            mensagens.setData(LocalDate.now());
            mensagens.setLida(false);
            en.persist(mensagens);

            en.getTransaction().commit();
            en.clear();
            en.close();
            
       }catch(Exception e){
           System.err.println("Erro ao enviar msg Erro "+ e.getMessage() );
       }
    }
         public Boolean LerMensagem(String idmensagem) throws Exception{
        
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Mensagens mensagens = en.getReference(Mensagens.class, Integer.valueOf(idmensagem));
             
            en.remove(mensagens);
            
            en.getTransaction().commit();
            en.clear();
            en.close();
            
            Boolean conf = true;
            
            if(false){
                throw new Exception("Erro, marque como lida novamente!");
                  
            }
            return conf;
    }
    
    
}
