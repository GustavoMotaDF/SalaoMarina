/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

import com.salaomarina.negocio.MensagensBO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gustavo
 */
@WebServlet(name = "EnviarMensagem", urlPatterns = {"/Site-Paginas-Contato"})
public class EnviarMensagem extends HttpServlet {
    private MensagensBO mensagembo = new MensagensBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         if (Objects.nonNull(req.getParameter("enviar"))) {
        try{
           
            mensagembo.SalvarMensagem(req.getParameter("nome"),                                    
                                    req.getParameter("Telefone"),
                                    req.getParameter("Email"),        
                                    req.getParameter("mensagem"));
                                    
                                    
            req.setAttribute("mensagemSucesso",  "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Mensagem enviada com sucesso!<br>Caso seja alguma duvida, iremos responder via WhatsApp e/ou Email.<br>Até Logo, "+req.getParameter("nome")+" ^.^ </strong> </div>"
                    + "<script>$().ready(function() {\n" +
                        "	setTimeout(function () {\n" +
                        "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n" +
                        "	}, 10000); // O valor é representado em milisegundos.\n" +
                        "});</script>");
       }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\"><strong> Erro ao enviar mensagem </strong> </div>"+
            "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
        }
    }
      req.getRequestDispatcher("Site/Paginas/Contato.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      if (Objects.nonNull(req.getParameter("enviar"))) {
        try{
           
            mensagembo.SalvarMensagem(req.getParameter("nome"),                                    
                                    req.getParameter("Telefone"),
                                    req.getParameter("Email"),        
                                    req.getParameter("mensagem"));
                                    
                                    
            req.setAttribute("mensagemSucesso",  "<div id=\"foo\" class=\"alert alert-success\" role=\"alert\"> <strong> Mensagem enviada com sucesso!<br>Caso seja alguma duvida, iremos responder via WhatsApp e/ou Email.<br>Até Logo, "+req.getParameter("nome")+" ^.^ </strong> </div>"
                    + "<script>$().ready(function() {\n" +
                        "	setTimeout(function () {\n" +
                        "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n" +
                        "	}, 10000); // O valor é representado em milisegundos.\n" +
                        "});</script>");
       }catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\"><strong> Erro ao enviar mensagem </strong> </div>"+
            "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
        }
    }
      req.getRequestDispatcher("Site/Paginas/Contato.jsp").forward(req, resp);
    }
    

}
