package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
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
import model.Notificacao;

@WebServlet(name = "ServletNotificacao", urlPatterns = "/notificacao")
public class ServletNotificacao extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private NotificacaoDAO notificacaoDAO = new NotificacaoDAO();
	private Notificacao notificacao = new Notificacao();
	private PopulaNotificacao populanotificacao = new PopulaNotificacao();
	private CapturaDataHora capturadatahora = new CapturaDataHora();
	private String destino = "";
	private int idnotificacao;
	private String data_string;
	private Date data_notificacao;
	private String bairro;
	private String rua;
	private String quadra;
	private String lote;
	private String numero;
	private String cidade;
	private String tp_imovel;
	private String desc_notificacao;
	private String complemento;
	private String message;
	private boolean acao = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("data_notificacao", capturadatahora.getDateTime());
		
		try {
			popularcombos(request,response);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/notificacao.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");
		acao = false;

		try {
			idnotificacao = Integer.parseInt(request.getParameter("idnotificacao"));
			} catch (NumberFormatException number) {
				acao = true;
				try {
					adicionaNotificacao(request, response);
					destino = "buscanotificacao";
				  } catch (SQLException e) {			
					e.printStackTrace();
				}
			}

		if (acao == false) {
			notificacao.setIdnotificacao(idnotificacao);
			try {
				notificacaoDAO.existe(notificacao);				
				if (notificacaoDAO.existe(notificacao) == true) {
					editarNotificacao(request, response);
					destino = "buscanotificacao";
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}			
		}	

		request.setAttribute("message", message);
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
	
	protected void adicionaNotificacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		//data_string = request.getParameter("data_notificacao");
		bairro = request.getParameter("bairro");
		rua = request.getParameter("rua");
		quadra = request.getParameter("quadra");
		lote = request.getParameter("lote");
		numero = request.getParameter("numero");
		cidade = request.getParameter("cidade");
		tp_imovel = request.getParameter("tp_imovel");
		desc_notificacao = request.getParameter("desc_notificacao");
		complemento = request.getParameter("complemento");

		try {

			/*try {
				SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy hh:mm");
				data_notificacao = (Date) formato.parse(data_string);
				notificacao.setData_notificacao(data_notificacao);
			} catch (Exception e) {
				System.out.println("Erro ao formatar data.");
			}*/
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			Date date = new Date();
			data_string = dateFormat.format(date);		
			data_notificacao = (Date) dateFormat.parse(data_string);
			notificacao.setData_notificacao(data_notificacao);
			notificacao.setBairro(bairro);
			notificacao.setRua(rua);
			notificacao.setQuadra(quadra);
			notificacao.setLote(lote);
			notificacao.setNumero(numero);
			notificacao.setCidade(cidade);
			notificacao.setTp_imovel(tp_imovel);
			notificacao.setDesc_notificacao(desc_notificacao);
			notificacao.setComplemento(complemento);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Parametro incorreto.");
		}
		if (notificacaoDAO.inserir(notificacao) == true)
			message = "Erro ao Gravar Registro";
		else
			message = "Registro Gravado com Sucesso";

	}

	protected void editarNotificacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		idnotificacao = Integer.parseInt(request.getParameter("idnotificacao"));
		data_string = request.getParameter("data_notificacao");
		bairro = request.getParameter("bairro");
		rua = request.getParameter("rua");
		quadra = request.getParameter("quadra");
		lote = request.getParameter("lote");
		numero = request.getParameter("numero");
		cidade = request.getParameter("cidade");
		tp_imovel = request.getParameter("tp_imovel");
		desc_notificacao = request.getParameter("desc_notificacao");
		complemento = request.getParameter("complemento");


		try {

			/*try {
				SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy hh:mm");
				data_notificacao = (Date) formato.parse(data_string);
				notificacao.setData_notificacao(data_notificacao);
			} catch (Exception e) {
				System.out.println("Erro ao formatar data.");
			}*/
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			Date date = new Date();
			data_string = dateFormat.format(date);		
			data_notificacao = (Date) dateFormat.parse(data_string);
			notificacao.setData_notificacao(data_notificacao);
			notificacao.setIdnotificacao(idnotificacao);
			notificacao.setBairro(bairro);
			notificacao.setRua(rua);
			notificacao.setQuadra(quadra);
			notificacao.setLote(lote);
			notificacao.setNumero(numero);
			notificacao.setCidade(cidade);
			notificacao.setTp_imovel(tp_imovel);
			notificacao.setDesc_notificacao(desc_notificacao);	
			notificacao.setComplemento(complemento);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Parametro incorreto.");
		}

		if (notificacaoDAO.alterar(notificacao) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}