/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Agendamento;
import com.salaomarina.entidades.Cliente;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Lenovo
 */
public class AgendamentoBO {
      private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Agendamento> getAgendamentos() {
        try{
            List<Agendamento>agendamento;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            agendamento = en.createQuery("from Agendamento where concluido = 0").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            return agendamento;
        }catch(Exception e){
            System.err.println("Erro ao Listar Agendamentos: Erro "+ e.getMessage() );
            return null;
        }
        
    }
    public List<Agendamento> getAgendamentosC() {
        try{
            List<Agendamento>agendamento;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            agendamento = en.createQuery("from Agendamento where concluido = 1 order by dataagendamento").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            return agendamento;
        }catch(Exception e){
            System.err.println("Erro ao Listar Agendamentos: Erro "+ e.getMessage() );
            return null;
        }
        
    }

    public void IncluirAgendamento(String idcliente, String dataagendamento,  String descricaoagendamento, String horaagendamento ) {
      
        try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Agendamento agendamento = new Agendamento();
            Cliente clientes = en.find(Cliente.class, Integer.valueOf(idcliente));             
            agendamento.setCliente(clientes);
            agendamento.setDataagendamento(LocalDate.parse(dataagendamento));
            agendamento.setDatahoraultmov(LocalDateTime.now());
            
            agendamento.setDescricaoagendamento(descricaoagendamento); 
            agendamento.setHoraagendamento(horaagendamento);
            agendamento.setConcluido(false);
            
            
            
             
            en.persist(agendamento);

            en.getTransaction().commit();
            en.clear();
            en.close();
       }catch(Exception e){
           System.err.println("Erro ao cadastrar Agendamento: Erro "+ e.getMessage() );
       }
    }
    public Boolean ExcluirAgendamento(String idagendamento){
        try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Agendamento agendamento = en.getReference(Agendamento.class, Integer.valueOf(idagendamento));
            en.remove(agendamento);
            
            en.getTransaction().commit();
            en.clear();
            en.close();
            return true;
        }catch(Exception e){
            System.err.println("Erro ao excluir Agendamento de id "+idagendamento +" :"+ e.getMessage() );
            return false;            
        }
    }
    public Agendamento getAgendamento(String idagendamento){
        Agendamento agendamentos;
       
       
            EntityManager en = emf.createEntityManager();
        
            en.getTransaction().begin();

            agendamentos = en.find(Agendamento.class,Integer.valueOf(idagendamento));
            
            en.getTransaction().commit();
            
            en.close();
            return agendamentos;
        
    }
    
    public void alterarAgendamento(String idagendamento, String idcliente,  String dataagendamento, String descricaoagendamento, String horaagendamento ){
    
        EntityManager en = emf.createEntityManager();
        en.getTransaction().begin();
        Agendamento agendamento = en.find(Agendamento.class, Integer.valueOf(idagendamento)); 
        try{
            Cliente clientes = en.find(Cliente.class, Integer.valueOf(idcliente));             
            agendamento.setCliente(clientes);   
        }catch(Exception e){
            System.err.println("idcliente está nullo");
        }
        
        try{
            agendamento.setDataagendamento(LocalDate.parse(dataagendamento));
        }catch(Exception e){
            System.err.println("dataagendamento está nullo");
        }
        try{
            agendamento.setDescricaoagendamento(descricaoagendamento);   
        }catch(Exception e){
            System.err.println("descricaoagendamento está nullo");
        }
        
        try{
           agendamento.setHoraagendamento(horaagendamento);  
        }catch(Exception e){
            System.err.println("horaagendamento está nullo");
        }
        try{
           agendamento.setDatahoraultmov(LocalDateTime.now());  
        }catch(Exception e){
            System.err.println("LocalDateTime está nullo");
        }
            
            
        
        en.merge(agendamento);
        
        en.getTransaction().commit();
        en.clear();
        en.close();
    }
    
    public List<Agendamento> getAgendamentosTotal() throws Exception {
        try{
            List<Agendamento>agendamento;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            LocalDate data = LocalDate.now();
            agendamento = en.createNativeQuery("SELECT count(*) FROM tb_agendamento where data_agendamento=:data and concluido = 0").setParameter("data", data).getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            if(agendamento == null ||  agendamento.isEmpty()){
                throw new Exception("erro");
            }
            
            return agendamento;
        }catch(Exception e){
            System.err.println("Erro ao Listar Agendamentos: Erro "+ e.getMessage() );
            return null;
        }
        
    }
    public List<Agendamento> getAgendamentosPendente() throws Exception {
        try{
            List<Agendamento>agendamento;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            LocalDate data = LocalDate.now();
            agendamento = en.createNativeQuery("SELECT count(*) FROM tb_agendamento where data_agendamento < :data and concluido = 0;").setParameter("data", data).getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            if(agendamento == null ||  agendamento.isEmpty()){
                throw new Exception("erro");
            }
            
            return agendamento;
        }catch(Exception e){
            System.err.println("Erro ao Listar Agendamentos: Erro "+ e.getMessage() );
            return null;
        }
        
    }
    
  
}
