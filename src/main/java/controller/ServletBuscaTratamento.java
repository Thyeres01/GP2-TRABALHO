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

import model.Tratamento;
import model.TratamentoDAO;

@WebServlet(name = "ServletBuscaTratamento", urlPatterns = "/buscatratamento")
public class ServletBuscaTratamento extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private TratamentoDAO tratamentoDAO = new TratamentoDAO();
	private Tratamento tratamento = new Tratamento();	
	private String destino = "";
	private int idtratamento;
	private String nome_tratamento;
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
						consultareditartratamento(request, response);
					} else if (acao.equalsIgnoreCase("Excluir")) {
						excluirtratamento(request, response);
					}				
				}else if(acao==null){
					destino ="WEB-INF/tratamento.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				try {
					buscartratamento(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
			
		
		request.setAttribute("message", message);
		destino ="WEB-INF/tratamento.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	
	protected void buscartratamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		textopesquisa1 = request.getParameter("txtpesquisa1");
		List<Tratamento> listatratamento = new ArrayList<Tratamento>();
		listatratamento = tratamentoDAO.listar(textopesquisa1);
		request.setAttribute("listatratamento", listatratamento);
		destino ="WEB-INF/tratamento.jsp";

	}

	protected void consultareditartratamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idtratamento = Integer.parseInt(request.getParameter("idtratamento"));
		tratamento.setIdtratamento(idtratamento);
		tratamento = tratamentoDAO.consultar_editar(tratamento);
		request.setAttribute("tratamento", tratamento);
		destino ="WEB-INF/tratamento.jsp";
	}

	protected void excluirtratamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idtratamento = Integer.parseInt(request.getParameter("idtratamento"));
		tratamento.setIdtratamento(idtratamento);
		tratamentoDAO.excluir(tratamento);
		destino ="WEB-INF/tratamento.jsp";
		if (tratamentoDAO.excluir(tratamento) == true)
			message = "Erro ao Excluir Registro";
		else
			message = "Registro Excluido com Sucesso";
	}
}