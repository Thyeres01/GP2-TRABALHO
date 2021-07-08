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

import model.TipoImovel;
import model.TipoImovelDAO;

@WebServlet(name = "ServletBuscaTipoImovel", urlPatterns = "/buscaimovel")
public class ServletBuscaTipoImovel extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private TipoImovelDAO tipoimovelDAO = new TipoImovelDAO();
	private TipoImovel tipoimovel = new TipoImovel();
	private String destino = "";
	private int idimovel;
	private String nome_tipoimovel;
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
						consultareditarimovel(request, response);
					} else if (acao.equalsIgnoreCase("Excluir")) {
						excluirimovel(request, response);
					}				
				}else if(acao==null){
					destino ="WEB-INF/tipoimovel.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					buscarimovel(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
			
		
		request.setAttribute("message", message);
		destino ="WEB-INF/tipoimovel.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	
	protected void buscarimovel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		textopesquisa1 = request.getParameter("txtpesquisa1");
		List<TipoImovel> listaimovel = new ArrayList<TipoImovel>();
		listaimovel = tipoimovelDAO.listar(textopesquisa1);
		request.setAttribute("listaimovel", listaimovel);

	}

	protected void consultareditarimovel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idimovel = Integer.parseInt(request.getParameter("idimovel"));
		tipoimovel.setId_imovel(idimovel);
		tipoimovel = tipoimovelDAO.consultar_editar(tipoimovel);
		request.setAttribute("tipoimovel", tipoimovel);
	}

	protected void excluirimovel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idimovel = Integer.parseInt(request.getParameter("idimovel"));
		tipoimovel.setId_imovel(idimovel);
		tipoimovelDAO.excluir(tipoimovel);
		destino ="WEB-INF/tipoimovel.jsp";
		if (tipoimovelDAO.excluir(tipoimovel) == true)
			message = "Erro ao Excluir Registro";
		else
			message = "Registro Excluido com Sucesso";
	}
}