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
 * @author gustavo
 */
@WebServlet(name = "HistoricoCliente", urlPatterns = {"/HistoricoCliente"})
public class HistoricoCliente extends HttpServlet {

    private ClienteBO clienteBO = new ClienteBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        
        else  if (Objects.nonNull(req.getParameter("historico"))) {
            //Tratando editar
              try{
            req.setAttribute("Historicovendas", clienteBO.getHistorico(req.getParameter("nomeCliente")));
            }
        catch(Exception e){
            req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">" + e.getMessage() + "</div>");
 
        }
        }
        req.setAttribute("clientes", clienteBO.getClientes());
        req.getRequestDispatcher("jsp/Cadastros/HistoricoCliente.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {

            try {
                req.setAttribute("clientes", clienteBO.getClientes());

            } catch (Exception e) {
                req.setAttribute("mensagemErro", "<div id=\"foo\"  class=\"alert alert-danger\" role=\"alert\">Erro interno, recarregue a pagina (F5), caso o erro persista, contate o administrator do sistema! (Especificação do erro " + e.getMessage() + ")</div>");
            }

            req.getRequestDispatcher("jsp/Cadastros/HistoricoCliente.jsp").forward(req, resp);
        }

    }
}
