package model;

public class Bairro {
	
	private int idbairro;	
	private String nome_bairro;
	private String nome_cidade
	;
	public int getIdbairro() {
		return idbairro;
	}
	public void setIdbairro(int idbairro) {
		this.idbairro = idbairro;
	}
	public String getNome_bairro() {
		return nome_bairro;
	}
	public void setNome_bairro(String nome_bairro) {
		this.nome_bairro = nome_bairro;
	}
	public String getNome_cidade() {
		return nome_cidade;
	}
	public void setNome_cidade(String nome_cidade) {
		this.nome_cidade = nome_cidade;
	}
	@Override
	public String toString() {
		return "Bairro [idbairro=" + idbairro + ", nome_bairro=" + nome_bairro + ", nome_cidade=" + nome_cidade + "]";
	}
	
	
	
}
