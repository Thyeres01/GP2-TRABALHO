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
import javax.servlet.http.HttpSession;

import model.VisitaDAO;
import model.Notificacao;
import model.NotificacaoDAO;
import model.Visita;
import controller.CapturaDataHora;

@WebServlet(name = "ServletVisita", urlPatterns = "/visita")
public class ServletVisita extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private VisitaDAO VisitaDAO = new VisitaDAO();
	private Visita visita = new Visita();
	private NotificacaoDAO NotificacaoDAO = new NotificacaoDAO();
	private Notificacao notificacao = new Notificacao();
	private PopulaVisita populavisita = new PopulaVisita();
	private CapturaDataHora capturadatahora = new CapturaDataHora();
	private String destino = "";
	private int idvisita;
	private int idnotificacao;
	private String status;
	private String agente;			
	private String data_string;
	private Date data_visita;
	private String rua;
	private String quadra;
	private String lote;
	private String numero;
	private String latitude;
	private String longitude;
	private String bairro;
	private String cidade;
	private String tp_imovel;
	private String[] estagio;	
	private String[] tp_larvicida;
	private String message;
	private String concatenaEstagio;
	private String concatenaLarvicida;
	private int[] dp = new int[7];
	private int[] qt = new int[7];	
	private String n_ini;
	private String n_fim;
	private String n_tubitos;
	private String qt_larv1;
	private String qt_larv2;	
	private String qt_adult1;
	private String qt_adult2;
	private String qt_focostratados;
	private String complemento;
	private boolean acao = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setAttribute("data_visita", capturadatahora.getDateTime());
			
			try {
				capturaNomeUsuario(request, response);
				popularcombos(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			} 	
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/visita.jsp");
			rd.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF8");
		acao = false;
      			
		try {
			idvisita = Integer.parseInt(request.getParameter("idvisita"));
			if (idvisita==0)
				acao = true;				
		} catch (Exception e) {	
			e.printStackTrace();			
		}		
					
		if (acao == false) {
			visita.setIdvisita(idvisita);
			try {
				VisitaDAO.existe(visita);
				if (VisitaDAO.existe(visita) == true) {
					editarVisita(request, response);
					destino = "buscavisita";			
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (acao == true){
			
			try { 			
				adicionaVisita(request, response);
				destino = "buscavisita";				
			}catch(Exception e){
				e.printStackTrace();
			}			
		}

		request.setAttribute("message", message);
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
	}
	
	protected void capturaNomeUsuario(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		Visita visita = new Visita();
		agente = request.getParameter("agente");			
		if (agente==null) {			
			HttpSession sessao = request.getSession();
			agente = (String) sessao.getAttribute("nome");
			visita.setAgente(agente);
			request.setAttribute("visita", visita);
	}
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

	protected void adicionaVisita(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		  concatenaEstagio="";
		  concatenaLarvicida="";
		  try {
				idnotificacao = Integer.parseInt(request.getParameter("idnotificacao"));				
		  } catch (Exception e) {	
				e.printStackTrace();			
		  }
		  status = request.getParameter("status");
		  agente = request.getParameter("agente");
		  System.out.println(agente);
		  bairro =  request.getParameter("bairro");
		   //data_string = request.getParameter("data_visita");
		  rua =  request.getParameter("rua");
		  quadra = request.getParameter("quadra");
		  lote = request.getParameter("lote");
		  numero =  request.getParameter("numero");
		  cidade =  request.getParameter("cidade");
		  latitude =  request.getParameter("latitude");
		  longitude =  request.getParameter("longitude");
		  tp_imovel =  request.getParameter("tp_imovel");
		  estagio =  request.getParameterValues("estagio");
		  tp_larvicida =  request.getParameterValues("tp_larvicida");
		  n_ini = request.getParameter("n_ini");
		  n_fim = request.getParameter("n_fim");
		  n_tubitos = request.getParameter("n_tubitos");
		  qt_larv1 = request.getParameter("qt_larv1");
		  qt_larv2 = request.getParameter("qt_larv2");
		  qt_adult1 = request.getParameter("qt_adult1");
		  qt_adult2 = request.getParameter("qt_adult2");
		  qt_focostratados = request.getParameter("qt_focostratados");
		  complemento = request.getParameter("complemento");
		  
		  try {			  
			  for (int i=0;i<7;i++){
				  if ("on".equals(request.getParameter("c"+(i+1))) && request.getParameter("c"+(i+1))!= null)
						dp[i]=1;
					else 
						dp[i]=0;		  
				 // System.out.println("DP"+i+"depois: " + dp[i]);  
			  }
	  
			  for (int i=0;i<7;i++){					
				  	if (!"".equals(request.getParameter("qt"+(i+1))) && request.getParameter("qt"+(i+1))!= null)
				  		qt[i]=Integer.parseInt(request.getParameter("qt"+(i+1)));				  	
				  	else 
				  		qt[i]=0;				  	
				  //System.out.println("QT"+i+"depois: " + qt[i]);  
			  }
			    
		  }catch (Exception e){
			  e.printStackTrace();
		  }
		  
		  
		try {
			
			visita.setIdnotificacao(idnotificacao);
			visita.setStatus(status);
			visita.setAgente(agente);
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			Date date = new Date();
			data_string = dateFormat.format(date);		
			data_visita = (Date) dateFormat.parse(data_string);
            visita.setData_visita(data_visita); 
            visita.setBairro(bairro);						
			visita.setRua(rua);
			visita.setQuadra(quadra);
			visita.setLote(lote);
			visita.setNumero(numero);
			visita.setCidade(cidade);  
			visita.setLatitude(latitude);
			visita.setLongitude(longitude);
			visita.setTp_imovel(tp_imovel);			
			visita.setDp1(dp[0]);	
			visita.setDp2(dp[1]);
			visita.setDp3(dp[2]);
			visita.setDp4(dp[3]);
			visita.setDp5(dp[4]);
			visita.setDp6(dp[5]);
			visita.setDp7(dp[6]);
			visita.setQt1(qt[0]);
			visita.setQt2(qt[1]);
			visita.setQt3(qt[2]);
			visita.setQt4(qt[3]);
			visita.setQt5(qt[4]);
			visita.setQt6(qt[5]);
			visita.setQt7(qt[6]);	
			visita.setN_ini(Integer.parseInt(n_ini));			
			visita.setN_fim(Integer.parseInt(n_fim));
			visita.setN_tubitos(Integer.parseInt(n_tubitos));
			visita.setQt_larv1(Integer.parseInt(qt_larv1));
			visita.setQt_larv2(Integer.parseInt(qt_larv2));
			visita.setQt_adult1(Integer.parseInt(qt_adult1));
			visita.setQt_adult2(Integer.parseInt(qt_adult2));
			visita.setQt_focostratados(Integer.parseInt(qt_focostratados));
			visita.setComplemento(complemento);
			notificacao.setIdnotificacao(idnotificacao);
			
						
			try {
				for (int i=0;i<estagio.length;i++){
					
					if(i==estagio.length-1)
						concatenaEstagio+=estagio[i];						
					else
						concatenaEstagio+=estagio[i] + ",";
				}			
			}catch(Exception erro){
				concatenaEstagio = "Não Encontrado";
			}
			
			visita.setEstagio(concatenaEstagio);			
		
			try {
				for (int i=0;i<tp_larvicida.length;i++){
					
					if(i==tp_larvicida.length-1)
						concatenaLarvicida+=tp_larvicida[i];						
					else
					concatenaLarvicida+=tp_larvicida[i] + ",";
				}	
			}catch(Exception erro){
				concatenaLarvicida = "Não Encontrado";
			}
			
			visita.setTp_larvicida(concatenaLarvicida);		

		} catch (Exception e) {
		}
		
		if (VisitaDAO.inserir(visita) == true)
			
				message = "Erro ao Gravar Registro";
		else
				message = "Registro Gravado com Sucesso";
		
		if (status.equalsIgnoreCase("Visitado")){
			notificacao.setData_visita(data_visita);
			if (VisitaDAO.alterarnotificacao(notificacao) == true) 
				message = "Erro ao Validadar Notificacao";
		}
	}
	    

	protected void editarVisita(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		   concatenaEstagio="";
		   concatenaLarvicida="";
		   agente = request.getParameter("agente");
		   //data_string = request.getParameter("data_visita");
		   bairro =  request.getParameter("bairro");
		   rua =  request.getParameter("rua");
		   quadra = request.getParameter("quadra");
		   lote = request.getParameter("lote");
		   numero =  request.getParameter("numero");
		   cidade =  request.getParameter("cidade");
		   latitude =  request.getParameter("latitude");
		   longitude =  request.getParameter("longitude");
		   tp_imovel =  request.getParameter("tp_imovel");		  
	       estagio =  request.getParameterValues("estagio");
		   tp_larvicida =  request.getParameterValues("tp_larvicida");
		   n_ini = request.getParameter("n_ini");
		   n_fim = request.getParameter("n_fim");
		   n_tubitos = request.getParameter("n_tubitos");
		   qt_larv1 = request.getParameter("qt_larv1");
		   qt_larv2 = request.getParameter("qt_larv2");
		   qt_adult1 = request.getParameter("qt_adult1");
		   qt_adult2 = request.getParameter("qt_adult2");
		   qt_focostratados = request.getParameter("qt_focostratados");
		   complemento = request.getParameter("complemento");

		   try {			  
				  for (int i=0;i<7;i++){
					  if ("on".equals(request.getParameter("c"+(i+1))) && request.getParameter("c"+(i+1))!= null)
							dp[i]=1;
						else 
							dp[i]=0;		  
					  System.out.println("DP"+i+"depois: " + dp[i]);  
				  }
		  
				  for (int i=0;i<7;i++){					
					  	if (!"".equals(request.getParameter("qt"+(i+1))) && request.getParameter("qt"+(i+1))!= null)
					  		qt[i]=Integer.parseInt(request.getParameter("qt"+(i+1)));				  	
					  	else 
					  		qt[i]=0;				  	
					  System.out.println("QT"+i+"depois: " + qt[i]);  
				  }
				    
			  }catch (Exception e){
				  e.printStackTrace();
			 }
		  
		try {
			
			visita.setAgente(agente);
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			Date date = new Date();
			data_string = dateFormat.format(date);		
			data_visita = (Date) dateFormat.parse(data_string);
	        visita.setData_visita(data_visita);     		
			visita.setIdvisita(idvisita);
			visita.setBairro(bairro);					
			visita.setRua(rua);
			visita.setQuadra(quadra);
			visita.setLote(lote);
			visita.setNumero(numero);
			visita.setCidade(cidade);
			visita.setLatitude(latitude);
			visita.setLongitude(longitude);
			visita.setTp_imovel(tp_imovel);
			visita.setDp1(dp[0]);	
			visita.setDp2(dp[1]);
			visita.setDp3(dp[2]);
			visita.setDp4(dp[3]);
			visita.setDp5(dp[4]);
			visita.setDp6(dp[5]);
			visita.setDp7(dp[6]);
			visita.setQt1(qt[0]);
			visita.setQt2(qt[1]);
			visita.setQt3(qt[2]);
			visita.setQt4(qt[3]);
			visita.setQt5(qt[4]);
			visita.setQt6(qt[5]);
			visita.setQt7(qt[6]);
			visita.setN_ini(Integer.parseInt(n_ini));			
			visita.setN_fim(Integer.parseInt(n_fim));
			visita.setN_tubitos(Integer.parseInt(n_tubitos));
			visita.setQt_larv1(Integer.parseInt(qt_larv1));
			visita.setQt_larv2(Integer.parseInt(qt_larv2));
			visita.setQt_adult1(Integer.parseInt(qt_adult1));
			visita.setQt_adult2(Integer.parseInt(qt_adult2));
			visita.setQt_focostratados(Integer.parseInt(qt_focostratados));
			visita.setComplemento(complemento);
			
			try {
				for (int i=0;i<estagio.length;i++){
					
					if(i==estagio.length-1)
						concatenaEstagio+=estagio[i];						
					else
						concatenaEstagio+=estagio[i] + ",";
				}			
			}catch(Exception erro){
				concatenaEstagio = "Não Encontrado";
			}
			
			visita.setEstagio(concatenaEstagio);			
		
			try {
				for (int i=0;i<tp_larvicida.length;i++){
					
					if(i==tp_larvicida.length-1)
						concatenaLarvicida+=tp_larvicida[i];						
					else
					concatenaLarvicida+=tp_larvicida[i] + ",";
				}	
			}catch(Exception erro){
				concatenaLarvicida = "Não Encontrado";
			}
			
			visita.setTp_larvicida(concatenaLarvicida);
				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Parametro incorreto.");
		}

		if (VisitaDAO.alterar(visita) == true)
			message = "Erro ao Alterar Registro";
		else
			message = "Registro Alterado com Sucesso";
	}
}