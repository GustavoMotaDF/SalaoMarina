/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Cliente;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Lenovo
 */
public class ClienteBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Cliente> getClientes() {
        try{
            List<Cliente>clientes;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            clientes = en.createQuery("from Cliente where ativo = true order by nomecliente").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            return clientes;
        }catch(Exception e){
            System.err.println("Erro ao Listar Clientes: Erro "+ e.getMessage() );
            return null;
        }
        
    }

    public void IncluirCliente(String instagram, String endereco, String nomecliente, String telefone, String postarfotos) {
       try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Cliente clientes = new Cliente();
            clientes.setInstagram(instagram);           
            clientes.setEndereco(endereco);
            clientes.setNomecliente(nomecliente);           
            clientes.setTelefone(telefone);
            clientes.setPostarfotos(postarfotos);
            clientes.setAtivo(true);
            en.persist(clientes);

            en.getTransaction().commit();
            en.clear();
            en.close();
       }catch(Exception e){
           System.err.println("Erro ao cadastrar cliente: Erro "+ e.getMessage() );
       }
    }
    public Boolean ExcluirCliente(String idcliente) throws Exception{
        
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Cliente cliente = en.getReference(Cliente.class, Integer.valueOf(idcliente));
            en.remove(cliente);
            
            en.getTransaction().commit();
            en.clear();
            en.close();
            
            
            
            if(false){
                throw new Exception("Erro ao excluir o cliente "+ idcliente );
            }
            return true;
       
    }
    public Cliente getCliente(String idcliente){
        Cliente cliente;
        
            EntityManager en = emf.createEntityManager();
        
            en.getTransaction().begin();

            cliente = en.find(Cliente.class,Integer.valueOf(idcliente));
            
            en.getTransaction().commit();
            
            en.close();
            return cliente;
        
    }
    
    public void alterarCliente(String idcliente,String instagram, String endereco, String nomecliente, String telefone, String postarfotos ){
    
        EntityManager en = emf.createEntityManager();
        en.getTransaction().begin();
        
            Cliente clientes = en.find(Cliente.class, Integer.valueOf(idcliente));
             
            clientes.setInstagram(instagram);           
            clientes.setEndereco(endereco);
            clientes.setNomecliente(nomecliente);           
            clientes.setTelefone(telefone);
            clientes.setPostarfotos(postarfotos);
            en.persist(clientes);
        
        en.merge(clientes);
        
        en.getTransaction().commit();
        en.clear();
        en.close();
    }
    
    public List<Cliente> getHistorico(String nomeCliente) throws Exception{
       
            List<Cliente>Historicocliente = null;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            Historicocliente = en.createNativeQuery("SELECT cl.id_cliente, cl.nome_cliente, cl.telefone , cl.postarfotos, cl.instagram , vd.data_venda, ser.servico, ser.valor, vd.formato_da_venda FROM tb_cliente cl join tb_venda vd on cl.id_cliente = vd.id_cliente join tb_servico ser on ser.id_servico = vd.id_servico where cl.nome_cliente =:nomeCliente order by vd.data_venda;").setParameter("nomeCliente", nomeCliente).getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            if(Historicocliente == null || Historicocliente.isEmpty()){
                throw new Exception("Sem venda registrada para o cliente "+ nomeCliente);                
            }            
            return Historicocliente; 
    }
     
}
