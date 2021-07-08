package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FuncionarioDAO;
import model.Funcionario;

@WebServlet(name = "ServletLogin", urlPatterns = "/inicio")
public class ServletLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
	private Funcionario funcionario = new Funcionario();
	private int idfuncionario;
	private String destino = "";
	private String acao;
	private String message;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		acao = request.getParameter("acao");
		if (acao.equals("logout")) {
			logout(request, response);
		}else if(acao.equals("inicio")){
			destino = "WEB-INF/pagina_inicial.jsp";			
		}
			RequestDispatcher rd = request.getRequestDispatcher(destino);
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			login(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		funcionario = funcionarioDAO.buscarPorMatricula(request.getParameter("login"));
		String senha = request.getParameter("senha");

		if (funcionario.getSenha() != null && funcionario.getSenha().equals(senha)) {
			HttpSession sessao = request.getSession();
			// setando um atributo da sessao
			sessao.setAttribute("nome", funcionario.getNome());
			sessao.setAttribute("funcao", funcionario.getFuncao());
			destino = "WEB-INF/pagina_inicial.jsp";
	
		} else {
			message = "Falha no login, verifique os dados.";
			request.setAttribute("message", message);
			destino = "WEB-INF/index.jsp";
		}

	}

	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// no logout invalido a sessao
		HttpSession sessao = request.getSession();
		sessao.removeAttribute("nome");
		sessao.removeAttribute("funcao");
		sessao.invalidate();
		destino = "WEB-INF/index.jsp";		
	}

}
