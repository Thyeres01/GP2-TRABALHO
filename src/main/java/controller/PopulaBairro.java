package controller;

import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Bairro;
import model.BairroDAO;
import model.Cidade;
import model.CidadeDAO;


public class PopulaBairro {
	
	List<Bairro> combobairro = new ArrayList<Bairro>();
	List<Cidade> combocidade = new ArrayList<Cidade>();

	
public void  popularBairro() {	
		
		BairroDAO bairroDAO = new BairroDAO();
		CidadeDAO cidadeDAO = new CidadeDAO();
			
		try {
			combobairro = bairroDAO.populaComboBairro();
			combocidade = cidadeDAO.populaComboCidade();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}
