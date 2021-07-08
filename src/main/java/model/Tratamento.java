package model;

public class Tratamento {
	
	private int idtratamento;	
	private String nome_tratamento;
	private String tp_tratamento;
	public int getIdtratamento() {
		return idtratamento;
	}
	public void setIdtratamento(int idtratamento) {
		this.idtratamento = idtratamento;
	}
	public String getNome_tratamento() {
		return nome_tratamento;
	}
	public void setNome_tratamento(String nome_tratamento) {
		this.nome_tratamento = nome_tratamento;
	}
	public String getTp_tratamento() {
		return tp_tratamento;
	}
	public void setTp_tratamento(String tp_tratamento) {
		this.tp_tratamento = tp_tratamento;
	}
	@Override
	public String toString() {
		return "Tratamento [idtratamento=" + idtratamento + ", nome_tratamento=" + nome_tratamento + ", tp_tratamento="
				+ tp_tratamento + "]";
	}

	
}
