package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TratamentoDAO extends ConectaBanco {

	public boolean alterar(Tratamento tratamento) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update tratamento SET nome_tratamento = ?,tp_tratamento = ? WHERE idtratamento = ? ");
		try {			
			pstmt.setString(1, tratamento.getNome_tratamento());
			pstmt.setString(2, tratamento.getTp_tratamento());
			pstmt.setInt(3, tratamento.getIdtratamento());
			pstmt.execute();			
			}catch (Exception e) {
				erro = true;
			}finally{
				pstmt.close();
				conexao.close();			
		}
		return erro;
	}

	public boolean excluir(Tratamento tratamento) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Delete from tratamento where idtratamento = ?");
		try {
			
			pstm.setInt(1, tratamento.getIdtratamento());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
	}
		return erro;
	}

	public boolean inserir(Tratamento tratamento) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Insert into tratamento (nome_tratamento,tp_tratamento) values (?,?)");
		try {			
			pstm.setString(1, tratamento.getNome_tratamento());
			pstm.setString(2, tratamento.getTp_tratamento());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}	
	
	public List<Tratamento> listar(String par_nome) throws SQLException {
		
		List<Tratamento> lista = new ArrayList<Tratamento>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from tratamento where nome_tratamento like ? order by nome_tratamento asc");		
		try {
			pstm.setString(1, "%" + par_nome +"%");			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Tratamento tratamento = new Tratamento();
				tratamento.setIdtratamento(rs.getInt("idtratamento"));
				tratamento.setNome_tratamento(rs.getString("nome_tratamento"));
				tratamento.setTp_tratamento(rs.getString("tp_tratamento"));
				lista.add(tratamento);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return lista;
	}
	
	public Tratamento consultar_editar(Tratamento tratamento) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from tratamento where idtratamento = ?");
		try {			
			pstm.setInt(1, tratamento.getIdtratamento());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {		
				
				tratamento.setIdtratamento(rs.getInt("idtratamento"));
				tratamento.setNome_tratamento(rs.getString("nome_tratamento"));
				tratamento.setTp_tratamento(rs.getString("tp_tratamento"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return tratamento;
	}
	
	public List<Tratamento> populaComboTratamento() throws SQLException {
		
		List<Tratamento> comboTratamento = new ArrayList<Tratamento>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select nome_tratamento, tp_tratamento from tratamento order by nome_tratamento asc");
		try {
			
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Tratamento tratamento  = new Tratamento();
				tratamento.setNome_tratamento(rs.getString("nome_tratamento"));
				comboTratamento.add(tratamento);
				tratamento.setTp_tratamento(rs.getString("tp_tratamento"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return comboTratamento;
	}

	public boolean existe(Tratamento tratamento) throws SQLException {
		boolean achou = false;
		
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao.prepareStatement("Select idtratamento from tratamento where idtratamento = ?");
		try {
			
			pstm.setInt(1, tratamento.getIdtratamento());
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