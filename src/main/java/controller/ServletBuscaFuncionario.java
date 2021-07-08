package controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FuncionarioDAO;
import model.Funcionario;

@WebServlet(name="ServletBuscaFuncionario", urlPatterns = "/buscafuncionario")
public class ServletBuscaFuncionario extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
	private Funcionario funcionario = new Funcionario();
	private PopulaFuncionario populafuncionario = new PopulaFuncionario();
	private int idfuncionario;
	private String destino = "";
	private String acao;
	private String message;
	private String textopesquisa1; 
	private String textopesquisa2; 
	private String textopesquisa3; 

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			
			try {
				popularcombo(request, response);
				acao = request.getParameter("acao");	
				if(acao!=null){
					if(acao.equalsIgnoreCase("Consultar")){
						consultareditarfuncionario(request, response);						
					}else if(acao.equalsIgnoreCase("Excluir")){				
						excluirfuncionario(request,response);						 
					}
				}else if (acao==null){				
						destino ="WEB-INF/c_funcionario.jsp";						
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}						
			RequestDispatcher rd = request.getRequestDispatcher(destino);
		    rd.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
			
			request.setCharacterEncoding("UTF8");				
			
			try {	
				popularcombo(request, response);
				buscarfuncionario(request, response);				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher(destino);
	     	rd.forward(request, response);
		
	}
	
	protected void popularcombo(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		populafuncionario.popularCombosFuncionario();
		request.setAttribute("listafuncao",populafuncionario.combofuncao);		
	}
	
	
	protected void buscarfuncionario(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {

			textopesquisa1 = request.getParameter("txtpesquisa1");
			textopesquisa2 = request.getParameter("txtpesquisa2");		
			textopesquisa3 = request.getParameter("txtpesquisa3");	
			List<Funcionario> listafuncionario = new ArrayList<Funcionario>();
			
	         // if((textopesquisa1!="" && textopesquisa1!=null)  || (textopesquisa2!="" && textopesquisa2!=null) ||(textopesquisa3!="" && textopesquisa3!=null)){
				listafuncionario = funcionarioDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3);
		     //}else{
			 //	listafuncionario = funcionarioDAO.listar();
		     // }	 
	        request.setAttribute("listafuncionario", listafuncionario);
			destino = "WEB-INF/c_funcionario.jsp";
	}  
	 protected void consultareditarfuncionario(HttpServletRequest request,
	 		    HttpServletResponse response) throws ServletException, IOException, SQLException {
			 
			 	idfuncionario = Integer.parseInt(request.getParameter("idfuncionario")); 			
				funcionario.setIdfuncionario(idfuncionario);				
				funcionario = funcionarioDAO.consultar_editar(funcionario);
				request.setAttribute("funcionario", funcionario);
				destino = "WEB-INF/funcionario.jsp";	
		}
	 
	 protected void excluirfuncionario(HttpServletRequest request,
	 		    HttpServletResponse response) throws ServletException, IOException, SQLException {

		 		idfuncionario = Integer.parseInt(request.getParameter("idfuncionario"));
				funcionario.setIdfuncionario(idfuncionario);			
				request.setAttribute("funcionario", funcionario);
				funcionarioDAO.excluir(funcionario);
				List<Funcionario> listafuncionario = new ArrayList<Funcionario>();    		
	        	listafuncionario = funcionarioDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3);
				request.setAttribute("listafuncionario", listafuncionario);				
				destino = "WEB-INF/c_funcionario.jsp";	
		}
}