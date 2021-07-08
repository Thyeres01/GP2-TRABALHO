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

import model.Cidade;
import model.CidadeDAO;

@WebServlet(name = "ServletCidade", urlPatterns = "/cidade")
public class ServletCidade extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private CidadeDAO cidadeDAO = new CidadeDAO();
	private Cidade cidade = new Cidade();	
	private String destino = "";
	private int idcidade;
	private String nome_cidade;
	private boolean estado = false;
	private String message;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		destino ="WEB-INF/cidade.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");		
		estado = false;

		try {
			idcidade = Integer.parseInt(request.getParameter("idcidade"));
			} catch (NumberFormatException number) {
				estado = true;
				try {
					adicionaCidade(request, response);
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (estado == false) {
			cidade.setIdcidade(idcidade);
			try {
				if (cidadeDAO.existe(cidade) == true) {
					editarCidade(request, response);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}	
		
		request.setAttribute("message", message);
		destino ="WEB-INF/cidade.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void adicionaCidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
		nome_cidade = request.getParameter("cidade");
		cidade.setNome_cidade(nome_cidade);
		if (cidadeDAO.inserir(cidade) == true)
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarCidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idcidade = Integer.parseInt(request.getParameter("idcidade"));
		nome_cidade = request.getParameter("cidade");
		cidade.setIdcidade(idcidade);
		cidade.setNome_cidade(nome_cidade);		
		if (cidadeDAO.alterar(cidade) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}