package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FuncaoDAO extends ConectaBanco {

	
	public boolean alterar(Funcao funcao) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update funcao SET nome_funcao = ? WHERE idfuncao = ? ");
		try {			
			pstmt.setString(1, funcao.getNome_funcao());
			pstmt.setInt(2, funcao.getIdfuncao());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(Funcao funcao) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from funcao where idfuncao = ?");
		try {
			
			pstm.setInt(1, funcao.getIdfuncao());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean inserir(Funcao funcao) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into funcao (nome_funcao) values (?)");
		try {			
			pstm.setString(1, funcao.getNome_funcao());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<Funcao> listar(String par_nome) throws SQLException {
		
		List<Funcao> lista = new ArrayList<Funcao>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from funcao where nome_funcao like ? order by nome_funcao asc");		
		try {
			pstm.setString(1, "%" + par_nome +"%");			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Funcao funcao = new Funcao();
				funcao.setIdfuncao(rs.getInt("idfuncao"));
				funcao.setNome_funcao(rs.getString("nome_funcao"));
				lista.add(funcao);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
	public Funcao consultar_editar(Funcao funcao) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from funcao where idfuncao = ?");
		try {			
			pstm.setInt(1, funcao.getIdfuncao());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {		
				
				funcao.setIdfuncao(rs.getInt("idfuncao"));
				funcao.setNome_funcao(rs.getString("nome_funcao"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return funcao;
	}
	
	public List<Funcao> populaComboFuncao() throws SQLException {
		
		List<Funcao> combofuncao = new ArrayList<Funcao>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select nome_funcao from funcao order by nome_funcao asc");
		try {
			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Funcao funcao = new Funcao();
				funcao.setNome_funcao(rs.getString("nome_funcao"));
				combofuncao.add(funcao);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return combofuncao;
	}

	public boolean existe(Funcao funcao) throws SQLException {
		boolean achou = false;
		
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idfuncao from funcao where idfuncao = ?");
		try {
			
			pstm.setInt(1, funcao.getIdfuncao());
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
}