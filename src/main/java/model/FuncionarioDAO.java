package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Funcionario;

/**
 * 
 * Classe de PersistÃªncia de dados dos objetos de Funcionario
 * É "filha" da Classe ConectaBanco. 
 *
 */

public class FuncionarioDAO extends ConectaBanco {
	

	public boolean alterar(Funcionario funcionario) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update funcionario SET matricula = ?, nome = ?, funcao = ?, email = ?, senha = ? WHERE idfuncionario = ? ");
		try {			
			pstmt.setString(1, funcionario.getMatricula());
			pstmt.setString(2, funcionario.getNome());
			pstmt.setString(3, funcionario.getFuncao());
			pstmt.setString(4, funcionario.getEmail());
			pstmt.setString(5, funcionario.getSenha());
			pstmt.setInt(6, funcionario.getIdfuncionario());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(Funcionario funcionario) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from funcionario where idfuncionario = ?");
		try {
			
			pstm.setInt(1, funcionario.getIdfuncionario());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean existe(Funcionario funcionario) throws SQLException {
		boolean achou = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idfuncionario from funcionario where idfuncionario = ?");
		try {
			
			pstm.setInt(1, funcionario.getIdfuncionario());
			ResultSet rs = pstm.executeQuery();
			
			if (rs.next()) {
				achou = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERRO AO BUSCAR PARA EDIÇÃO");			
		}finally{
			pstm.close();
			conexao.close();			
		}
		return achou;
	}

	public boolean inserir(Funcionario funcionario) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into	funcionario (matricula, nome, funcao, email, senha) values	(?,?,?,?,?)");
		try {			
			pstm.setString(1, funcionario.getMatricula());
			pstm.setString(2, funcionario.getNome());
			pstm.setString(3, funcionario.getFuncao());
			pstm.setString(4, funcionario.getEmail());
			pstm.setString(5, funcionario.getSenha());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<Funcionario> listar(String par_nome, String par_funcao, String par_matricula) throws SQLException {
		
		List<Funcionario> lista = new ArrayList<Funcionario>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select * from funcionario where nome like ? and funcao like ? and matricula like ? order by nome asc");		
		try {
			/*Statement stm = conexao.createStatement();*/			
			pstm.setString(1, "%" + par_nome +"%");
			pstm.setString(2, "%" + par_funcao +"%");
			pstm.setString(3, "%" + par_matricula +"%");
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Funcionario funcionario = new Funcionario();
				funcionario.setIdfuncionario(rs.getInt("idfuncionario"));
				funcionario.setMatricula(rs.getString("matricula"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setFuncao(rs.getString("funcao"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setSenha(rs.getString("senha"));
				lista.add(funcionario);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
public Funcionario consultar_editar(Funcionario funcionario) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from funcionario where idfuncionario = ?");
		try {			
			pstm.setInt(1, funcionario.getIdfuncionario());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				funcionario.setIdfuncionario(rs.getInt("idfuncionario"));
				funcionario.setMatricula(rs.getString("matricula"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setFuncao(rs.getString("funcao"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setSenha(rs.getString("senha"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
		}
		return funcionario;
	}
	
public Funcionario buscarPorMatricula(String matricula) throws SQLException {
		Funcionario funcionario = new Funcionario();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select * from funcionario where matricula = ?");
		try {					
			pstm.setString(1, matricula);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				funcionario.setIdfuncionario(rs.getInt("idfuncionario"));
				funcionario.setMatricula(rs.getString("matricula"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setFuncao(rs.getString("funcao"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setSenha(rs.getString("senha"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
		}
		return funcionario;
	}		
}