package controller;

import java.util.List;


import java.sql.SQLException;
import java.util.ArrayList;

import model.Bairro;
import model.BairroDAO;
import model.Cidade;
import model.CidadeDAO;
import model.TipoImovel;
import model.TipoImovelDAO;

public class PopulaNotificacao {
	
	List<Bairro> combobairro = new ArrayList<Bairro>();
	List<Cidade> combocidade = new ArrayList<Cidade>();
	List<TipoImovel> combotipoimovel = new ArrayList<TipoImovel>();
	BairroDAO bairroDAO = new BairroDAO();
	CidadeDAO cidadeDAO = new CidadeDAO();
	TipoImovelDAO imovelDAO = new TipoImovelDAO();
		
public void  popularCombosNotificacao() {
	
		try {
			combobairro = bairroDAO.populaComboBairro();
			combocidade = cidadeDAO.populaComboCidade();
			combotipoimovel = imovelDAO.populaComboTipoImovel();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
