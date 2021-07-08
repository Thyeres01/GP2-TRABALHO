package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CidadeDAO extends ConectaBanco {

	public boolean alterar(Cidade cidade) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update cidade SET nome_cidade = ? WHERE idcidade = ? ");
		try {			
			pstmt.setString(1, cidade.getNome_cidade());
			pstmt.setInt(2, cidade.getIdcidade());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(Cidade cidade) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from cidade where idcidade = ?");
		try {
			
			pstm.setInt(1, cidade.getIdcidade());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean inserir(Cidade cidade) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into cidade (nome_cidade) values (?)");
		try {			
			pstm.setString(1, cidade.getNome_cidade());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<Cidade> listar(String par_nome) throws SQLException {
		
		List<Cidade> lista = new ArrayList<Cidade>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from cidade where nome_cidade like ? order by nome_cidade asc");		
		try {
			pstm.setString(1, "%" + par_nome +"%");			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Cidade cidade = new Cidade();
				cidade.setIdcidade(rs.getInt("idcidade"));
				cidade.setNome_cidade(rs.getString("nome_cidade"));
				lista.add(cidade);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
	public Cidade consultar_editar(Cidade cidade) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from cidade where idcidade = ?");
		try {			
			pstm.setInt(1, cidade.getIdcidade());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {		
				
				cidade.setIdcidade(rs.getInt("idcidade"));
				cidade.setNome_cidade(rs.getString("nome_cidade"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return cidade;
	}
	
	public List<Cidade> populaComboCidade() throws SQLException {
		
		List<Cidade> combocidade = new ArrayList<Cidade>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select nome_cidade from cidade order by nome_cidade asc");
		try {
			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Cidade cidade = new Cidade();
				cidade.setNome_cidade(rs.getString("nome_cidade"));
				combocidade.add(cidade);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return combocidade;
	}

	public boolean existe(Cidade cidade) throws SQLException {
		boolean achou = false;
		
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idcidade from cidade where idcidade = ?");
		try {
			
			pstm.setInt(1, cidade.getIdcidade());
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