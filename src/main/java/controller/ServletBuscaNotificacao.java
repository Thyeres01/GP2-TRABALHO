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
import model.NotificacaoDAO;
import model.TipoImovel;
import model.TipoImovelDAO;
import model.Bairro;
import model.BairroDAO;
import model.Cidade;
import model.CidadeDAO;
import model.Notificacao;

@WebServlet(name = "ServletBuscaNotificacao", urlPatterns = "/buscanotificacao")
public class ServletBuscaNotificacao extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private NotificacaoDAO notificacaoDAO = new NotificacaoDAO();
	private Notificacao notificacao = new Notificacao();
	private PopulaNotificacao populanotificacao = new PopulaNotificacao();
	private int idnotificacao;
	private String destino = "";
	private String acao;
	private String message;
	private String textopesquisa1;
	private String textopesquisa2;
	private String textopesquisa3;
	private String textopesquisa4;
	private Date data_formatada;
	private int verificado = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			popularcombos(request,response);
			acao = request.getParameter("acao");
				if (acao != null) {
					if (acao.equalsIgnoreCase("Consultar")) {				
						consultareditarnotificacao(request, response);						
					} else if (acao.equalsIgnoreCase("Excluir")) {				
						excluirnotificacao(request, response);
					}
				}else if (acao==null){				
					destino ="WEB-INF/c_notificacao.jsp";
				}
			}catch (Exception e){
				e.printStackTrace();
		}		
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");
		try {
			popularcombos(request,response);
			buscarnotificacao(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);

	}

	protected void popularcombos(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		populanotificacao.popularCombosNotificacao();
		request.setAttribute("listacidade",populanotificacao.combocidade);	
		request.setAttribute("listabairro",populanotificacao.combobairro);
		request.setAttribute("listaimovel", populanotificacao.combotipoimovel);
	}
	
	protected void buscarnotificacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Notificacao> listanotificacao = new ArrayList<Notificacao>();
		verificado = 0;
		textopesquisa1 = request.getParameter("txtpesquisa1");
		textopesquisa2 = request.getParameter("txtpesquisa2");
		textopesquisa3 = request.getParameter("txtpesquisa3");		
		try {			
			if ("on".equals(request.getParameter("txtpesquisa4")) && request.getParameter("txtpesquisa4")!= null)
				verificado = 1;
			else 
				verificado = 0;	
		}catch(Exception e){
			e.printStackTrace();
		}
			
	//	System.out.println(textopesquisa4);
	//	System.out.println(verificado);

	//	if ((textopesquisa1 != "" && textopesquisa1 != null) || (textopesquisa2 != "" && textopesquisa2 != null)
	//			|| (textopesquisa3 != "" && textopesquisa3 != null)
	//			|| (textopesquisa4 != "" && textopesquisa4 != null)) {

			listanotificacao = notificacaoDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3, verificado);
	//	} else {
	//		listanotificacao = notificacaoDAO.listar();

	//	}
		request.setAttribute("listanotificacao", listanotificacao);
		destino = "WEB-INF/c_notificacao.jsp";
	}
	
	protected void consultareditarnotificacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String auxiliar = "";
		idnotificacao = Integer.parseInt(request.getParameter("idnotificacao"));
		notificacao.setIdnotificacao(idnotificacao);
		notificacao = notificacaoDAO.consultar_editar(notificacao);
		request.setAttribute("notificacao", notificacao);
		destino = "WEB-INF/notificacao.jsp";
	}
	
	protected void excluirnotificacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		idnotificacao = Integer.parseInt(request.getParameter("idnotificacao"));
		notificacao.setIdnotificacao(idnotificacao);
		notificacaoDAO.excluir(notificacao);
		List<Notificacao> listanotificacao = new ArrayList<Notificacao>();
		listanotificacao = notificacaoDAO.listar(textopesquisa1, textopesquisa2, textopesquisa3, verificado);
		request.setAttribute("listanotificacao", listanotificacao);
		destino = "WEB-INF/c_notificacao.jsp";
	}
}
