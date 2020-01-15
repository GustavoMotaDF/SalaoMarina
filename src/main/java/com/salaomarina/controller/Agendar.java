/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

import com.salaomarina.negocio.AgendamentoBO;
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
 * @author gustavo
 */
@WebServlet(name = "Agendar", urlPatterns = {"/agendar"})
public class Agendar extends HttpServlet {
    private AgendamentoBO agendamentoBO = new AgendamentoBO();
    private ClienteBO clienteBO = new ClienteBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        if(Objects.nonNull(req.getParameter("cadastrar"))) {
        try{
           
            agendamentoBO.IncluirAgendamento(   req.getParameter("idcliente"),
                                                req.getParameter("dataagendamento"),          
                                                req.getParameter("descricaoagendamento"),
                                                req.getParameter("horaagendamento")
                                                );
                                    
                                    
            req.setAttribute("mensagemSucesso",  "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Agendado com Sucesso! </strong> </div>"
                    + "<script>$().ready(function() {\n" +
                        "	setTimeout(function () {\n" +
                        "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n" +
                        "	}, 10000); // O valor é representado em milisegundos.\n" +
                        "});</script>");
        }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao Agendar </div>"+e.getMessage() 
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
                agendamentoBO.ExcluirAgendamento(req.getParameter("idagendamento"));
                    
                req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Agendamento Finalizado Sucesso</div>"
                        + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
                
                
           }catch(Exception e){
                req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao concluir agendamento</div>  "+e.getMessage()
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
            req.setAttribute("agendamentoEditando",agendamentoBO.getAgendamento(req.getParameter("idagendamento")));
        }else if(Objects.nonNull(req.getParameter("alterar"))){
            //Tratando alterar
            
            try{
            agendamentoBO.alterarAgendamento(req.getParameter("idagendamento"),                                                
                                                req.getParameter("idcliente"),
                                                req.getParameter("dataagendamento"),          
                                                req.getParameter("descricaoagendamento"),
                                                req.getParameter("horaagendamento")
                                                );
            req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Alterações no Agendamento feita com Sucesso</div>"
                    + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
            }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro ao fazer alteração no Agendamento "+e.getCause().getCause().getMessage()+"</div>"
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
            req.setAttribute("clientes", clienteBO.getClientes());
            req.setAttribute("agendamentos",agendamentoBO.getAgendamentos()); 
            req.setAttribute("agendamentosC",agendamentoBO.getAgendamentosC()); 
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
    req.getRequestDispatcher("jsp/Cadastros/Agenda.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         HttpSession sessao = req.getSession();
        
        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else{ 
        
        try{
            req.setAttribute("agendamentos",agendamentoBO.getAgendamentos()); 
            req.setAttribute("agendamentosC",agendamentoBO.getAgendamentosC()); 
            req.setAttribute("clientes", clienteBO.getClientes());
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
        req.getRequestDispatcher("jsp/Cadastros/Agenda.jsp").forward(req, resp);
    }
    }
}
