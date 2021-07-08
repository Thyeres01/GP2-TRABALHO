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

@WebServlet(name = "ServletBuscaBairro", urlPatterns = "/buscabairro")
public class ServletBuscaBairro extends HttpServlet {

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
						consultareditarbairro(request, response);
					} else if (acao.equalsIgnoreCase("Excluir")) {
						excluirbairro(request, response);
						popularcombos(request,response);
					}				
				}else if(acao==null){
					destino ="WEB-INF/bairro.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					popularcombos(request, response);
					buscarbairro(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
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
	
	
	protected void buscarbairro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Bairro> listabairros = new ArrayList<Bairro>();
		textopesquisa1 = request.getParameter("txtpesquisa1");
		textopesquisa2 = request.getParameter("txtpesquisa2");
		listabairros = bairroDAO.listar(textopesquisa1,textopesquisa2);
		request.setAttribute("listabairros", listabairros);
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
	}
}