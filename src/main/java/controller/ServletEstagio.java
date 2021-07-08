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

import model.Estagio;
import model.EstagioDAO;

@WebServlet(name = "ServletEstagio", urlPatterns = "/estagio")
public class ServletEstagio extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private EstagioDAO estagioDAO = new EstagioDAO();
	private Estagio estagio = new Estagio();	
	private String destino = "";
	private int idestagio;
	private String nome_estagio;
	private boolean estado = false;
	private String message;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		destino ="WEB-INF/estagio.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");		
		estado = false;

		try {
			idestagio = Integer.parseInt(request.getParameter("idestagio"));
			} catch (NumberFormatException number) {
				estado = true;
				try {
					adicionaEstagio(request, response);
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (estado == false) {
			estagio.setIdestagio(idestagio);
			try {
				if (estagioDAO.existe(estagio) == true) {
					editarEstagio(request, response);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}	
		
		request.setAttribute("message", message);
		destino ="WEB-INF/estagio.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void adicionaEstagio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
		nome_estagio = request.getParameter("estagio");
		estagio.setNome_estagio(nome_estagio);
		if (estagioDAO.inserir(estagio) == true)
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarEstagio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idestagio = Integer.parseInt(request.getParameter("idestagio"));
		nome_estagio = request.getParameter("estagio");
		estagio.setIdestagio(idestagio);
		estagio.setNome_estagio(nome_estagio);		
		if (estagioDAO.alterar(estagio) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}