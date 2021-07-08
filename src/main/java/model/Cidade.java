package model;

public class Cidade {
	
	private int idcidade;	
	private String nome_cidade;
	
	public int getIdcidade() {
		return idcidade;
	}
	public void setIdcidade(int idcidade) {
		this.idcidade = idcidade;
	}
	public String getNome_cidade() {
		return nome_cidade;
	}
	public void setNome_cidade(String nome_cidade) {
		this.nome_cidade = nome_cidade;
	}
	
	@Override
	public String toString() {
		return "Cidade [idcidade=" + idcidade + ", nome_cidade=" + nome_cidade + "]";
	}
	
}
