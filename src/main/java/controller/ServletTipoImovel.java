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
import model.TipoImovel;
import model.TipoImovelDAO;

@WebServlet(name = "ServletTipoImovel", urlPatterns = "/imovel")
public class ServletTipoImovel extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private TipoImovelDAO tipoimovelDAO = new TipoImovelDAO();
	private TipoImovel tipoimovel = new TipoImovel();
	private String destino = "";
	private int idimovel;
	private String nome_tipoimovel;
	private boolean estado = false;
	private String message;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		destino ="WEB-INF/tipoimovel.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");		
		estado = false;

		try {
			idimovel = Integer.parseInt(request.getParameter("idimovel"));
			} catch (NumberFormatException number) {
				estado = true;
				try {
					adicionaCidade(request, response);
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (estado == false) {
			tipoimovel.setId_imovel(idimovel);
			try {
				if (tipoimovelDAO.existe(tipoimovel) == true) {
					editarCidade(request, response);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}	
		
		request.setAttribute("message", message);
		destino ="WEB-INF/tipoimovel.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void adicionaCidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
		nome_tipoimovel = request.getParameter("nome_tipoimovel");
		tipoimovel.setNome_tpimovel(nome_tipoimovel);
		if (tipoimovelDAO.inserir(tipoimovel) == true)
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarCidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idimovel = Integer.parseInt(request.getParameter("idimovel"));
		nome_tipoimovel = request.getParameter("nome_tipoimovel");
		tipoimovel.setId_imovel(idimovel);
		tipoimovel.setNome_tpimovel(nome_tipoimovel);		
		if (tipoimovelDAO.alterar(tipoimovel) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}