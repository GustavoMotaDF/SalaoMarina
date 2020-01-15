/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

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
@WebServlet(name = "VendaDia", urlPatterns = {"/VendaDia"})
public class VendaDia extends HttpServlet {
private VendaBO vendaBO = new VendaBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        else  if (Objects.nonNull(req.getParameter("datavenda"))) {
            //Tratando editar
              try{
            req.setAttribute("vendasdia", vendaBO.getvendasData(req.getParameter("datavenda")));
            }
        catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">" + e.getMessage() + "</div>");
 
        }
        }
        req.setAttribute("vendas",vendaBO.getvendas());
        req.getRequestDispatcher("jsp/Cadastros/VendaDia.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {

            try {
                req.setAttribute("vendas",vendaBO.getvendas());

            } catch (Exception e) {
                req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage() + ")</div>");
            }

            req.getRequestDispatcher("jsp/Cadastros/VendaDia.jsp").forward(req, resp);
        }
        
    }

}
