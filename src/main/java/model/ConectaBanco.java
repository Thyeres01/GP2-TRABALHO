package model;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 * Classe responsavel pela Conexao com o Banco de dados. É utilizada por outras
 * classes de persistencia de dados.
 * 
 */
public class ConectaBanco {
	public Connection getConexao() {
		Connection conexao = null;
		String usuario = "root";
		String senha = "12345678";
		String nomeBancoDados = "dbendemic";

		try {
			//String para sistemas antigos
				//Class.forName("com.mysql.jdbc.Driver");			
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());	
			conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + nomeBancoDados, usuario, senha);
		} catch (Exception e) {
			 e.printStackTrace();
			 JOptionPane.showMessageDialog(null, "Erro na Conex�o com o banco dbendemic","Aviso",JOptionPane.ERROR_MESSAGE);
		}
		return conexao;
	}
}