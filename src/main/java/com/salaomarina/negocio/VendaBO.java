/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Cliente;
import com.salaomarina.entidades.Servico;
import com.salaomarina.entidades.Venda;
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
public class VendaBO {
     private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Venda> getvendas() {
        try{
            List<Venda>vendas;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            LocalDate datavenda = LocalDate.now();
            vendas = en.createQuery("from Venda where datavenda=:datavenda").setParameter("datavenda",datavenda).getResultList();
            en.getTransaction().commit();
            
            en.clear();
            en.close();
            
            return vendas;
        }catch(Exception e){
            System.err.println("Erro ao Listar Vendas Erro "+ e.getMessage() );
            return null;
        }
        
    }

    public void IncluiVenda(String idcliente, String idservico, String formatovenda) {
       try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Venda vendas = new Venda();
            vendas.setDatavenda(LocalDate.now());
            
            Cliente cliente = en.find(Cliente.class, Integer.valueOf(idcliente));
            vendas.setCliente(cliente);
            
            Servico servico = en.find(Servico.class, Integer.valueOf(idservico));
            vendas.setServico(servico);
            
            vendas.setFormatovenda(formatovenda);
            en.persist(vendas);

            en.getTransaction().commit();
            en.clear();
            en.close();
       }catch(Exception e){
           System.err.println("Erro ao Fazer Venda, Erro "+ e.getMessage() );
       }
    }
    
    public Venda getVendas(String idvenda){
        Venda vendas;
            EntityManager en = emf.createEntityManager();
        
            en.getTransaction().begin();

            vendas = en.find(Venda.class,Integer.valueOf(idvenda));
            
            en.getTransaction().commit();
            
            en.close();
            return vendas;
        
    }
    
    public void alterarVenda(String idvenda, String idcliente, String idservico, String formatovenda ){
    
        EntityManager en = emf.createEntityManager();
        en.getTransaction().begin();
            Venda vendas = en.find(Venda.class, Integer.valueOf(idvenda));
            vendas.setDatavenda(LocalDate.now());
            Cliente cliente = en.find(Cliente.class, Integer.valueOf(idcliente));
            vendas.setCliente(cliente);
            Servico servicos = en.find(Servico.class, Integer.valueOf(idservico));
            vendas.setServico(servicos);
            
            vendas.setFormatovenda(formatovenda);
            
        
        en.merge(vendas);
        
        en.getTransaction().commit();
        en.clear();
        en.close();
    }
    
    public List<Venda> getRelVendas() throws Exception{
       
            List<Venda>vendas;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            vendas = en.createNativeQuery("SELECT ven.data_venda, SUM(ser.valor)FROM tb_venda ven join tb_servico ser on ser.id_servico=ven.id_servico group by ven.data_venda order by ven.data_venda").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            if(vendas == null || vendas.isEmpty()){
                throw new Exception("Sem resultado para a pesquisa");                
            }
            
            return vendas;
       
        
    }
     public List<Venda> getvendasData(String datavenda) throws Exception{
        
            List<Venda>vendasdia = null;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            vendasdia = en.createNativeQuery("select c.nome_cliente, s.servico, s.valor, v.data_venda from tb_venda v join tb_servico s on s.id_servico=v.id_servico join tb_cliente c on c.id_cliente=v.id_cliente where v.data_venda=DATE(:datavenda)").setParameter("datavenda",datavenda).getResultList();
            en.getTransaction().commit();
            
            en.clear();
            en.close();
            
            if(vendasdia == null || vendasdia.isEmpty() ){
                throw new Exception("Sem resultado para a data em questão, consulte o administrador do sistema");
                
            }
            
            return vendasdia;
         
        
    }
    
    
}
