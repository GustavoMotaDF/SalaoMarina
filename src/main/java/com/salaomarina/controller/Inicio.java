/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salaomarina.controller;

import com.salaomarina.negocio.AgendamentoBO;
import com.salaomarina.negocio.FuncionarioBO;
import com.salaomarina.negocio.MensagensBO;
import java.io.IOException;
import static java.lang.System.out;
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
@WebServlet(name = "Inicio", urlPatterns = {"/Inicio"})
public class Inicio extends HttpServlet {

    private final AgendamentoBO agendamentobo = new AgendamentoBO();
    private final MensagensBO mensagembo = new MensagensBO();
    private final FuncionarioBO funcionariobo = new FuncionarioBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        if (Objects.nonNull(req.getParameter("Entrar"))) {
            try {

                req.setAttribute("Bemvindo", "<div id=\"myModal\" class=\"modal\">                            \n"
                        + "            <div class=\"modal-content\"> \n"
                        + "                <div class=\"input-group mb-3\">\n"
                        + "                    <div class=\"input-group-prepend\">\n"
                        + "                        <span class=\"input-group-text close \" onclick=\"fechar()\">&times;</span>\n"
                        + "                    </div>\n"
                        + "                </div> \n"
                        + "                <div class=\"mensagem\">\n"
                        + "                    <p class=\"p\">Bem vindo, "+req.getParameter("nome")+"!<br> Verifique suas notificações</p>\n"
                        + "                </div>\n"
                        + "                <br>\n"
                        + "                <div>\n"
                        + "                    <button class=\"btn btn-light\" onclick=\"fechar()\">OK</button>\n"
                        + "                    \n"
                        + "                </div>                                \n"
                        + "            </div>\n"
                        + "        </div> "
                        + "<link rel=\"stylesheet\" href=\"jsp/css/modal.css\">"
                        + "<script type=\"text/javascript\" src=\"jsp/js/modal.js\"></script>  ");
                req.setAttribute("agendamentos", agendamentobo.getAgendamentosTotal());
                req.setAttribute("agendamentospendente", agendamentobo.getAgendamentosPendente());
                req.setAttribute("mensagens", mensagembo.getMensagensNumNLidas());
                req.setAttribute("Login", funcionariobo.getLogin(req.getParameter("nome"), req.getParameter("senha")));
                session.isNew();
                session.setAttribute("nome", req.getParameter("nome"));

                req.getRequestDispatcher("jsp/inicio.jsp").forward(req, resp);

            } catch (Exception errologin) {

                req.setAttribute("mensagemErro", "<div class=\"alert alert-danger\" id=\"foo\">"
                        + "<strong> Login ou senha incorretos! </strong>"
                        + "</div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 15000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession();

        String nome = (String) sessao.getAttribute("nome");

        if (nome == null || nome.isEmpty()) {
            req.setAttribute("mensagemErro", "<div class=\"alert alert-danger\" id=\"foo\">"
                        + "<strong> Você foi deslogado, faça login novamente para ter acesso ao sistema! </strong>"
                        + "</div>"
                        + "<script>$().ready(function() {\n"
                        + "	setTimeout(function () {\n"
                        + "		$('#foo').hide(); // \"foo\" é o id do elemento que seja manipular.\n"
                        + "	}, 15000); // O valor é representado em milisegundos.\n"
                        + "});</script>");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            
        }
        try {
            req.setAttribute("agendamentos", agendamentobo.getAgendamentosTotal());
            req.setAttribute("agendamentospendente", agendamentobo.getAgendamentosPendente());
            req.setAttribute("mensagens", mensagembo.getMensagensNumNLidas());
            
        } catch (Exception ex) {
            req.setAttribute("mensagemErro", ex.getMessage());
        }
        req.getRequestDispatcher("jsp/inicio.jsp").forward(req, resp);

    }

}
