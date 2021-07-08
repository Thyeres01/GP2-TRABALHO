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

@WebServlet(name = "ServletBuscaFuncao", urlPatterns = "/buscatipofuncao")
public class ServletBuscaFuncao extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private FuncaoDAO funcaoDAO = new FuncaoDAO();
	private Funcao funcoes = new Funcao();	
	private String destino = "";
	private int idfuncao;
	private String nome_funcao;
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
						consultareditarfuncao(request, response);
					} else if (acao.equalsIgnoreCase("Excluir")) {
						excluirfuncao(request, response);
					}				
				}else if(acao==null){
					destino ="WEB-INF/funcao.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					buscarfuncao(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
			
		
		request.setAttribute("message", message);
		destino ="WEB-INF/funcao.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	
	protected void buscarfuncao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		textopesquisa1 = request.getParameter("txtpesquisa1");
		List<Funcao> listafuncao = new ArrayList<Funcao>();
		listafuncao = funcaoDAO.listar(textopesquisa1);
		request.setAttribute("listafuncoes", listafuncao);

	}

	protected void consultareditarfuncao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idfuncao = Integer.parseInt(request.getParameter("idfuncao"));
		funcoes.setIdfuncao(idfuncao);
		funcoes = funcaoDAO.consultar_editar(funcoes);
		request.setAttribute("funcoes", funcoes);
	}

	protected void excluirfuncao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idfuncao = Integer.parseInt(request.getParameter("idfuncao"));
		funcoes.setIdfuncao(idfuncao);
		funcaoDAO.excluir(funcoes);
		destino ="WEB-INF/funcao.jsp";
		if (funcaoDAO.excluir(funcoes) == true)
			message = "Erro ao Excluir Registro";
		else
			message = "Registro Excluido com Sucesso";
	}
}