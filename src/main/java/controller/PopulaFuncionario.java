package controller;

import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Funcao;
import model.FuncaoDAO;


public class PopulaFuncionario {
	
	List<Funcao> combofuncao = new ArrayList<Funcao>(); 
	
public void  popularCombosFuncionario() {	
		
	FuncaoDAO funcaoDAO = new FuncaoDAO();
	try {
		combofuncao = funcaoDAO.populaComboFuncao();					
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	}
}
