package model;

public class Funcao {
	
	private int idfuncao;	
	private String nome_funcao;
	
	public int getIdfuncao() {
		return idfuncao;
	}
	public void setIdfuncao(int idfuncao) {
		this.idfuncao = idfuncao;
	}
	public String getNome_funcao() {
		return nome_funcao;
	}
	public void setNome_funcao(String nome_funcao) {
		this.nome_funcao = nome_funcao;
	}
	
	@Override
	public String toString() {
		return "Funcao [idfuncao=" + idfuncao + ", nome_funcao=" + nome_funcao + "]";
	}
	
}
