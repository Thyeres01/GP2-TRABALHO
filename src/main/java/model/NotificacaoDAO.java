package model;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Notificacao;
import model.Visita;

/**
 * 
 * Classe de PersistÃªncia de dados dos objetos de Notificacao É "filha" da Classe
 * ConectaBanco.
 *
 */

public class NotificacaoDAO extends ConectaBanco {
	
	public boolean alterar(Notificacao notificacao) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstmt = conexao
				.prepareStatement("Update notificacao SET data_notificacao = ?, bairro = ?, rua = ?, quadra = ?, "
						+ "lote = ?, numero = ?, cidade = ?, tp_imovel = ?, desc_notificacao = ?, complemento = ?"
						+ " WHERE idnotificacao = ? ");
		try {			
			pstmt.setTimestamp(1,  new java.sql.Timestamp(notificacao.getData_notificacao().getTime()));  
			pstmt.setString(2, notificacao.getBairro());
			pstmt.setString(3, notificacao.getRua());
			pstmt.setString(4, notificacao.getQuadra());
			pstmt.setString(5, notificacao.getLote());
			pstmt.setString(6, notificacao.getNumero());
			pstmt.setString(7, notificacao.getCidade());
			pstmt.setString(8, notificacao.getTp_imovel());
			pstmt.setString(9, notificacao.getDesc_notificacao());			
			pstmt.setString(10, notificacao.getComplemento());
			pstmt.setInt(11, notificacao.getIdnotificacao());
			pstmt.execute();
			}catch (Exception e) {
				erro = true;					
			}finally{
				pstmt.close();
				conexao.close();			
			}
		return erro;
	}

	public boolean excluir(Notificacao notificacao) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Delete from notificacao where idnotificacao = ?");
		try {			
			pstm.setInt(1, notificacao.getIdnotificacao());
			pstm.execute();
		} catch (Exception e) {
			erro = true;
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}

	public boolean existe(Notificacao notificacao) throws SQLException {
		boolean achou = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select idnotificacao from notificacao where idnotificacao = ?");
		try {			
			pstm.setInt(1, notificacao.getIdnotificacao());
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

	public boolean inserir(Notificacao notificacao) throws SQLException {
		boolean erro = false;
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Insert into	notificacao (data_notificacao, bairro, rua, quadra, lote, numero, "
						+ "cidade, tp_imovel, desc_notificacao, complemento) values	(?,?,?,?,?,?,?,?,?,?)");
		try {			
			pstm.setTimestamp(1,  new java.sql.Timestamp(notificacao.getData_notificacao().getTime()));  
			pstm.setString(2, notificacao.getBairro());
			pstm.setString(3, notificacao.getRua());
			pstm.setString(4, notificacao.getQuadra());
			pstm.setString(5, notificacao.getLote());
			pstm.setString(6, notificacao.getNumero());
			pstm.setString(7, notificacao.getCidade());
			pstm.setString(8, notificacao.getTp_imovel());
			pstm.setString(9, notificacao.getDesc_notificacao());
			pstm.setString(10, notificacao.getComplemento());
			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
			erro = true;	
		}finally{
			pstm.close();
			conexao.close();			
		}
		return erro;
	}

	public List<Notificacao> listar(String par_bairro, String par_cidade, String par_tp_imovel, int par_verificado) throws SQLException {
		List<Notificacao> lista = new ArrayList<Notificacao>();
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from notificacao where bairro like ? and cidade like ? and tp_imovel like ? and verificado like ? order by data_notificacao asc");
		try {					
			pstm.setString(1, "%" + par_bairro +"%");
			pstm.setString(2, "%" + par_cidade +"%");
			pstm.setString(3, "%" + par_tp_imovel +"%");
			pstm.setInt(4,  par_verificado);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Notificacao notificacao = new Notificacao();
				notificacao.setIdnotificacao(rs.getInt("idnotificacao"));
				notificacao.setData_notificacao(rs.getTimestamp("data_notificacao"));
				notificacao.setData_visita(rs.getTimestamp("data_visita"));
				notificacao.setBairro(rs.getString("bairro"));
				notificacao.setRua(rs.getString("rua"));
				notificacao.setQuadra(rs.getString("quadra"));
				notificacao.setLote(rs.getString("lote"));
				notificacao.setNumero(rs.getString("numero"));
				notificacao.setCidade(rs.getString("cidade"));
				notificacao.setTp_imovel(rs.getString("tp_imovel"));
				notificacao.setDesc_notificacao(rs.getString("desc_notificacao"));
				lista.add(notificacao);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
		}
		return lista;
	}

	public Notificacao consultar_editar(Notificacao notificacao) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from notificacao where idnotificacao = ?");
		try {			
			pstm.setInt(1, notificacao.getIdnotificacao());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				notificacao.setIdnotificacao(rs.getInt("idnotificacao"));
				notificacao.setData_notificacao(rs.getTimestamp("data_notificacao"));
				notificacao.setBairro(rs.getString("bairro"));
				notificacao.setRua(rs.getString("rua"));
				notificacao.setLote(rs.getString("lote"));
				notificacao.setQuadra(rs.getString("quadra"));
				notificacao.setNumero(rs.getString("numero"));
				notificacao.setCidade(rs.getString("cidade"));
				notificacao.setTp_imovel(rs.getString("tp_imovel"));
				notificacao.setDesc_notificacao(rs.getString("desc_notificacao"));
				notificacao.setComplemento(rs.getString("complemento"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return notificacao;
	}
	
	public Visita verificar(Visita visita) throws SQLException {
		Connection conexao = getConexao();
		PreparedStatement pstm = conexao
				.prepareStatement("Select * from notificacao where idnotificacao = ?");
		try {			
			pstm.setInt(1, visita.getIdnotificacao());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				visita.setIdnotificacao(rs.getInt("idnotificacao"));
				visita.setBairro(rs.getString("bairro"));
				visita.setRua(rs.getString("rua"));
				visita.setLote(rs.getString("lote"));
				visita.setQuadra(rs.getString("quadra"));
				visita.setNumero(rs.getString("numero"));
				visita.setCidade(rs.getString("cidade"));
				visita.setTp_imovel(rs.getString("tp_imovel"));
				visita.setComplemento(rs.getString("complemento"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pstm.close();
			conexao.close();			
	}
		return visita;
	}
	
}