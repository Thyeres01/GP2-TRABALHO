package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstagioDAO extends ConectaBanco {
	

	public boolean alterar(Estagio estagio) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update estagio SET nome_estagio = ? WHERE idestagio = ? ");
		try {			
			pstmt.setString(1, estagio.getNome_estagio());
			pstmt.setInt(2, estagio.getIdestagio());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(Estagio estagio) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from estagio where idestagio = ?");
		try {
			
			pstm.setInt(1, estagio.getIdestagio());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean inserir(Estagio estagio) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into estagio (nome_estagio) values (?)");
		try {			
			pstm.setString(1, estagio.getNome_estagio());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<Estagio> listar(String par_nome) throws SQLException {
		
		List<Estagio> lista = new ArrayList<Estagio>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from estagio where nome_estagio like ? order by nome_estagio asc");		
		try {
			pstm.setString(1, "%" + par_nome +"%");			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Estagio estagio = new Estagio();
				estagio.setIdestagio(rs.getInt("idestagio"));
				estagio.setNome_estagio(rs.getString("nome_estagio"));
				lista.add(estagio);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
	public Estagio consultar_editar(Estagio estagio) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from estagio where idestagio = ?");
		try {			
			pstm.setInt(1, estagio.getIdestagio());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {		
				
				estagio.setIdestagio(rs.getInt("idestagio"));
				estagio.setNome_estagio(rs.getString("nome_estagio"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return estagio;
	}
	
public List<Estagio> populaComboEstagio() throws SQLException {
		
		List<Estagio> comboestagio = new ArrayList<Estagio>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select nome_estagio from estagio order by nome_estagio asc");
		try {
			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Estagio estagio = new Estagio();
				estagio.setNome_estagio(rs.getString("nome_estagio"));
				comboestagio.add(estagio);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return comboestagio;
	}

	public boolean existe(Estagio estagio) throws SQLException {
		boolean achou = false;
		
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idestagio from estagio where idestagio = ?");
		try {
			
			pstm.setInt(1, estagio.getIdestagio());
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