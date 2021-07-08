package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Funcao;
import model.FuncaoDAO;

@WebServlet(name = "ServletFuncao", urlPatterns = "/tipofuncao")
public class ServletFuncao extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private FuncaoDAO funcaoDAO = new FuncaoDAO();
	private Funcao funcoes = new Funcao();	
	private String destino = "";
	private int idfuncao;
	private String nome_funcao;
	private boolean estado = false;
	private String message;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		destino ="WEB-INF/funcao.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");		
		estado = false;

		try {
			idfuncao = Integer.parseInt(request.getParameter("idfuncao"));
			} catch (NumberFormatException number) {
				estado = true;
				try {
					adicionafuncao(request, response);
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (estado == false) {
			funcoes.setIdfuncao(idfuncao);
			try {
				if (funcaoDAO.existe(funcoes) == true) {
					editarfuncao(request, response);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}	
		
		request.setAttribute("message", message);
		destino ="WEB-INF/funcao.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void adicionafuncao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
		nome_funcao = request.getParameter("nome_funcao");
		funcoes.setNome_funcao(nome_funcao);
		if (funcaoDAO.inserir(funcoes) == true)
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarfuncao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idfuncao = Integer.parseInt(request.getParameter("idfuncao"));
		nome_funcao = request.getParameter("nome_funcao");
		funcoes.setIdfuncao(idfuncao);
		funcoes.setNome_funcao(nome_funcao);		
		if (funcaoDAO.alterar(funcoes) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}