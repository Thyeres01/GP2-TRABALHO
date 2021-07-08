package controller;


import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.VisitaDAO;
import model.Bairro;
import model.BairroDAO;
import model.Cidade;
import model.CidadeDAO;
import model.Estagio;
import model.EstagioDAO;
import model.TipoImovel;
import model.TipoImovelDAO;
import model.Tratamento;
import model.TratamentoDAO;
import model.Visita;

@WebServlet(name="ServletBuscaVisita", urlPatterns = "/buscavisita")
public class ServletBuscaVisita extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private VisitaDAO visitaDAO = new VisitaDAO();
	private Visita visita = new Visita();
	private PopulaVisita populavisita = new PopulaVisita();
	private int idvisita;
	private String destino = "";
	private String acao;
	private String message;
	private String textopesquisa1; 
	private String textopesquisa2; 
	private String textopesquisa3;
	private String textopesquisa4;
	private String textopesquisa5; 
	private String textopesquisa6;
	private String textopesquisa7; 
	private String textopesquisa8;
	private String textopesquisa9; 
	private String textopesquisa10;

	private Date data_formatada;

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try {
			popularcombos(request,response);
			acao = request.getParameter("acao");	
			if(acao!=null){
				if(acao.equalsIgnoreCase("Consultar")){
						consultareditarvisita(request, response);
				}else if(acao.equalsIgnoreCase("Excluir")){
						excluirvisita(request,response);
				}					
			}else if (acao==null){				
				destino ="WEB-INF/c_visita.jsp";
			}
		}catch (Exception e){
			e.printStackTrace();
		}
			RequestDispatcher rd = request.getRequestDispatcher(destino);
		    rd.forward(request, response); 	
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		

			request.setCharacterEncoding("UTF8");
			try {
				popularcombos(request,response);
				buscarvisita(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher(destino);
	     	rd.forward(request, response);
		
	}
	
	protected void popularcombos(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		populavisita.popularCombosVisita();		
		request.setAttribute("listacidade",populavisita.combocidade);	
		request.setAttribute("listabairro",populavisita.combobairro);
		request.setAttribute("listaimovel",populavisita.combotipoimovel);
		request.setAttribute("listaestagio",populavisita.comboestagio);
		request.setAttribute("listatratamento",populavisita.combotratamento);
	}
	protected void buscarvisita(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {

			List<Visita> listavisita = new ArrayList<Visita>();
			
			textopesquisa1 = request.getParameter("txtpesquisa1");
			textopesquisa2 = request.getParameter("txtpesquisa2");		
			textopesquisa3 = request.getParameter("txtpesquisa3");
			textopesquisa4 = request.getParameter("txtpesquisa4");	
			textopesquisa5 = request.getParameter("txtpesquisa5");
			textopesquisa6 = request.getParameter("txtpesquisa6");			
			textopesquisa7 = request.getParameter("txtpesquisa7");
			textopesquisa8 = request.getParameter("txtpesquisa8");
			textopesquisa9 = request.getParameter("txtpesquisa9");
			textopesquisa10 = request.getParameter("txtpesquisa10");
		
			

			
	      //  if((textopesquisa1!="" && textopesquisa1!=null)
	      //  		|| (textopesquisa2!="" && textopesquisa2!=null)
	      //  		|| (textopesquisa3!="" && textopesquisa3!=null)
	      //  		|| (textopesquisa4!="" && textopesquisa4!=null)
	      //  		|| (textopesquisa5!="" && textopesquisa5!=null)){

				    		
				listavisita = visitaDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3, textopesquisa4,
							  textopesquisa5, textopesquisa6, textopesquisa7, textopesquisa8, textopesquisa9,
							  textopesquisa10);				
		   //  }else{
		   // 	listavisita = visitaDAO.listar();	
		   // }	 
	        request.setAttribute("listavisita", listavisita);
			destino = "WEB-INF/c_visita.jsp";
	}  
	 protected void consultareditarvisita(HttpServletRequest request,
	 		    HttpServletResponse response) throws ServletException, IOException, SQLException {
			 	
		 		idvisita = Integer.parseInt(request.getParameter("idvisita")); 			
				visita.setIdvisita(idvisita);			
				visita = visitaDAO.consultar_editar(visita);					
		        request.setAttribute("visita", visita);
				destino = "WEB-INF/visita.jsp";	
		}
	 
	 protected void excluirvisita(HttpServletRequest request,
	 		    HttpServletResponse response) throws ServletException, IOException, SQLException {

		 		idvisita = Integer.parseInt(request.getParameter("idvisita"));
				visita.setIdvisita(idvisita);			
				request.setAttribute("visita", visita);
				
				if (visitaDAO.excluir(visita)==true) 
					message = "Erro ao Alterar Registro";
				else
					message = "Registro Excluido com Sucesso";
				request.setAttribute("message", message);

				List<Visita> listavisita = new ArrayList<Visita>();
				listavisita = visitaDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3, textopesquisa4,
						  textopesquisa5, textopesquisa6, textopesquisa7, textopesquisa8, textopesquisa9,
						  textopesquisa10);
				request.setAttribute("listavisita", listavisita);				
				destino = "WEB-INF/c_visita.jsp";	
		}
}