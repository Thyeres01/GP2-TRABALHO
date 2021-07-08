package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletCarregaMapa", urlPatterns = "/carregamapa")
public class ServletCarregaMapa extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PopulaMapa populamapa = new PopulaMapa();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
			
			doPost(request,response);
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			popularcombos(request,response);

			} catch (SQLException e) {
			e.printStackTrace();
		}	
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/mapa_foco.jsp");
		rd.forward(request, response);
		
	}	
	
	protected void popularcombos(HttpServletRequest request,
		    HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		populamapa.popularCombosMapa();		
		request.setAttribute("listacidade",populamapa.combocidade);	
		request.setAttribute("listabairro",populamapa.combobairro);
		request.setAttribute("listaimovel",populamapa.combotipoimovel);
		request.setAttribute("listaestagio",populamapa.comboestagio);
	}
}