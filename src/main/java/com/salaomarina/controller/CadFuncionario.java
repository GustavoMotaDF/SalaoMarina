/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

import com.salaomarina.negocio.FuncionarioBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import java.util.concurrent.ExecutionException;
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
@WebServlet(name = "CadFuncionario", urlPatterns = {"/CadFuncionario"})
public class CadFuncionario extends HttpServlet {
    private FuncionarioBO funcionarioBO = new FuncionarioBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
            
        if (Objects.nonNull(req.getParameter("cadastrar"))) {
        try{
           
            funcionarioBO.IncluirFuncionario(req.getParameter("nome"),
                                    req.getParameter("senha"),
                                    req.getParameter("acesso"));                                                                       
                                    
                                    
                                    
            req.setAttribute("mensagemSucesso",  "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Funcionario cadastrado com Sucesso! </strong> </div>"
                    + "<script>$().ready(function() {\n" +
                        "	setTimeout(function () {\n" +
                        "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n" +
                        "	}, 10000); // O valor é representado em milisegundos.\n" +
                        "});</script>");
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao Cadastrar Funcionario </div>"+e.getMessage() 
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
                funcionarioBO.ExcluirFuncionario(req.getParameter("idfuncionario"));
                req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Funcionario Excluido com Sucesso</div>"
                        + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
                
            }catch(Exception e){
                req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao Excluir Funcionario </div>  "+e.getMessage()
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
            req.setAttribute("funcionarioEditando",funcionarioBO.getFuncionario(req.getParameter("idfuncionario")));
        }
        else if(Objects.nonNull(req.getParameter("alterar"))){
            //Tratando alterar
            
            try{
                            funcionarioBO.alterarFuncionario(req.getParameter("idfuncionario"),
                                                            req.getParameter("nome"),
                                                            req.getParameter("senha"),
                                                            req.getParameter("acesso")); 
            req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Alterações em Funcionario feita com Sucesso</div>"
                    + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
            }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao fazer alteração em Funcionario</div>"
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
        req.setAttribute("funcionarios",funcionarioBO.getFuncionarios());        
       
        
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
        req.getRequestDispatcher("jsp/Cadastros/CadFuncionario.jsp").forward(req, resp);
       
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else{
        
        try{
       req.setAttribute("funcionarios",funcionarioBO.getFuncionarios());    
        
        
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage()+")</div>");
        }
        
        req.getRequestDispatcher("jsp/Cadastros/CadFuncionario.jsp").forward(req, resp);
        
    }
    }

}
