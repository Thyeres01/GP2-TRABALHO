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

@WebServlet(name = "ServletBuscaEstagio", urlPatterns = "/buscaestagio")
public class ServletBuscaEstagio extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private EstagioDAO estagioDAO = new EstagioDAO();
	private Estagio estagio = new Estagio();	
	private String destino = "";
	private int idestagio;
	private String nome_estagio;
	private boolean estado = false;
	private String message;
	private String textopesquisa1;
	private String acao;
	private String pesquisa;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		message = "";
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");		
		estado = false;

		try {
			acao = request.getParameter("acao");
				if (acao != null) {
					if (acao.equalsIgnoreCase("Consultar")) {		
						consultareditarestagio(request, response);
					} else if (acao.equalsIgnoreCase("Excluir")) {
						excluirestagio(request, response);
					}				
				}else if(acao==null){
					destino ="WEB-INF/estagio.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					buscarestagio(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
			
		
		request.setAttribute("message", message);
		destino ="WEB-INF/estagio.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	
	protected void buscarestagio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		textopesquisa1 = request.getParameter("txtpesquisa1");
		List<Estagio> listaestagio = new ArrayList<Estagio>();
		listaestagio = estagioDAO.listar(textopesquisa1);
		request.setAttribute("listaestagio", listaestagio);
		destino ="WEB-INF/estagio.jsp";

	}

	protected void consultareditarestagio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idestagio = Integer.parseInt(request.getParameter("idestagio"));
		estagio.setIdestagio(idestagio);
		estagio = estagioDAO.consultar_editar(estagio);
		request.setAttribute("estagio", estagio);
		destino ="WEB-INF/estagio.jsp";
	}

	protected void excluirestagio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idestagio = Integer.parseInt(request.getParameter("idestagio"));
		estagio.setIdestagio(idestagio);
		estagioDAO.excluir(estagio);
		destino ="WEB-INF/estagio.jsp";
		if (estagioDAO.excluir(estagio) == true)
			message = "Erro ao Excluir Registro";
		else
			message = "Registro Excluido com Sucesso";
	}
}