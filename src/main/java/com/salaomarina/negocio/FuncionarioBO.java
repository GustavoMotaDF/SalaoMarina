/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.negocio;

import com.salaomarina.entidades.Funcionario;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gustavo
 */
public class FuncionarioBO {
    private static final EntityManagerFactory emf
            = Persistence.createEntityManagerFactory("clientePU");

    public List<Funcionario> getFuncionarios() {
        try{
            List<Funcionario>funcionarios;

            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();

            funcionarios = en.createQuery("from Funcionario where ativo = 1").getResultList();
            en.getTransaction().commit();

            en.clear();
            en.close();
            
            return funcionarios;
        }catch(Exception e){
            System.err.println("Erro ao Listar Funcionarios: Erro "+ e.getMessage() );
            return null;
        }
        
    }

    public void IncluirFuncionario(String nome,String senha, String acesso) {
       try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Funcionario funcionarios = new Funcionario();
            funcionarios.setNome(nome);
            funcionarios.setSenha(senha);
            funcionarios.setAcesso(Integer.valueOf(acesso));
            funcionarios.setAtivo(true);
             
            en.persist(funcionarios);

            en.getTransaction().commit();
            en.clear();
            en.close();
       }catch(Exception e){
           System.err.println("Erro ao cadastrar cliente: Erro "+ e.getMessage() );
       }
    }
    public Boolean ExcluirFuncionario(String idfuncionario){
        try{
            EntityManager en = emf.createEntityManager();
            en.getTransaction().begin();
            
            Funcionario cliente = en.getReference(Funcionario.class, Integer.valueOf(idfuncionario));
            en.remove(cliente);
            
            en.getTransaction().commit();
            en.clear();
            en.close();
            return true;
        }catch(Exception e){
            System.err.println("Erro ao excluir cliente de id "+idfuncionario +" :"+ e.getMessage() );
            return false;            
        }
    }
    public Funcionario getFuncionario(String idfuncionario){
        Funcionario cliente;
       
       
            EntityManager en = emf.createEntityManager();
        
            en.getTransaction().begin();

            cliente = en.find(Funcionario.class,Integer.valueOf(idfuncionario));
            
            en.getTransaction().commit();
            
            en.close();
            return cliente;
        
    }
    
    public void alterarFuncionario(String idfuncionario,String nome,String senha, String acesso ){
    
        EntityManager en = emf.createEntityManager();
        en.getTransaction().begin();
        
            Funcionario funcionarios = en.find(Funcionario.class, Integer.valueOf(idfuncionario));
            funcionarios.setNome(nome);
            funcionarios.setSenha(senha);
            funcionarios.setAcesso(Integer.valueOf(acesso));
            
        
        en.merge(funcionarios);
        
        en.getTransaction().commit();
        en.clear();
        en.close();
    }
    public List<Funcionario> getLogin(String nome, String senha) throws Exception {
        List<Funcionario> Login;
        EntityManager em = emf.createEntityManager(); 
        em.getTransaction().begin();
         
        Login = em.createQuery("SELECT fun.nome, fun.acesso FROM Funcionario fun where fun.nome=:nome and fun.senha=:senha")
                                .setParameter("nome", nome)
                                .setParameter("senha", senha)
                                .getResultList();

        em.getTransaction().commit();
        em.clear();
        em.close();
        
        if(Login == null || Login.isEmpty()){
          throw new Exception("Sem resultado");
                    
         }
        
        
        
        
        return Login;
        
        

    }
  
}

