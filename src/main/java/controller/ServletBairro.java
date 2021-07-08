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

import model.Bairro;
import model.BairroDAO;

@WebServlet(name = "ServletBairro", urlPatterns = "/bairro")
public class ServletBairro extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private BairroDAO bairroDAO = new BairroDAO();
	private Bairro bairro = new Bairro();
	private PopulaBairro populabairro = new PopulaBairro();
	private String destino = "";
	private int idbairro;
	private String nome_bairro;
	private String nome_cidade;
	private boolean estado = false;	
	private String message;
	private String textopesquisa1;
	private String textopesquisa2;
	private String acao;
	private String tipoform;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		try {
			popularcombos(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		destino ="WEB-INF/bairro.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);			
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");
		estado = false;

		try {
			idbairro = Integer.parseInt(request.getParameter("idbairro"));
			} catch (NumberFormatException number) {
				estado = true;
				try {
					adicionaBairro(request, response);
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (estado == false) {
			bairro.setIdbairro(idbairro);			
			try {
				if (bairroDAO.existe(bairro) == true) {
					editarBairro(request, response);
					request.setAttribute("message", message);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}			
		
		try {
			popularcombos(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("message", message);		
		destino ="WEB-INF/bairro.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}
	
	protected void popularcombos(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		populabairro.popularBairro();
		request.setAttribute("listacidade",populabairro.combocidade);	
		request.setAttribute("listabairro",populabairro.combobairro);
	}
	

	protected void adicionaBairro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
		nome_bairro = request.getParameter("bairro");
		nome_cidade = request.getParameter("cidade");
		bairro.setNome_bairro(nome_bairro);
		bairro.setNome_cidade(nome_cidade);

		if (bairroDAO.inserir(bairro) == true)
			
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarBairro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idbairro = Integer.parseInt(request.getParameter("idbairro"));
		nome_bairro = request.getParameter("bairro");
		nome_cidade = request.getParameter("cidade");
		bairro.setIdbairro(idbairro);
		bairro.setNome_bairro(nome_bairro);
		bairro.setNome_cidade(nome_cidade);
		
		if (bairroDAO.alterar(bairro) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
	
	protected void consultareditarbairro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idbairro = Integer.parseInt(request.getParameter("idbairro"));
		bairro.setIdbairro(idbairro);
		bairro = bairroDAO.consultar_editar(bairro);
		request.setAttribute("bairro", bairro);
		destino ="WEB-INF/bairro.jsp";
	}

	protected void excluirbairro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idbairro = Integer.parseInt(request.getParameter("idbairro"));
		bairro.setIdbairro(idbairro);
		bairroDAO.excluir(bairro);
		destino ="WEB-INF/bairro.jsp";
		if (bairroDAO.excluir(bairro) == true)
			message = "Erro ao Excluir Registro";
		else
			message = "Registro Excluido com Sucesso";
		request.setAttribute("message", message);
	}
}