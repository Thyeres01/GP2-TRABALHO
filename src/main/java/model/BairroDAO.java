package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BairroDAO extends ConectaBanco {
	
	
	public boolean alterar(Bairro bairro) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update bairro SET nome_bairro = ? , nome_cidade = ? WHERE idbairro = ? ");
		try {			
			pstmt.setString(1, bairro.getNome_bairro());
			pstmt.setString(2, bairro.getNome_cidade());
			pstmt.setInt(3, bairro.getIdbairro());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(Bairro bairro) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from bairro where idbairro = ?");
		try {
			
			pstm.setInt(1, bairro.getIdbairro());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean inserir(Bairro bairro) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into bairro (nome_bairro,nome_cidade) values (?,?)");
		try {			
			pstm.setString(1, bairro.getNome_bairro());
			pstm.setString(2, bairro.getNome_cidade());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<Bairro> listar(String par_bairro, String par_cidade) throws SQLException {
		
		List<Bairro> lista = new ArrayList<Bairro>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from bairro where nome_bairro like ? and nome_cidade like ? order by nome_bairro asc");		
		try {
			pstm.setString(1, par_bairro +"%");			
			pstm.setString(2, par_cidade +"%");
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Bairro bairro = new Bairro();
				bairro.setIdbairro(rs.getInt("idbairro"));
				bairro.setNome_bairro(rs.getString("nome_bairro"));
				bairro.setNome_cidade(rs.getString("nome_cidade"));
				lista.add(bairro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
	public Bairro consultar_editar(Bairro bairro) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from bairro where idbairro = ?");
		try {			
			pstm.setInt(1, bairro.getIdbairro());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {		
				
				bairro.setIdbairro(rs.getInt("idbairro"));
				bairro.setNome_bairro(rs.getString("nome_bairro"));
				bairro.setNome_cidade(rs.getString("nome_cidade"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return bairro;
	}
	
public List<Bairro> populaComboBairro() throws SQLException {
		
		List<Bairro> combobairro = new ArrayList<Bairro>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select nome_bairro from bairro order by nome_bairro asc");
		try {
			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Bairro bairro = new Bairro();
				bairro.setNome_bairro(rs.getString("nome_bairro"));
				combobairro.add(bairro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return combobairro;
	}

	public boolean existe(Bairro bairro) throws SQLException {
		boolean achou = false;
		
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idbairro from bairro where idbairro = ?");
		try {
			
			pstm.setInt(1, bairro.getIdbairro());
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