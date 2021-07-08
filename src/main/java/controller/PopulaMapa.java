package controller;

import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Bairro;
import model.BairroDAO;
import model.Cidade;
import model.CidadeDAO;
import model.Estagio;
import model.EstagioDAO;
import model.TipoImovel;
import model.TipoImovelDAO;

public class PopulaMapa {
	
	List<Bairro> combobairro = new ArrayList<Bairro>();
	List<Cidade> combocidade = new ArrayList<Cidade>();
	List<TipoImovel> combotipoimovel = new ArrayList<TipoImovel>();
	List<Estagio> comboestagio = new ArrayList<Estagio>();
		
public void  popularCombosMapa() {	
		
		BairroDAO bairroDAO = new BairroDAO();
		CidadeDAO cidadeDAO = new CidadeDAO();
		TipoImovelDAO imovelDAO = new TipoImovelDAO();
		EstagioDAO estagioDAO = new EstagioDAO();
	
		try {
			combobairro = bairroDAO.populaComboBairro();
			combocidade = cidadeDAO.populaComboCidade();
			combotipoimovel = imovelDAO.populaComboTipoImovel();
			comboestagio = estagioDAO.populaComboEstagio();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}
