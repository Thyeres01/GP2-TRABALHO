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

@WebServlet(name = "ServletBuscaCidade", urlPatterns = "/buscacidade")
public class ServletBuscaCidade extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private CidadeDAO cidadeDAO = new CidadeDAO();
	private Cidade cidade = new Cidade();	
	private String destino = "";
	private int idcidade;
	private String nome_cidade;
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
						consultareditarcidade(request, response);
					} else if (acao.equalsIgnoreCase("Excluir")) {
						excluircidade(request, response);
					}				
				}else if(acao==null){
					destino ="WEB-INF/cidade.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					buscarcidade(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
			
		
		request.setAttribute("message", message);
		destino ="WEB-INF/cidade.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	
	protected void buscarcidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		textopesquisa1 = request.getParameter("txtpesquisa1");
		List<Cidade> listacidade = new ArrayList<Cidade>();
		listacidade = cidadeDAO.listar(textopesquisa1);
		request.setAttribute("listacidade", listacidade);

	}

	protected void consultareditarcidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idcidade = Integer.parseInt(request.getParameter("idcidade"));
		cidade.setIdcidade(idcidade);
		cidade = cidadeDAO.consultar_editar(cidade);
		request.setAttribute("cidade", cidade);
	}

	protected void excluircidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idcidade = Integer.parseInt(request.getParameter("idcidade"));
		cidade.setIdcidade(idcidade);
		cidadeDAO.excluir(cidade);
		destino ="WEB-INF/cidade.jsp";
		if (cidadeDAO.excluir(cidade) == true)
			message = "Erro ao Excluir Registro";
		else
			message = "Registro Excluido com Sucesso";
	}
}