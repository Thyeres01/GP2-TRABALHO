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

@WebServlet(name = "ServletTratamento", urlPatterns = "/tratamento")
public class ServletTratamento extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private TratamentoDAO tratamentoDAO = new TratamentoDAO();
	private Tratamento tratamento = new Tratamento();	
	private String destino = "";
	private int idtratamento;
	private String nome_tratamento;
	private String tp_tratamento;
	private boolean estado = false;
	

	private String message;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {			
		
		destino ="WEB-INF/tratamento.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");		
		estado = false;

		try {
			idtratamento = Integer.parseInt(request.getParameter("idtratamento"));
			} catch (NumberFormatException number) {
				estado = true;
				try {
					adicionaTratamento(request, response);
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (estado == false) {
			tratamento.setIdtratamento(idtratamento);
			try {
				if (tratamentoDAO.existe(tratamento) == true) {
					editarTratamento(request, response);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}	
		
		request.setAttribute("message", message);
		destino ="WEB-INF/tratamento.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void adicionaTratamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
			
		nome_tratamento = request.getParameter("tratamento");
		tp_tratamento = request.getParameter("tp_tratamento");
		tratamento.setNome_tratamento(nome_tratamento);
		tratamento.setTp_tratamento(tp_tratamento);
		if (tratamentoDAO.inserir(tratamento) == true)
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarTratamento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idtratamento = Integer.parseInt(request.getParameter("idtratamento"));
		nome_tratamento = request.getParameter("tratamento");
		tp_tratamento = request.getParameter("tp_tratamento");
		tratamento.setIdtratamento(idtratamento);
		tratamento.setNome_tratamento(nome_tratamento);
		tratamento.setTp_tratamento(tp_tratamento);
		if (tratamentoDAO.alterar(tratamento) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}