package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoImovelDAO extends ConectaBanco {
	
	public boolean alterar(TipoImovel tipoimovel) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update tipoimovel SET nome_tpimovel = ? WHERE idimovel = ? ");
		try {			
			pstmt.setString(1, tipoimovel.getNome_tpimovel());
			pstmt.setInt(2, tipoimovel.getId_imovel());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(TipoImovel tipoimovel) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from tipoimovel where idimovel = ?");
		try {
			
			pstm.setInt(1, tipoimovel.getId_imovel());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean inserir(TipoImovel tipoimovel) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into tipoimovel (nome_tpimovel) values (?)");
		try {			
			pstm.setString(1,tipoimovel.getNome_tpimovel());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<TipoImovel> listar(String par_nome) throws SQLException {
		
		List<TipoImovel> lista = new ArrayList<TipoImovel>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from tipoimovel where nome_tpimovel like ? order by nome_tpimovel asc");		
		try {
			pstm.setString(1, "%" + par_nome +"%");			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				TipoImovel tipoimovel = new TipoImovel();
				tipoimovel.setId_imovel(rs.getInt("idimovel"));
				tipoimovel.setNome_tpimovel(rs.getString("nome_tpimovel"));
				lista.add(tipoimovel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
	public TipoImovel consultar_editar(TipoImovel tipoimovel) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from tipoimovel where idimovel = ?");
		try {			
			pstm.setInt(1, tipoimovel.getId_imovel());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {		
				
				tipoimovel.setId_imovel(rs.getInt("idimovel"));
				tipoimovel.setNome_tpimovel(rs.getString("nome_tpimovel"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return tipoimovel;
	}
	
	public List<TipoImovel> populaComboTipoImovel() throws SQLException {
		
		List<TipoImovel> combotpimovel = new ArrayList<TipoImovel>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select nome_tpimovel from tipoimovel order by nome_tpimovel asc");
		try {
			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				TipoImovel tpimovel = new TipoImovel();
				tpimovel.setNome_tpimovel(rs.getString("nome_tpimovel"));
				combotpimovel.add(tpimovel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return combotpimovel;
	}

	public boolean existe(TipoImovel tpimovel) throws SQLException {
		boolean achou = false;
		
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idimovel from tipoimovel where idimovel = ?");
		try {
			
			pstm.setInt(1, tpimovel.getId_imovel());
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