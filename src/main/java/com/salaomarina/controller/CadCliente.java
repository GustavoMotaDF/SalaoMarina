/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

import com.salaomarina.negocio.ClienteBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "CadCliente", urlPatterns = {"/cadcliente"})
public class CadCliente extends HttpServlet {
    private ClienteBO clienteBO= new ClienteBO();   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }

        
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
        try{
           
            clienteBO.IncluirCliente(req.getParameter("instagram"),                                    
                                    req.getParameter("endereco"),
                                    req.getParameter("nomecliente"),        
                                    req.getParameter("telefone"),
                                    req.getParameter("postarfotos"));
                                    
                                    
            req.setAttribute("mensagemSucesso",  "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Cliente cadastrado com Sucesso! </strong> </div>"
                    + "<script>$().ready(function() {\n" +
                        "	setTimeout(function () {\n" +
                        "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n" +
                        "	}, 10000); // O valor é representado em milisegundos.\n" +
                        "});</script>");
       }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao Cadastrar Cliente </div>"+e.getMessage() 
            +"<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
        }
        }else if(Objects.nonNull(req.getParameter("excluir"))){
            //Tratando exclusão
          
                    try{
                clienteBO.ExcluirCliente(req.getParameter("idcliente"));
                req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Cliente Excluido com Sucesso</div>"
                        + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
                
                }catch(Exception e){
                req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">"+e.getMessage()+"</div><script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
                
            }
            
        }
        else if(Objects.nonNull(req.getParameter("editar"))){
            //Tratando editar
            req.setAttribute("clienteEditando",clienteBO.getCliente(req.getParameter("idcliente")));
        }
        else if(Objects.nonNull(req.getParameter("alterar"))){
            //Tratando alterar
            
            try{
            clienteBO.alterarCliente(req.getParameter("idcliente"),
                                    req.getParameter("instagram"),                                    
                                    req.getParameter("endereco"),
                                    req.getParameter("nomecliente"),        
                                    req.getParameter("telefone"),
                                    req.getParameter("postarfotos"));
                req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Alterações em Cliente feita com Sucesso</div>"
                        + "<script>\n" +
    "                    $().ready(function () {\n" +
    "                        setTimeout(function () {\n" +
    "                            $('#foo').hide();\n" +
    "                        }, 10000);\n" +
    "                    });\n" +
    "                </script>\n" +
    "");
           }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao fazer alteração em Cliente</div>"
                    + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
            }
        }
        
        try{
        req.setAttribute("clientes",clienteBO.getClientes());        
       
        
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage()+")</div>"
                    + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
        }
        if(Objects.nonNull(req.getParameter("historico"))){
            //Tratando editar
            req.setAttribute("Historicovendas",clienteBO.getCliente(req.getParameter("nomeCliente")));
        }
        req.getRequestDispatcher("jsp/Cadastros/CadCliente.jsp").forward(req, resp);
       
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else{
        
        try{
       req.setAttribute("clientes",clienteBO.getClientes());      
        
        
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage()+")</div>");
        }
        
        req.getRequestDispatcher("jsp/Cadastros/CadCliente.jsp").forward(req, resp);
        
    }
    }
    
}