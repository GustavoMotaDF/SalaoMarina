/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

import com.salaomarina.negocio.ClienteBO;
import com.salaomarina.negocio.ServicoBO;
import com.salaomarina.negocio.VendaBO;
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
 * @author gustavo
 */
@WebServlet(name = "Venda", urlPatterns = {"/venda"})
public class Venda extends HttpServlet {
private VendaBO vendaBO = new VendaBO();
    private ClienteBO clienteBO = new ClienteBO();
    private ServicoBO servicoBO= new ServicoBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
         HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
        try{
           
            vendaBO.IncluiVenda(    req.getParameter("idcliente"),
                                    req.getParameter("idservico"),
                                    req.getParameter("formatovenda"));
                                    
                                    
           req.setAttribute("mensagemSucesso",  "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Venda Feita com Sucesso! </strong> </div>"
                    + "<script>$().ready(function() {\n" +
                        "	setTimeout(function () {\n" +
                        "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n" +
                        "	}, 10000); // O valor é representado em milisegundos.\n" +
                        "});</script>");
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao realizr venda! </div>"+e.getMessage() 
            +"<script>\n" +
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
            
            req.setAttribute("vendaEditando",vendaBO.getVendas(req.getParameter("idvenda")));
        }
        else if(Objects.nonNull(req.getParameter("alterar"))){
            //Tratando alterar
            
            try{
            vendaBO.alterarVenda(req.getParameter("idvenda"),
                                    req.getParameter("idcliente"),
                                    req.getParameter("idservico"),
                                    req.getParameter("formatovenda"));
            req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Alterações na Venda feita com Sucesso!</div>"
                        + "<script>\n" +
    "                    $().ready(function () {\n" +
    "                        setTimeout(function () {\n" +
    "                            $('#foo').hide();\n" +
    "                        }, 10000);\n" +
    "                    });\n" +
    "                </script>\n" +
    "");
            }catch(Exception e){
             req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao fazer alteração na Venda!"+e.getMessage()+"</div>"
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
        req.setAttribute("vendas",vendaBO.getvendas());
        req.setAttribute("clientes", clienteBO.getClientes());        
        req.setAttribute("servico",servicoBO.getServicos()); 
        req.setAttribute("relatorio",vendaBO.getRelVendas());
         
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\" class=\"alert alert-danger\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage()+")</div>"
                    + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
        }
        req.getRequestDispatcher("jsp/Cadastros/Caixa.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else{
        
        try{
        req.setAttribute("vendas",vendaBO.getvendas());        
        req.setAttribute("clientes", clienteBO.getClientes());
        req.setAttribute("servico",servicoBO.getServicos());      
        req.setAttribute("relatorio",vendaBO.getRelVendas());
         
        
        
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage()+")</div>");
        }
        
        req.getRequestDispatcher("jsp/Cadastros/Caixa.jsp").forward(req, resp);
        
    }
    }
    
}
