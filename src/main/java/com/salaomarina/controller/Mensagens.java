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
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "Mensagens", urlPatterns = {"/Mensagens"})
public class Mensagens extends HttpServlet {
    
     private MensagensBO mensagembo = new MensagensBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        else if(Objects.nonNull(req.getParameter("idmensagem"))){
            //Tratando exclusão
          
                    try{
                mensagembo.LerMensagem(req.getParameter("idmensagem"));
                req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Obrigado por ler a mensagem ^.^</div>"
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
        try {
             
              req.setAttribute("lidas", mensagembo.getMensagensLidas());
         } catch (Exception e) {
             req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-info\" role=\"alert\">"+e.getMessage()+"</div><script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
         }
        try {
             req.setAttribute("naolidas", mensagembo.getMensagensNaoLidas());
             
         } catch (Exception e) {
             req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-info\" role=\"alert\">"+e.getMessage()+"</div><script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
         }
         req.getRequestDispatcher("jsp/Cadastros/Mensagens.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        else if(Objects.nonNull(req.getParameter("ler"))){
            //Tratando exclusão
          
                    try{
                mensagembo.LerMensagem(req.getParameter("idmensagem"));
                req.setAttribute("mensagemSucesso", "<div id=\"foo\"  class=\"alert alert-success\" role=\"alert\">Obrigado por ler a mensagem ^.^</div>"
                        + "<script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
                
                }catch(Exception e){
                req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-info\" role=\"alert\">"+e.getMessage()+"</div><script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
                
            }
            
        }
         try {
             
               req.setAttribute("lidas", mensagembo.getMensagensLidas());
         } catch (Exception e) {
             req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-info\" role=\"alert\">"+e.getMessage()+"</div><script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
         }
        try {
             req.setAttribute("naolidas", mensagembo.getMensagensNaoLidas());
            
         } catch (Exception e) {
             req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-info\" role=\"alert\">"+e.getMessage()+"</div><script>\n" +
"                    $().ready(function () {\n" +
"                        setTimeout(function () {\n" +
"                            $('#foo').hide();\n" +
"                        }, 10000);\n" +
"                    });\n" +
"                </script>\n" +
"");
         }
        req.getRequestDispatcher("jsp/Cadastros/Mensagens.jsp").forward(req, resp);
    }
}
