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
import javax.servlet.http.HttpSession;

import model.NotificacaoDAO;
import model.TipoImovel;
import model.TipoImovelDAO;
import model.Bairro;
import model.BairroDAO;
import model.Cidade;
import model.CidadeDAO;
import model.Notificacao;
import model.Visita;
import controller.CapturaDataHora;


@WebServlet(name = "ServletEnviaNotificacao", urlPatterns = "/envianotificacao")
public class ServletEnviaNotificacao extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private NotificacaoDAO notificacaoDAO = new NotificacaoDAO();
	private Notificacao notificacao = new Notificacao();
	private Visita visita = new Visita();
	private PopulaVisita populavisita = new PopulaVisita();
	private CapturaDataHora capturadatahora = new CapturaDataHora();
	private int idnotificacao;
	private String agente;			
	private String destino = "";
	private String acao;
	private String message;
	private String textopesquisa1;
	private String textopesquisa2;
	private String textopesquisa3;
	private Date data_formatada;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("data_visita", capturadatahora.getDateTime());

		try {
			popularcombos(request,response);
			acao = request.getParameter("acao");
				if (acao != null) {
					if (acao.equalsIgnoreCase("Verificar")) {				
						capturaNomeUsuario(request, response);
						verificarnotificacao(request, response);
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
	
	protected void capturaNomeUsuario(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		agente = request.getParameter("agente");			
		if (agente==null) {			
			HttpSession sessao = request.getSession();
			agente = (String) sessao.getAttribute("nome");
			visita.setAgente(agente);
			request.setAttribute("visita", visita);
		}
	}

	protected void verificarnotificacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		idnotificacao = Integer.parseInt(request.getParameter("idnotificacao"));	
		visita.setIdnotificacao(idnotificacao);
		visita = notificacaoDAO.verificar(visita);
		request.setAttribute("visita", visita);
		destino = "WEB-INF/visita.jsp";
	}	
}
